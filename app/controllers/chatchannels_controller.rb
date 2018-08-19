class ChatchannelsController < ApplicationController
  before_action :set_chatchannel, only: [:show, :edit, :update, :destroy]

  # GET /chatchannels
  # GET /chatchannels.json
  def index
    @chatchannels = Chatchannel.public_channels
  end

  # GET /chatchannels/1
  # GET /chatchannels/1.json
  def show
    @messages = @chatchannel.messages.order(created_at: :desc).limit(100).reverse
    @chatchannel_user = current_user.chatchannel_users.find_by(chatchannel_id: @chatchannel.id)
  end

  # GET /chatchannels/new
  def new
    @chatchannel = Chatchannel.new
  end

  # GET /chatchannels/1/edit
  def edit
  end

  # POST /chatchannels
  # POST /chatchannels.json
  def create
    @chatchannel = Chatchannel.new(chatchannel_params)

    respond_to do |format|

      if @chatchannel.save
        @chatchannel.chatchannel_users.where(user_id: current_user.id).first_or_create
        format.html { redirect_to @chatchannel, notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @chatchannel }
      else
        format.html { render :new }
        format.json { render json: @chatchannel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chatchannels/1
  # PATCH/PUT /chatchannels/1.json
  def update
    respond_to do |format|
      if @chatchannel.update(chatchannel_params)
        format.html { redirect_to @chatchannel, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @chatchannel }
      else
        format.html { render :edit }
        format.json { render json: @chatchannel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatchannels/1
  # DELETE /chatchannels/1.json
  def destroy
    @chatchannel.destroy
    respond_to do |format|
      format.html { redirect_to chatchannels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatchannel
      @chatchannel = Chatchannel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chatchannel_params
      params.require(:chatchannel).permit(:name)
    end
end
