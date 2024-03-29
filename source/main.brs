sub main()
  screen = createObject("roSGScreen")
  scene = screen.createScene("home_scene")
  screen.Show()
  port = createObject("roMessagePort")
  screen.setMessagePort(m.port)
  ' this loop is necessary to keep the application open
  ' otherwise the channel will exit when it reaches the end of main()
  while(true)

  end while
  ' Print information from Roku manifest
  app_info = createObject("roAppInfo")
  ? "App Title: ", app_info.getTitle()
  ? "App Version: ", app_info.getVersion()
  ? "Channel ID: ", app_info.getID()
  ? "isDev: ", app_info.isDev()
  ? "Custom Field: ", app_info.getValue("custom_field")
end sub