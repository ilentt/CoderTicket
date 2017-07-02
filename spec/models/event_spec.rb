require 'rails_helper'

RSpec.describe Event, type: :model do
  describe ".upcoming" do
  	it "return [] when there are no events" do
  		expect(Event.upcoming).to eq []
  	end

  	it "return [] when  there are only past events" do
  		Event.create!(starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: "a pass event", venue: Venue.new, category: Category.new)
  		expect(Event.upcoming).to eq []
  	end

  	it "return [B] when there are a past event 'A' and a future event 'B' " do
  		a = Event.create!(name: "A", starts_at: 2.days.ago, ends_at: 1.day.ago, 
  			extended_html_description: "a pass event", 
  			venue: Venue.new, category: Category.new, published_at: 1.day.ago)
  		b = Event.create!(name: "B", starts_at: 2.days.ago, ends_at: 1.days.from_now, 
  			extended_html_description: "a future event", 
  			venue: Venue.new, category: Category.new, published_at: 1.day.ago)
  		expect(Event.upcoming).to eq [b]
  	end

  end
end
