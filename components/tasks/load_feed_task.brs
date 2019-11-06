sub init()
  m.top.functionname = "request"
  m.top.response = ""
end sub

function request()
  url = m.top.url
  http = createObject("roUrlTransfer")
  http.RetainBodyOnError(true)
  port = createObject("roMessagePort")
  http.setPort(port)
  http.setCertificatesFile("common:/certs/ca-bundle.crt")
  http.InitClientCertificates()
  http.AddHeader("secret-key","$2a$10$svzjkniKBQUmA2ys6NILe.TR3z98VydOwoDe0X3dREcjoci90YGP6")
  http.setUrl(url)
  if http.AsyncGetToString() then
    msg = wait(0, port)
    if (type(msg) = "roUrlEvent") then
      'HTTP response code can be <0 for Roku-defined errors
      if (msg.GetResponseCode() > 0 and  msg.GetResponseCode() < 400) then
        m.top.response = msg.GetString()
      else
        ? "ERROR -- \n\tin function request(...) --- \n\t\tRequest failed with satus";  msg.GetResponseCode(); "\n\t\tCheck URL and authentication in the request header."
				m.top.response = "{'error': '"; msg.GetResponseCode(); "'}"
      end if
      http.AsyncCancel()
    else
      ? "feed load failed."
      m.top.response =""
      http.AsyncCancel()
    end if
  end if
end function
