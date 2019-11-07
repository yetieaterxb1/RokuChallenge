sub init()
    m.content_poster = m.top.FindNode("content_poster")
    m.header = m.top.FindNode("header")
end sub

sub onFeedChanged(obj)
    feed = obj.getData()
    m.header.text = feed.screen.title

' Attempted poster grid using JSON url data

    ' postercontent = createObject("roSGNode","ContentNode")
	  '   postercontent.url = feed.screen.logo
    ' showpostergrid(postercontent)
end sub

' Function show poster grid
' sub showpostergrid(content)
'   m.content_grid.content=content
'   m.content_grid.visible=true
'   m.content_grid.setFocus(true)
' end sub