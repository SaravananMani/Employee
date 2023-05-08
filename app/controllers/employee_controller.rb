class EmployeeController < ApplicationController
  def index
  end

  def dashboard
    if params[:employee].present? && params[:employee][:employee_data].present?
      @employee_table_data = []
      @employee_chart_data = {}
      emplyee_sheet = Roo::Spreadsheet.open(params[:employee][:employee_data]).sheet(0)
      if emplyee_sheet.first[0]&.downcase == 'site' || emplyee_sheet.drop(1).first[0]&.downcase == 'site'
        @employee_table_data, @employee_chart_data = EmployeeDataService.employee_data_set(emplyee_sheet)
      else
        redirect_to root_path, notice: "File data not valid please reupload"
      end
    end
  end
end
