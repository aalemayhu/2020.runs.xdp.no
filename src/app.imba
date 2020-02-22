# import 'bulma/css/bulma.css'

import './event-item'

tag app-root
	@title = "A. Alemayhu - 2020 Runs 🏃🏾‍♂️💨"
	
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
		self.fetching = true
		const cached = localStorage.getItem('events')
		if cached
			self.events = JSON.parse(cached)
			self.fetching = false
			imba.commit()
		else 
			self.fetchEvents()

	### css
				footer ul {
					display: flex;
					justify-content: space-between;
				}

				li {list-style-type: none;}
				.footer {
					position: absolute;
					width: 100%;
					bottom: 0;
				}
	###
	def render
		<self>
			<section.section>
				<div.container>
					<h1.title> self.title
					<hr>
					<p> "Please note that lists will keep on changing all throughout the year."
					<p class="subtitle">
						<button.button.is-pulled-right.is-loading=(self.fetching) :click.fetchEvents> "🔄"
					<ul>
					for event of @events
						<event-item payload=event>
				if self.isDebug()
					<hr>
					<code> JSON.stringify(@events)
			<footer.footer>
				<ul>
					<li> "© 2020 Alexander Alemayhu."
					<li>
						"Built with " 
						<a href="https://github.com/imba/imba"> "Imba"
					<li> <a href="https://github.com/scanf/2020.runs.xdp.no"> <i.fab.fa-github>