class LobsController < ApplicationController
  load_and_authorize_resource except: [:create]
  
  before_action :set_lob, only: [:show, :edit, :update, :destroy]

  # GET /lobs
  # GET /lobs.json
  def index
    @lobs = Lob.all
  end

  # GET /lobs/1
  # GET /lobs/1.json
  def show
  end

  # GET /lobs/new
  def new
    @lob = Lob.new
  end

  # GET /lobs/1/edit
  def edit
  end

  # POST /lobs
  # POST /lobs.json
  def create
    @lob = Lob.new(lob_params)
    @lob.author_id = session[:user_id]

    respond_to do |format|
      if @lob.save
        format.html { redirect_to root_url, notice: 'Lob was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lob }
      else
        format.html { render action: 'new' }
        format.json { render json: @lob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lobs/1
  # PATCH/PUT /lobs/1.json
  def update
    respond_to do |format|
      if @lob.update(lob_params)
        format.html { redirect_to root_url, notice: 'Lob was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lobs/1
  # DELETE /lobs/1.json
  def destroy
    @lob.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lob
      @lob = Lob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lob_params
      params.require(:lob).permit(:description, :published, :user_id)
    end
end
