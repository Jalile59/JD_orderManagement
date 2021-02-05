
class Tools

    def initialize(message)
        @message = message
      end

    def checkIfRoleIsAllowProject(idmebreRole)
        idRole = MemberRole.find(idmebreRole)

        role = Role.find(idRole.role_id)
        roles = role.permissions
        #abort(role.permissions.to_s)

        roles.each {|n|
        if n == 'orders'
            return true
        end
        
        }
        return false
    end

    
end