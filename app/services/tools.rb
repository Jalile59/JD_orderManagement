
class Tools

    def initialize(message)
        @message = message
      end

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

    
end