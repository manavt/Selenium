	#taking screen shot 
	require 'watir'
	browser = Watir::Browser.new :firefox
	browser.goto('https://photos3.walmart.com/')
        browser.screenshot.save "/Users/1228369/Desktop/#{rand(1..4)}.png"
	browser.close
