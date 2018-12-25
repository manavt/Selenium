	require 'watir'
	browser = Watir::Browser.new :firefox
	browser.goto('https://photos3.walmart.com/')
	sleep(10)
	browser.close
