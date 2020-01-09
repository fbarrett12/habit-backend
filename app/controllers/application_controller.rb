class ApplicationController < ActionController::API
    def secret
        ENV["JWT_SECRET_KEY"]
    end

    def createToken(user)
        JWT.encode({'id': user[:data][:id]}, secret, 'HS256')
    end

    def tokenForAccount(user)

        { id: user[:data][:id],
          token: createToken(user),
          userInfo: user[:data][:attributes]
        }
    end

    def decodeToken
        if request.headers["Authorization"]
            token = request.headers["Authorization"].split(' ')[1]
            begin
              decoded = JWT.decode(token, secret, true, {algorithm: 'HS256'})
                rescue JWT::VerificationError
              return nil
            end
    
            decoded            
        end
    end

    def getIdFromToken
        decoded = decodeToken
        unless decoded && decoded[0] && decoded[0]['id']
          return nil
        end

        decoded[0]['id']
      end
    
    # def getClassFromToken
    #     decoded = decodeToken

    #     unless decoded && decoded [0] && decoded[0]['role']
    #       return nil
    #     end

    #     decoded[0]['role']
    # end
      
    def authorized?(user)
        getIdFromToken == user.id
    end
end
