# import 'bulma/css/bulma.css'

tag app-root
	@title = "2020 Runs 🏃🏾‍♂️💨"
	
	def fetchEvents
		self.fetching = true
		const u = "https://sheetsu.com/apis/v1.0su/98c9038d3a1e"
		const request = await window.fetch(u)
		const payload = await request.json()
		self.events = payload
		localStorage.setItem('events', JSON.stringify(self.events))
		self.fetching = false
	
	def isDebug
		window.location.pathname.match(/debug/)

	def mount
		const cached = localStorage.getItem('events')
		if cached
			self.events = JSON.parse(cached)
			imba.commit()
		else 
			self.fetchEvents()

	def render
		<self>
			<section.section>
				<div.container>
					<h1.title> self.title
					<hr>
					<p class="subtitle">
						<button.button.is-pulled-right.is-loading=(self.fetching) :click.fetchEvents> "🔄"
					<ul>
					### css scoped
					li {list-style-type: none;}
					###
					for event of @events
						<li.title.is-4>
							"{event['Måned']}: "
							<a href="{event['Url']}"> <strong> "{event['Løp']}"
				if self.isDebug()
					<hr>
					<code> JSON.stringify(@events)