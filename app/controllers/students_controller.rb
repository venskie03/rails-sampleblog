class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      flash[:notice] = 'Student was successfully updated.'
    else
      flash[:alert] = 'Failed to update student.'
    end

    render :edit
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :contactno)
  end
end
