class ApiOrderController < ApplicationController

  def createIssuesApi(order, olddays)

    keyApi = Parameter.where(name:'keyAPI_redmine').first
    userId = Parameter.where(name:'userAssigned').first
    host = "http://"+ENV['host']
    #host = "http://192.168.1.26"

    uri = host+"/issues.json?key="+keyApi.value
    issue = {
      "issue": {
        "project_id": 1,
        "subject": "commande n°:"+order.id.to_s+" delais dépassé.",
        "priority_id":1,
        "tracker_id":1,
        "assigned_to_id":userId,
        "description": "le order traking numero: "+order.id.to_s+" à destination de "+order.destination.to_s+" n'a pas était mis à jours depuis "+olddays.abs.round.to_s+" jours,/n veuillez verifier <a href:'#'>cette commande</a> ."
      }
    }

    header = {
      'Content-Type' => 'application/json',
      'X-Redmine-API-Key'=> keyApi.value
    }

    response =  HTTParty.post(uri,
                              :body => issue.to_json,
                              :headers => header)

    if (response.code == 200)
      render json: issue
    elsif (response.code == 401)
      render json:  {
        error: "unauthorized",
        status: 401
      }

    end
  end

  def checkifDayIsExpired()
    days = Parameter.where(name:'dayRecall').first

    @orders = Order.all
    issuscreated = 0
    @orders.each do |obj|

      if(obj.dateUptaded.nil?)
        oldDays = obj.dateCreated - Time.now
        puts '>>>>>>>>>>> days old created = '+(oldDays/86400).abs.round.to_s
      else
        oldDays = obj.dateUptaded - Time.now
        puts '>>>>>>>>>>> days old updated = '+(oldDays/86400).abs.round.to_s
      end

      if ((oldDays/86400).abs >= days.value.to_i)
        createIssuesApi(obj, (oldDays/86400))
        issuscreated = issuscreated +1
      end

    end

    render json:  {
      issuecreated: issuscreated,
      status: 200
    }
  end




end
