Selenium - Selenium is a software tool which helps to automate the frontend test cases. Rather doing manually , one can easily automate the test cases with the help of watir which is a gem available on rubygems.org for selenium.
Selenium was created by Jason Huggins in 2004.

	 Selenium Components
		Selenium IDE
			Firefox extension that can automate the browser through a record-and-playback feature. 
 
		Selenium RC(Selenium Remote Control) 
			In earlier days, testers were force to download the complete application in thier local machine and do the testing but later RC was introduced to over this issue.

		WebDriver
			It was the first cross-platform testing framework that could control the browser from the OS level.  

		Selenium Grid
			To address the need of minimizing test execution times as much as possible.
			He initially called the system "Hosted QA." It was capable of capturing browser screenshots during significant stages,	
			and also of sending out Selenium commands to different machines simultaneously.




We are going to use watir gem to see all the selenium features and later i will introduced you with the Cucumber framework.
	you can go and read more explanation about watir on this link 
	https://rubygems.org/gems/watir/versions/5.0.0
        install watir gems and verify it by typing below command in terminal
	gem list watir	

Lets write our first ruby script to see how watit works.


fileName : sel_part1.rb
codeExample1 : 
	require 'watir'
	browser = Watir::Browser.new :firefox
	browser.goto('https://photos3.walmart.com/')
	sleep(10)
	browser.close



Next: Introduction about locate, element and elements 
codeExample2:
fileName : sel_part2.rb
	Lets show one alert message with title to the page
	require 'watir'
	browser = Watir::Browser.new :firefox
	browser.goto('https://photos3.walmart.com/')
        title = browser.title
        browser.execute_script("alert('#{title}')")
        if browser.alert.exists?
          browser.alert.ok
          browser.alert.close
        end
	sleep(10)
	browser.close 

codeExample3:
fileName : sel_part3.rb
	# maximize, resize_to and move_to function 
 	require 'watir'
	browser = Watir::Browser.new :firefox
	browser.goto('https://photos3.walmart.com/')
        browser.window.maximize
        sleep(2)
        # below lines can used as well to maximize the screen 
	# browser.driver.manage.window.move_to(0,0)
        browser.driver.manage.window.move_to(10,10)
        sleep(2)
        browser.driver.manage.window.resize_to(40,40)
	sleep(2)
	browser.close

codeExample4:
	#taking screen shot 
	require 'watir'
	browser = Watir::Browser.new :firefox
	browser.goto('https://photos3.walmart.com/')
        browser.screenshot.save "/Users/1228369/Desktop/#{rand(1..4)}.png"
	browser.close

codeExample5:
	Use Faker gem 
        require 'faker'
	Faker::Name.first_name, Faker::Name.last_name, Faker::Address.city

codeExample6:
	# Extracting data, Following links, Filling in a form
	#http://watir.com/guides/form-example/
	Performing different actions on main object 
	Object.link(id: 'id-name').click
	Object.text_field(id: 'id-name').set 'value'
	Object.button(name: 'commit').click
	# select list elements can select by either text or value
	Object.select_list(id: 'id-name').select Faker::Address.state
	Object.radio(text: 'text-value').set
	# Date Field elements accept Date objects
	birthday = Faker::Date.birthday
	Object.date_field.set birthday

	age = Date.today.year - birthday.year
	Object.text_field(id: 'address_age').set age
	# File Field elements upload files with the `#set` method, but require the full system path
	file_name = 'watir_example.text'
	File.write(file_name, '')
	path = File.expand_path(file_name)
	Object.file_field(id: 'address_picture').set path

	# Checkboxes can be selected by `label` or `text` locators
	Object.checkbox(label: 'Dancing').set

	Object.textarea(id: 'address_note').set 'See, filling out a form with Watir is easy!'
	Object.button(data_test: 'submit').click

Note : How to use iterators in watir

Finding based on tags 

Obsolute and relative path

:xpath, "//tagname[@identifier = 'value']//tag"	
        
FINDERS =
{
  :class             => 'ClassName',
  :class_name        => 'ClassName',
  :css               => 'CssSelector',
  :id                => 'Id',
  :link              => 'LinkText',
  :link_text         => 'LinkText',
  :name              => 'Name',
  :partial_link_text => 'PartialLinkText',
  :tag_name          => 'TagName',
  :xpath             => 'Xpath',
}


codeExample7:
        # print menus and submenus 
	#report, writting into a CSV using csv command 
        require 'watir'
	browser = Watir::Browser.new :firefox
	browser.goto('https://photos3.walmart.com/')
        menu_items = menu_items = browser.as(class: "nav-link").map {|f| f.text} #browser.element(class: "navbar-nav").text
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


codeExample8:
	#report, writting into a CSV using csv command


 			 
