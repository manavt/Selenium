        # print menus and submenus 
        require 'watir'
	browser = Watir::Browser.new :firefox
	browser.goto('https://photos3.walmart.com/')
        #menu_items = menu_items = browser.as(class: "nav-link").map {|f| f.text} #browser.element(class: "navbar-nav").text
	# select only those values where nav-link have dropdown-toggle
	menu_items = browser.as(class: ["nav-link", "dropdown-toggle"]).map {|f| f.text}
	menu_items.each do  | each_menu |
  	  begin
    	    browser.element(text: each_menu).hover
            sub_menu_items = browser.element(class: "navbar-nav").text
            puts "#{each_menu} -> #{sub_menu_items.split("\n") - menu_items}" 
          rescue Watir::Exception::UnknownObjectException => e
            puts e.message
          end
       end
	sleep(2)
	browser.close
