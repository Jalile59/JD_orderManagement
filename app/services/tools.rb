
class Tools

    def initialize(message)
        @message = message
      end

    def checkIfRoleIsAllowProject(idmebreRole)
        idRole = MemberRole.find(idmebreRole)

        role = Role.find(idRole.role_id)
        roles = role.permissions
        
        puts roles
        roles.each {|n|
            
        if n.eql?("orders")
            return true
        end

        }
        return roles.include? 'orders'
    end

    
end