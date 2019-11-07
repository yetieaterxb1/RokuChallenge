function init()
	? "[home_scene] init"
	m.category_screen = m.top.findNode("category_screen")
	m.content_screen = m.top.findNode("content_screen")

	m.category_screen.observeField("category_selected", "onCategorySelected")
	m.category_screen.setFocus(true)
end function

sub onCategorySelected(obj)
    ? "onCategorySelected field: ";obj.getField()
    ? "onCategorySelected data: ";obj.getData()
    list = m.category_screen.findNode("category_list")
    ? "onCategorySelected checkedItem: ";list.checkedItem
    ? "onCategorySelected selected ContentNode: ";list.content.getChild(obj.getData())
    item = list.content.getChild(obj.getData())
    loadFeed(item.feed_url)
end sub

sub loadFeed(url)
  m.feed_task = createObject("roSGNode", "load_feed_task")
  m.feed_task.observeField("response", "onFeedResponse")
  m.feed_task.url = url
  m.feed_task.control = "RUN"
end sub

function evenArray(array) as Object
	topFive = []
	for each number in array
		if number mod 2 = 0 and topFive.Count() < 5 then
			topFive.push(number)
			end if
	end for
	return topFive
end function

function firstFiveArray(array) as Object
	firstFive = []
	newArray = array
	newArray.Sort("r")
	for each number in newArray
		if firstFive.Count() = 5 then
			return firstFive
		else
			firstFive.push(number)
		end if
		end for
end function

Function tostr(any)
    ret = AnyToString(any)
    if ret = invalid ret = type(any)
    if ret = invalid ret = "unknown" 'failsafe
    return ret
End Function

sub onFeedResponse(obj)
	response = obj.getData()
	data = parseJSON(response)
	data_sort = data.data
	data_sort.Sort("r")
	if data <> Invalid and data.screens <> invalid
		if m.category_screen.category_selected = 0 then
			a_data = firstFiveArray(data_sort)
			m.content_screen.feed_data = {
				screen: data.screens.a,
				data: a_data
				}
		end if
		if m.category_screen.category_selected = 1 then
			b_data = evenArray(data_sort)
			m.content_screen.feed_data = {
				screen: data.screens.b,
				data: b_data
				}
		end if
		m.category_screen.visible = false
		m.content_screen.visible = true
	else
		? "FEED RESPONSE IS EMPTY!"
	end if
end sub


