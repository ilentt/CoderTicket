class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    #@events = Event.all
    if params[:search]
      @events = Event.search(params[:search]).order("name DESC")
    else
      @events = Event.all.order("name DESC")
    end  
  end

  def show
    @event = Event.find(params[:id])
  end
  
  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /food_items/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :venue, :category, :starts_at, :ends_at, 
      	:hero_image_url, :extended_html_description, :published_at)
    end

end
