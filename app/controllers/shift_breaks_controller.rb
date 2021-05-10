
class ShiftBreaksController < ApplicationController
  # before_action :set_shift_break, only: %i[ show edit update destroy ]

  # GET /shift_breaks or /shift_breaks.json
  # def index
  #   @shift_breaks = ShiftBreak.all
  # end

  # # GET /shift_breaks/1 or /shift_breaks/1.json
  # def show
  # end

  
  # GET /shift_breaks/new
  def new
    @shift_break = ShiftBreak.new
  end

  # def test
  #   @shift_break = ShiftBreak.new
  # end

  # # GET /shift_breaks/1/edit
  # def edit
  # end

  # POST /shift_breaks or /shift_breaks.json

  def create
    @shift_break = ShiftBreak.new(shift_break_params)

    respond_to do |format|
      if ShiftBreak.hours_total?(@shift_break, shift_break_params[:break_length].to_f)
        if shift_break_params[:break_length].to_i > 0 && @shift_break.save
          format.html { redirect_to shifts_path, info:  "Break was successfully created." }
          format.json { render :show, status: :created, location: @shift_break }
        else
          format.html { redirect_to shifts_path, warning: "Break must be more than 0 minutes long" }
          format.json { render json: @shift_break.errors, status: :unprocessable_entity }
        end
      end
      format.html{redirect_to shifts_path, info: "Break can not be more than hours worked"}
      format.json {render json: @shift_break.errors, status: :unprocessable_entity }
    end
  end

#   # PATCH/PUT /shift_breaks/1 or /shift_breaks/1.json
#   def update
#     respond_to do |format|
#       if @shift_break.update(shift_break_params)
#         format.html { redirect_to @shift_break, notice: "Shift break was successfully updated." }
#         format.json { render :show, status: :ok, location: @shift_break }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @shift_break.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /shift_breaks/1 or /shift_breaks/1.json
#   def destroy
#     @shift_break.destroy
#     respond_to do |format|
#       format.html { redirect_to shift_breaks_url, notice: "Shift break was successfully destroyed." }
#       format.json { head :no_content }
#     end
# end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift_break
      @shift_break = ShiftBreak.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shift_break_params
      params.require(:shift_break).permit(:shift_id, :break_length)
    end
end
