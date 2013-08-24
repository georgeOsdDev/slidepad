# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

	templateData:

		# Specify some site properties
		site:
			# The production url of our website
			url: "http://github.com/georgeOsdDev/slidepad.docpad"

			# Here are some old site urls that you would like to redirect from
			oldUrls: [
			]

			# The default title of our website
			title: "slidepad"

			# The website description (for SEO)
			description: """
				Generate HTML5 Slides from Markdown.
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				slidepad, generator, intializer, lide, html5, docpad, big, deck.js,　html5slides, impress.js, george_osd, georgeOsdDev, oshida, takeharu, 押田丈治
				"""

			# The website author's name
			author: "Takeharu.Oshida"

			# The website author's email
			email: "georgeosddev@email.com"


		# -----------------------------
		# Helper Functions

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')

		getDocpadInstance: ->
			@docpad

	# =================================
	# Collections
	# These are special collections that our website makes available to us

	collections:
		# For instance, this one will fetch in all documents that have pageOrder set within their meta data
		pages: (database) ->
			database.findAllLive({pageOrder: {$exists: true}}, [pageOrder:1,title:1])

		navmenus: (database) ->
			database.findAllLive({tags: {$has: 'navmenu'} ,pageOrder: {$exists: true}},{pageOrder:1})

		# big
		big: (database) ->
			database.findAllLive({tags: {$has: 'big'} ,pageOrder: {$exists: true}},{pageOrder:1})

		# deck
		deck: (database) ->
			database.findAllLive({tags: {$has: 'deck'} ,pageOrder: {$exists: true}},{pageOrder:1})

		# h5slide
		h5slides: (database) ->
			database.findAllLive({tags: {$has: 'h5slides'} ,pageOrder: {$exists: true}},{pageOrder:1})

		# impress
		impress: (database) ->
			database.findAllLive({tags: {$has: 'impress'} ,pageOrder: {$exists: true}},{pageOrder:1})

	# =================================
	# DocPad Events

	# Here we can define handlers for events that DocPad fires
	# You can find a full listing of events on the DocPad Wiki
	events:

		# Server Extend
		# Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			# Extract the server from the options
			{server} = opts
			docpad = @docpad

			# As we are now running in an event,
			# ensure we are using the latest copy of the docpad configuraiton
			# and fetch our urls from it
			latestConfig = docpad.getConfig()
			oldUrls = latestConfig.templateData.site.oldUrls or []
			newUrl = latestConfig.templateData.site.url

			# Redirect any requests accessing one of our sites oldUrls to the new site url
			server.use (req,res,next) ->
				if req.headers.host in oldUrls
					res.redirect(newUrl+req.url, 301)
				else if req.url is '/pages/start-en'
					# Redirect default Getting Started
					res.redirect('/pages/start',301)
				else
					next()
}


# Export our DocPad Configuration
module.exports = docpadConfig
