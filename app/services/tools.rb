
class Tools



    def checkIfRoleIsAllowProject(idmebreRole)
        idRole = MemberRole.find(idmebreRole)

        role = Role.find(idRole.role_id)
        roles = role.permissions
        
        roles.each {|n|
            
        if n.to_s == "orders"
            return true
        end
        }

        return roles.include? 'orders'
    end

    def checkUpload(uploaded_io)

        if(uploaded_io.size > 800000)
            return false           
        end
         
    end

    def addFixtures

        if (Parameter.where(name:'keyAPI_redmine').first.nil?)
            @paramKeyApi = Parameter.new(name: 'keyAPI_redmine', value: '')
            @paramKeyApi.save
        end

        if (Parameter.where(name:'userAssigned').first.nil?)
            @paramUserassignedTicket = Parameter.new(name: 'userAssigned', value: '')
            @paramUserassignedTicket.save
        end

        if (Parameter.where(name:'dayRecall').first.nil?)
            @dayRecall = Parameter.new(name: 'dayRecall', value: '')
            @dayRecall.save
        end

        if (Parameter.where(name:'keyAPI_dhl').first.nil?)
            @keyApiDhl = Parameter.new(name: 'keyAPI_dhl', value: '')
            @keyApiDhl.save
        end

        if (Group.where(lastname:'commandeSAV').first.nil?)
            @group = Group.new(lastname: 'commandeSAV')
            @group.save
        end

        if (StatusOrder.where(name:'En cours').first.nil?)
            @status01 = StatusOrder.new(name: 'En cours')
            @status01.save
        end

        if (StatusOrder.where(name:'En cours').first.nil?)
            @status02 = StatusOrder.new(name: 'cloturée')
            @status02.save
        end








    end



    
end