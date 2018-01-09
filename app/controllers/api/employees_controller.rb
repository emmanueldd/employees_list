class Api::EmployeesController < ApiController
  before_action :authenticate_pro!
  before_action :set_employee, only: [:show, :update, :destroy]

  def create
    @employee = current_pro.employees.new(employee_params)
    if @employee.save
      respond_to do |format|
        format.json { render json: @employee, status: :created }
      end
    end
  end

  def update
    if @employee.update(employee_params)
      respond_to do |format|
        format.json { render json: @employee, status: :ok }
      end
    end
  end

  def show
    if @employee.present?
      respond_to do |format|
        format.json { render json: @employee, status: :ok }
      end
    end
  end

  def index
    @employees = current_pro.employees
    # if @employees.present?
      respond_to do |format|
        format.json { render json: @employees, status: :ok }
      end
    # end
  end

  def destroy
      @employee.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

  private

    def set_employee
      @employee = current_pro.employees.find_by_id(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :phone, :shift)
    end
end
