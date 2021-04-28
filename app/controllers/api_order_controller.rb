class ApiOrderController < ApplicationController

  def createIssuesApi()


    uri = "http://192.168.1.26/issues.json?key=0756441090cfe440c2d237fd945a1dd48ef43f9a"
    uriGet =  "http://192.168.1.26/issues.json?key=89f4699970d57ee28c1c63b9bff83e96fe5f613d"

    issue = {
      "issue": {
        "project_id": 2,
        "subject": "obj",
        "priority_id":1,
        "tracker_id":1,
        "assigned_to_id":1,
        "description": "une description"
      }
    }

    objIssue = Issue.create(project_id: 2,
                            subject: "obj",
                            priority_id:1,
                            tracker_id:1,
                            assigned_to_id:1,
                            description: "une description"
    )
    puts("=>>>>>>>>>>>>>>>>>>>>>>>"+objIssue.to_json)

    header = {
      'Content-Type' => 'application/json',
      'X-Redmine-API-Key'=> '0756441090cfe440c2d237fd945a1dd48ef43f9a'
    }

    response =  HTTParty.post(uri,
                              :body => issue.to_json,
                              :headers => header)


    abort(response.inspect)
    render :nothing => true, :status => 200


  end



end
