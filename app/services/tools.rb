
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



    
end