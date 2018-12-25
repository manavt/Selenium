require 'watir'
require 'byebug'
browser = Watir::Browser.new :firefox
browser.goto 'https://photos3.walmart.com/'
byebug
#browser.element(class: "navbar-nav").text.split("\n").each do  | each_menu |
 # begin
browser.element(class: "navbar-nav").text 
 #   browser.element(text: each_menu).hover
 # rescue Watir::Exception::UnknownObjectException => e
 #   puts e.message
 # end
  #byebug if each_menu == "Photo Books"
  #sleep(1)
  #browser.a(text: 'Banners').click
#end
byebug
puts 'hello'
browser.close

#browser.divs(class: "dropdown-menu").each {| f | f.element(xpath: "//a[@class= 'megamenu-link']")}.last.innertext
#browser.element(class: ["nav-item", "dropdown", "mega"]).div(class: "dropdown-menu").ul(class: ["list-unstyled", "columns"]).li(class: "megamenu-sub-menu").locate
