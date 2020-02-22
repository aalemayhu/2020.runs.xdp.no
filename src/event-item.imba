tag event-item

	def date
		"{self.payload['Måned']}: "
	
	def link
		<a href="{self.payload['Url']}"> "{self.payload['Løp']}"

	def prefix
		console.log('self.payload', self.payload)
		self.payload["Ferdig"] == "Nei" ? "strong" : "strike"

	def render
		<self>
				<li.title.is-4>
						<{self.prefix()}>
							self.date()
							self.link()
