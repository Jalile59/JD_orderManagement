class ApiOrderController < ApplicationController

  def createIssuesApi()
    @curl = 'curl -v -H "Content-Type: application/xml" -X POST --data-binary "@issue.xml" -H "X-Redmine-API-Key: 89f4699970d57ee28c1c63b9bff83e96fe5f613d" http://redmine/issues.xml'

  end

end
