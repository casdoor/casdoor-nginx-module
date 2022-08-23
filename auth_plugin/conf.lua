-- Copyright 2022 The Casdoor Authors. All Rights Reserved.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.


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