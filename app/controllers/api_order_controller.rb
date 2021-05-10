class ApiOrderController < ApplicationController

  def createIssuesApi(order, olddays)

    keyApi = Parameter.where(name:'keyAPI_redmine').first
    userId = Parameter.where(name:'userAssigned').first
    host = "http://"+ENV['host']
    pathOrder = order_path(order.project, order.id)
    #host = "http://192.168.1.26"

    uri = host+"/issues.json?key="+keyApi.value
    issue = {
      "issue": {
        "project_id": 1,
        "subject": "Commande n°:"+order.id.to_s+" delais dépassé.",
        "priority_id":1,
        "tracker_id":1,
        "assigned_to_id":userId,
        "description": "le order traking numero: "+order.id.to_s+" à destination de "+order.destination.to_s+" n'a pas était mis à jours depuis "+olddays.abs.round.to_s+" jours,/n veuillez verifier cette commande: "+host.to_s+pathOrder.to_s+" ."
      }
    }

    header = {
      'Content-Type' => 'application/json',
      'X-Redmine-API-Key'=> keyApi.value
    }

    response =  HTTParty.post(uri,
                              :body => issue.to_json,
                              :headers => header)
    logger.info(Time.now.to_s+" -> issues created for order id="+order.id.to_s+" "+ENV['pluginName']+" satutcode request= "+response.code.to_s)

    if(response.code == 201)
      order.update(notified: true )
    end

    return  response.code


  end

  def checkifDayIsExpired()
    days = Parameter.where(name:'dayRecall').first
    @orders = Order.where(notified: false )
    issuscreated = 0

    logger.info(Time.now.to_s+" check old order "+ENV['pluginName'])

    @orders.each do |obj|

      if(obj.dateUptaded.nil?)
        oldDays = obj.dateCreated - Time.now
        puts '>>>>>>>>>>> days old created = '+(oldDays/86400).abs.round.to_s
      else
        oldDays = obj.dateUptaded - Time.now
        puts '>>>>>>>>>>> days old updated = '+(oldDays/86400).abs.round.to_s
      end

      if ((oldDays/86400).abs >= days.value.to_i)
        @result = createIssuesApi(obj, (oldDays/86400))
        issuscreated = issuscreated +1
      end
    end
    logger.info(Time.now.to_s+" status code "+@result.to_s+" "+ENV['pluginName'])

    if (@result == 201 or @result == 204)
      render json:  {
        issuecreated: issuscreated,
        status: 201
      }
    elsif (@result == 401)
      render json:  {
        error: "unauthorized",
        status: 401
      }
    else
      render json:  {
        reponse: "no issue created",
        status: 200
      }
      end
  end




end
