require 'byebug'

class ShiftsController < ApplicationController
before_action :set_shift, only: %i[ show edit update destroy ]

  # GET /shifts or /shifts.json
  def index
    @shift = Shift.new #new shift model

    @initial_shifts_query = Shift.initial_shift_fetch(current_user)

    #store in session so on refresh search input is empty (it will not reset the route)
    session[:search_by_name] = params[:search]
    
    #get all shifts that are from same organization that current logged in user is
    @shifts = @initial_shifts_query

    #order shifts by user names
    @shifts = Shift.sort_by_name(@shifts) if params[:order_by_name]


    #search all shifts by users name
    @shifts = Shift.search_by_shifts_user_name(@shifts, session[:search_by_name]) if session[:search_by_name]
  end
  

  # GET /shifts/1 or /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts or /shifts.json
  def create
    return redirect_back(fallback_location: root_path, notice: "Shift Start/Finish Can not be Empty") if shift_params[:start].blank? || shift_params[:finish].blank?
    @shift = Shift.new(shift_params)
    @shift.shift_breaks.build(break_params)
    respond_to do |format|
      if @shift.save
        format.html { redirect_to shifts_path, notice: "Shift was successfully created." }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1 or /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to root_path, notice: "Shift was successfully updated." }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1 or /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_url, notice: "Shift was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shift_params
      params.require(:shift).permit(:user_id, :start, :finish, :break_length, :order_by_name)
    end

    def break_params
      params.require(:shift_breaks).permit(:break_length)
    end
end