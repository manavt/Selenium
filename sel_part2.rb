	require 'watir'
	browser = Watir::Browser.new :firefox
	browser.goto('https://photos3.walmart.com/')
        title = browser.title
        browser.execute_script("alert('#{title}')")
        sleep(2)
        if browser.alert.exists?
          browser.alert.ok
        # browser.alert.close
        end
	sleep(2)
	browser.close 
