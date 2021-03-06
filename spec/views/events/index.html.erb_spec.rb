require 'rails_helper'

RSpec.describe "events/index", type: :view do
  it "Renders Discover upcoming events in a header tag" do 
  	assign(:events, [])
  	render
  	# if you want to see the whole rendered text, use 'puts rendered'
  	expect(rendered).to include("<h2>Discover upcoming events</h2>")
  	#expect(rendered).to include("Discover upcoming events")
  end

  it "Display an event title" do
  	event = Event.create!(name: "Michael Jackson", starts_at: 2.days.ago, ends_at: 1.day.ago,
  		extended_html_description: "a pass event", venue: Venue.new, category: Category.new, published_at: 1.day.ago)
  	assign(:events, [event])
  	render
  	expect(rendered).to include('<h4 class="card-title">Michael Jackson</h4>')
  end
end
