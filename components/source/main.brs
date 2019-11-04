sub main()
    ' Print information from Roku manifest
    app_info = createObject("roAppInfo")
    ? "App Title: ", app_info.getTitle()
    ? "App Version: ", app_info.getVersion()
    ? "Channel ID: ", app_info.getID()
    ? "isDev: ", app_info.isDev()
    ? "Custom Field: ", app_info.getValue("custom_field")
end sub