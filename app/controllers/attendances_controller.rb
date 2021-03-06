require 'json'
class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
     @attendance = Attendance.new
	@classInfo = ClassInfo.all
  end

  def showClassStudents()
  hash = attendance_params
hash = JSON.parse(hash) if hash.is_a?(String)
attendance = Attendance.new(hash)
	@classId =  attendance.classId
	#puts '#@request.POST' 
	#@classId = obj['attendance']['classId']
	
	@students = Student.where(classId:@classId.to_i)
	puts @students
  # GET /attendances/1/edit
  end
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
  data = params.inspect 
  puts "check" 
  studentData =  data.split(',')
  if studentData 
	data = JSON.parse(params) if hash.is_a?(String)
	if data 
	data =  data.to_json
		data.each do |child|
			puts child
			puts "Test"
		end 

	end
  end 
  
	redirect_to action: "new"
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:studentid, :sPresent, :attendenceDate, :classId)
    end
end
