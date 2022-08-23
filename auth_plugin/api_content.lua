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


local config = require "auth_plugin.conf"
local zhttp = require "resty.http"
local httpc = zhttp.new()

local code = ngx.var.arg_code
httpc:set_timeout(config.timeout)

-- get access_token
local res, err_ = httpc:request_uri(config.access_url, {
    method = "POST",
    body = "grant_type=" .. config.grant_type .. "&client_id=" .. config.client_id .. "&client_secret=" ..
        config.client_secret .. "&code=" .. code,
    headers = {
        ["Content-Type"] = "application/x-www-form-urlencoded"
    }
})
httpc:close()
if not res then
    ngx.say(err_)
    return nil, err_
else
    if res.status == 200 then
        ngx.say(res.body)
        return res.body, err_
    else
        ngx.say(err_)
        return nil, err_
    end
end
