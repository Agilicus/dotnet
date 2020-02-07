-- if x-forwarded-proto is set to https, then force all cookies to secure
local headers = ngx.req.get_headers()
if headers["x-forwarded-proto"] == "https" then

  local ck = require "resty.cookie"
  local cookie, err = ck:new()
  local fields, err = cookie:get_all()

  if fields then

    for k, v in pairs(fields) do
       local ok, err = cookie:set({
	 key = k,
	 value = v,
         path = "/",
         httponly = true,
	 secure = true,
         samesite = "Strict"
       })
    end

--   local fields1, err = cookie:get_all()
--   for k, v in pairs(fields) do
--      ngx.log(ngx.STDERR, "new => ", k, " => ", v)
--   end

  end

end

