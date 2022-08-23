config = {}

-- url for authorization
config.redirectUrl = "http://localhost:port/login/oauth/authorize?client_id=Client_id&redirect_uri=RedirectURL&response_type=code&scope=openid&state=STATE"

-- URIs in the white_uri don't need authentication
config.white_uri = {"/api/user/login"}

-- Request path to get accesstoken
config.access_url = "http://localhost:port/api/login/oauth/access_token"


config.grant_type = "authorization_code"

config.client_id = "client_id"

config.client_secret = "client_secret"

-- Request timeout
config.timeout = 10000

return config