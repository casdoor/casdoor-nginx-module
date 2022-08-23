local config = require "auth_plugin.conf"
local zhttp = require "resty.http"

-- get headers
local headers = ngx.req.get_headers()

-- get access_token from headers
local token = headers["access_token"]

-- init uri
local uri = ngx.var.uri

function is_include(uri, tab)
    if tab == nil then
        return false
    end
    for k, v in ipairs(tab) do
        if v == uri then
            return true
        end
    end
    return false
end

if (not token) or (token == ngx.null) then
    if ~is_include(uri, config.white_uri) then
        ngx.redirect(config.redirectUrl)
    end
else
    ngx.log(ngx.ERR, "token:" .. token)

end

