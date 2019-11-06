sub main()
  m.port = createObject("roMessagePort")
	screen = createObject("roSGScreen")
	screen.setMessagePort(m.port)
	scene = screen.createScene("home_scene")
	screen.Show()
  ' this loop is necessary to keep the application open
  ' otherwise the channel will exit when it reaches the end of main()
  while(true)
		msg = wait(0, m.port)
		msgType = type(msg)
		if msgType = "roSGScreenEvent"
			if msg.isScreenClosed() then return
		end if
  end while
  ' Print information from Roku manifest
  app_info = createObject("roAppInfo")
  ? "App Title: ", app_info.getTitle()
  ? "App Version: ", app_info.getVersion()
  ? "Channel ID: ", app_info.getID()
  ? "isDev: ", app_info.isDev()
  ? "Custom Field: ", app_info.getValue("custom_field")
end sub