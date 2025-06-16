import jwt
import os

print(dir(jwt))

#key='super-secret'
#payload={"id":"1","email":"myemail@gmail.com" }
#token = jwt.encode(payload, key)
#print (token)

token = os.getenv("RASA_PRO_LICENSE")

decoded = jwt.decode(token, options={"verify_signature": False}) # works in PyJWT >= v2.0
print (decoded)
print (decoded["email"])

print( jwt.get_unverified_header(token) )

"""
Example:

{'jti': '4504af24-cc36-4aca-aac5-783ecbf5f6c9', 'iat': 1704302066, 'nbf': 1704302017, 'scope': 'rasa:pro rasa:enterprise rasa:studio', 'exp': 1767139200, 'email': 'j.trammell@rasa.com', 'company': 'Rasa'}

jti: JWT Token ID, (nonce to prevent replays)
iat: issued at







"""
