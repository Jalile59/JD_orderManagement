
class Checkfile

    def initialize(fileUpload)
      @file = fileUpload
    end


    def getExtention()
        nameFile = @file.original_filename
         extension = nameFile.split('.')
         return extension[1]
    end

    def checkSizeFile()

        if( @file.size >= 800000)
            return false           
        else
            return true
        end
         
    end

    def isPDF()
        nameFile = @file.original_filename
         extension = nameFile.split('.')
         if extension[1].downcase == "pdf"
             return true
         else
             return false
         end
         return extension[1]
    end
    
end