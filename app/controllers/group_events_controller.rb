class GroupEventsController < ApplicationController
  before_action :set_group_event, only: [:show, :update, :destroy]

  # GET /group_events
  def index
    @group_events = GroupEvent.all

    render json: @group_events
  end

  # GET /group_events/1
  def show
    render json: @group_event
  end

  # POST /group_events
  def create
    @group_event = GroupEvent.new(group_event_params)

    if @group_event.save
      render json: @group_event, status: :created, location: @group_event
    else
      render json: @group_event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /group_events/1
  def update
    if @group_event.update(group_event_params)
      render json: @group_event
    else
      render json: @group_event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /group_events/1
  def destroy
    @group_event.update(deleted: true)
  end

  # Auxillary Functions Below
  def draftEvents
    @draft_events = GroupEvent.drafts
    render json: @draft_events
  end

  def publishedEvents
    @published_events = GroupEvent.published_events
    render json: @published_events
  end

  def removedEvents
    @removed_events = GroupEvent.deleted_events
    render json: @removed_events
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_event
      @group_event = GroupEvent.find(params[:id])
    end
    
    def format_dates(params)
      params[:duration] = params[:duration].to_i if params[:duration]

      if params[:startDate]
        startDate = params[:startDate].split().collect{|t| t.to_i}
        params[:startDate] = Date.new(startDate[0], startDate[1], startDate[2])
      end

      if params[:endDate]
        endDate = params[:endDate].split().collect{|t| t.to_i}
        params[:endDate] = Date.new(endDate[0], endDate[1], endDate[2])
      end
    end
    
    def check_dates(params)
      format_dates(params)
      if (!params[:startDate])
        params[:startDate] = params[:endDate] - params[:duration]
      elsif (!params[:endDate])
        params[:endDate] = params[:startDate] + params[:duration]
      elsif (!params[:duration])
        params[:duration] = params[:endDate] - params[:startDate]
      end
    end
    
    # Trusted Parameters
    def group_event_params
      check_dates(params)

      if params[:published]
        params.require([:name, :description, :startDate, :endDate, :duration, :published, :location])
      end

      params.permit(:name, :description, :deleted, :startDate, :endDate, :duration, :published, :location)
    end
end
