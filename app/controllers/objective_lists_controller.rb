class ObjectiveListsController < ApplicationController
  before_action :set_objective_list, only: [:show, :edit, :update, :destroy]

  # GET /objective_lists
  # GET /objective_lists.json
  def index
    @objective = ObjectiveList.all.first
  end

  # GET /objective_lists/1
  # GET /objective_lists/1.json
  def show
  end

  # GET /objective_lists/new
  def new
    @objective_list = ObjectiveList.new
  end

  # GET /objective_lists/1/edit
  def edit
  end

  # POST /objective_lists
  # POST /objective_lists.json
  def create
    @objective_list = ObjectiveList.new(objective_list_params)

    respond_to do |format|
      if @objective_list.save
        format.html { redirect_to @objective_list, notice: 'Objective list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @objective_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @objective_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objective_lists/1
  # PATCH/PUT /objective_lists/1.json
  def update
    respond_to do |format|
      if @objective_list.update(objective_list_params)
        format.html { redirect_to @objective_list, notice: 'Objective list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @objective_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objective_lists/1
  # DELETE /objective_lists/1.json
  def destroy
    @objective_list.destroy
    respond_to do |format|
      format.html { redirect_to objective_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objective_list
      @objective_list = ObjectiveList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objective_list_params
      params[:objective_list]
    end
end
