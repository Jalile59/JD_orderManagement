
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
        @dv01 = Device.new(codearticle: 'KJHGB65', name: 'lecteur aimant', designation: 'A14', project: 'tsa');
        @dv02 = Device.new(codearticle: 'GHDZSQ', name: 'Gyro', designation: 'A13', project: 'tsa');

        @status01 = StatusOrder.new(name: 'En cours')
        @status02 = StatusOrder.new(name: 'cloturée')
        @status03 = StatusOrder.new(name: 'En attente')

        @ad01 = Addresse.new(name: 'Linz', localisation: '25 rue de la paix');
        @ad02 = Addresse.new(name: 'Gonesse', localisation: '12 rue foch');

        @dv01.save
        @dv02.save

        @ad01.save
        @ad02.save

        @status01.save
        @status02.save
        @status03.save
    end



    
end