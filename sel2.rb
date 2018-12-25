require 'watir'
require 'byebug'
browser = Watir::Browser.new :firefox
browser.goto 'https://photos3.walmart.com/'
# browser.window.maximize # to maximize the screen 
byebug
#resize_to
#move_to
#browser.wait_until { browser.h1.text != 'Main Page' }
# browser.driver.manage.window.move_to(0,0) to maximize the screen 
# browser.driver.manage.window.move_to(20,10) to move across the screen
# select all the values from nav-link
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

browser.close

#browser.divs(class: "dropdown-menu").each {| f | f.element(xpath: "//a[@class= 'megamenu-link']")}.last.innertext
#browser.element(class: ["nav-item", "dropdown", "mega"]).div(class: "dropdown-menu").ul(class: ["list-unstyled", "columns"]).li(class: "megamenu-sub-menu").locate
