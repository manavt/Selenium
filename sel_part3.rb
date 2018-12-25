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
