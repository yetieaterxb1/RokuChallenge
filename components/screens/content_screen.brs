sub init()
    m.content_poster = m.top.FindNode("content_poster")
    m.header = m.top.FindNode("header")
end sub

sub onFeedChanged(obj)
    feed = obj.getData()
    ? "feed =" ; feed
    ?"feed title = "; feed.title
    m.header.text = feed.title
    ' postercontent = createObject("roSGNode","ContentNode")
    '   node = createObject("roSGNode","ContentNode")
    '     node.SHORTDESCRIPTIONLINE1 = "test"
    '     postercontent.appendChild(node)
    ' showposter(postercontent)
end sub

' sub showposter(content)
'   ?"poster content = ";content
'   m.content_poster.content=content
'   m.content_poster.visible=true
'   m.content_poster.setFocus(true)
' end sub