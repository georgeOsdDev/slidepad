# -----------------------------
# Prepare

# Get our formatted site title as defined by out docpad.cson file
siteTitle = @getPreparedTitle()

# Merge our site keywords with our documents keywords and stringify
siteKeywords = @getPreparedKeywords()


siteDescription = @getPreparedKeywords()


# -----------------------------
# Document

doctype 5
html lang: 'en', ->

	# -----------------------------
	# Document Header

	head ->
		# -----------------------------
		# Meta Information

		# Set our charset to UFT8 (oldshool method)
		meta charset:'utf-16'

		# Set our charset to UFT8 (newschool method)
		meta 'http-equiv':'content-type', content:'text/html; charset=utf-8'

		# Always use the latest rendering engine
		meta 'http-equiv':'X-UA-Compatible', content:'IE=edge,chrome=1'

		# Set our defualt viewport (window size and scaling) for mobile devices
		meta name:'viewport', content:'width=device-width, initial-scale=1'

		# SEO: Set our page title that will show up in search engine results
		meta name:'title', content:h(siteTitle)

		# SEO: Set the name of the author who wrote this page
		meta name:'author', content:h(@document.author or @site.author)

		# SEO: Set the email of the author who wrote this page
		meta name:'email', content:h(@document.email or @site.email)

		# SEO: Set the description of this page
		meta name:'description', content:h(siteDescription)

		# SEO: Set the keywords of this page
		meta name:'keywords', content:h(siteKeywords)

		# Output meta data set by DocPad and it's plugins
		text @getBlock('meta').toHTML()

		# Page title as shown in the browser tab and window
		title siteTitle
	
		# Icons
		link rel:'shortcut icon'               , href:'ico/favicon.ico'
		link rel:'apple-touch-icon-precomposed', href:'ico/apple-touch-icon-144-precomposed.png', sizes:'144x144'
		link rel:'apple-touch-icon-precomposed', href:'ico/apple-touch-icon-114-precomposed.png', sizes:'114x114'
		link rel:'apple-touch-icon-precomposed', href:'ico/apple-touch-icon-72-precomposed.png',  sizes:'72x72'
		link rel:'pple-touch-icon-precomposed' , href:'ico/apple-touch-icon-57-precomposed.png'

		# -----------------------------
		# Style and Script for head tag
		switch @document.layout
			when 'big.html.coffee'
				link rel:'stylesheet', href:'/vendor/big/big.css', type:'text/css'
				script src:'/vendor/big/big.js'

			when 'deck.html.coffee'
				text @getBlock('styles').add([
					'/vendor/deck/core/deck.core.css'
					# Chose extentions
					'/vendor/deck/extensions/goto/deck.goto.css'
					'/vendor/deck/extensions/menu/deck.menu.css'
					'/vendor/deck/extensions/navigation/deck.navigation.css'
					'/vendor/deck/extensions/status/deck.status.css'
					'/vendor/deck/extensions/hash/deck.hash.css'
					'/vendor/deck/extensions/scale/deck.scale.css'
					# Chose style
					'/vendor/deck/themes/style/swiss.css'
					# '/vendor/deck/themes/style/neon.css'
					# '/vendor/deck/themes/style/web-2.0.css'
					'/vendor/deck/themes/transition/horizontal-slide.css'
					# '/vendor/deck/themes/transition/vertical-slide.css'
					# '/vendor/deck/themes/transition/fade-slide.css'
				]).toHTML()
				script src:'/vendor/deck/modernizr.custom.js'

			when 'h5slides.html.coffee'
				script src:'http://html5slides.googlecode.com/svn/trunk/slides.js'
			
			when 'impress.html.coffee'
				# write own style
				text @getBlock('styles').add([
					'http://fonts.googleapis.com/css?family=Open+Sans:regular,semibold,italic,italicsemibold|PT+Sans:400,700,400italic,700italic|PT+Serif:400,700,400italic,700italic'
					'/vendor/impress/css/impress-demo.css'
				]).toHTML()

			else # default style is twitter-bootstrap
				text @getBlock('styles').add([
					'/vendor/twitter-bootstrap/css/bootstrap.css'
					'/vendor/twitter-bootstrap/css/bootstrap-responsive.css'
					'/vendor/prettify.css'
					'/styles/style.css'
				]).toHTML()

		# -----------------------------
		# IE conditional comment
		ie 'lte IE9', ->
			script async:'async', src:'http://html5shim.googlecode.com/svn/trunk/html5.js'


	# -----------------------------
	# Document Body

	body ->
		text @content

		# additional scripts in body tag are included in each layout

		# Analytics
		script """
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-15502477-7']);
			_gaq.push(['_trackPageview']);
			(function() {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();
		"""
