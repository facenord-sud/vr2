class CarreersController < ApplicationController
  before_action :set_carreer, only: [:show, :edit, :update, :destroy]

  # GET /carreers
  # GET /carreers.json
  def index
    @carreers = Carreer.all
    @results = Result.order('results.date DESC').all
  end

  # GET /carreers/1
  # GET /carreers/1.json
  def show
  end

  # GET /carreers/new
  def new
    @carreer = Carreer.new
  end

  # GET /carreers/1/edit
  def edit
  end

  # POST /carreers
  # POST /carreers.json
  def create
    @carreer = Carreer.new(carreer_params)

    respond_to do |format|
      if @carreer.save
        format.html { redirect_to @carreer, notice: 'Carreer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @carreer }
      else
        format.html { render action: 'new' }
        format.json { render json: @carreer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carreers/1
  # PATCH/PUT /carreers/1.json
  def update
    respond_to do |format|
      if @carreer.update(carreer_params)
        format.html { redirect_to @carreer, notice: 'Carreer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @carreer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carreers/1
  # DELETE /carreers/1.json
  def destroy
    @carreer.destroy
    respond_to do |format|
      format.html { redirect_to carreers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carreer
      @carreer = Carreer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carreer_params
      params.require(:carreer).permit(:name, :medals)
    end
end
