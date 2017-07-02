require 'rails_helper'

RSpec.describe EventsController, type: :controller do
	describe "GET #index" do
		it "returns http success" do
			get :index
			expect(response).to have_http_status(200)
		end

		it "loads alls event" do
			event = Event.new starts_at: 1.day.from_now
			event.save(validate: false)
			get :index
			expect(assigns(:events)).to eq [event]
		end
	end

	describe "GET #show" do
		it "returns special event by id" do
			event = Event.new starts_at: 1.day.from_now
			event.save(validate: false)
			#event = Event.find(event.id)
			get :show, id: event.id
			expect(assigns(:event)).to eq event
		end
	end
end
