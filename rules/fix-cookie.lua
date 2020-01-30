-- if x-forwarded-proto is set to https, then force all cookies to secure
if ngx.header["x-forwarded-proto"] == "https" then

  local ck = require "resty.cookie"
  local cookie, err = ck:new()
  local fields, err = cookie:get_all()

  if fields then

    for k, v in pairs(fields) do
       ngx.log(ngx.STDERR, k, " => ", v)
       local ok, err = cookie:set({
	 key = k,
	 value = v,
	 secure = true
       })
    end

    local fields1, err = cookie:get_all()
    for k, v in pairs(fields) do
       ngx.log(ngx.STDERR, "new => ", k, " => ", v)
    end

  end

end

