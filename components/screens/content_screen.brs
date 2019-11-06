sub init()
    m.content_poster = m.top.FindNode("content_poster")
    m.header = m.top.FindNode("header")
    m.category_screen = m.top.findNode("category_screen")
end sub

sub onFeedChanged(obj)
    feed = obj.getData()
    ?"m.category_screen = " ; m
    ? "feed =" ; feed.screens
    if feed.screens = 0 then
        m.header.text = "Screen A"
        else
        m.header.text = "Screen B"
        end if
    postercontent = createObject("roSGNode","ContentNode")
    for  i=0 to 1 step 1
      node = createObject("roSGNode","ContentNode")
      if m.category_screen.getData() = 0 then
         node.SDPOSTERURL = "https://1pvvpp2jnvcy2rs9592n4mtq-wpengine.netdna-ssl.com/wp-content/uploads/2017/09/Spectrum-logo.png"
        else
        node.SDPOSTERURL = "https://1pvvpp2jnvcy2rs9592n4mtq-wpengine.netdna-ssl.com/wp-content/uploads/2017/09/Spectrum-logo.png"
        node.SHORTDESCRIPTIONLINE1 = "test"
        postercontent.appendChild(node)
        end if
    end for
    showposter(postercontent)
end sub

sub showposter(content)
  m.content_poster.content=content
  m.content_poster.visible=true
  m.content_poster.setFocus(true)
end sub