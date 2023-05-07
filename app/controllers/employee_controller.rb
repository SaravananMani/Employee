class EmployeeController < ApplicationController
  def index
  end

  def dashboard
    if params[:employee].present? && params[:employee][:employee_data].present?
      @employee_data = {}
      @employee_table_data = []
      @employee_chart_data = []
      emplyee_sheet = Roo::Spreadsheet.open(params[:employee][:employee_data]).sheet(0)
      emplyee_sheet.drop(2).each do |row|
        p row
        p site = row[0]
        p permanent = row[1]
        p contract = row[2]
        p permanent_male = row[3].to_i
        p permanent_female = row[4].to_i
        p contract_male = row[5].to_i
        p contract_female = row[6].to_i
        p overall_workforce = permanent + contract
        p male = permanent_male + contract_male
        p female = permanent_female + contract_female
        p total = male + female
        p male_ratio = (male.to_f/total.to_f * 100).round
        p female_ratio = (female.to_f/total.to_f * 100).round
        p ratio = "#{male_ratio}:#{female_ratio}"

          @employee_data[site] = {permanent: permanent, contract: contract, permanent_male: permanent_male, permanent_female: permanent_female, contract_male: contract_male, contract_female: contract_female, overall_workforce: overall_workforce, ratio: [male: male, female: female, male_ratio: male_ratio, female_ratio: female_ratio]}

          @employee_table_data << [site, permanent, contract, permanent_male, permanent_female, contract_male, contract_female, overall_workforce, ratio]

          @employee_chart_data << {name: site, data: {permanent: permanent, contract: contract, permanent_male: permanent_male, permanent_female: permanent_female, contract_male: contract_male, contract_female: contract_female, overall_workforce: overall_workforce}} unless ['India', 'UAE'].include?(site)

          p @employee_data
          p @employee_chart_data
      end
    end

    # tempfile = Tempfile.new("fileupload")
    # tempfile.binmode
    # tempfile.write(blob)
    # tempfile.rewind()

    # mime_type = Mime::Type.lookup_by_extension(File.extname(filename)[1..-1]).to_s
    # uploaded_file = ActionDispatch::Http::UploadedFile.new(tempfile: tempfile, filename: filename, type: mime_type)


    respond_to do |format|
      format.html
      # format.json { render json: ContactViewDatatable.new(view_context, {current_firm_id: current_firm}) }
      # format.json { render json: EmployeeDatatable.new(view_context, employee_data: @employee_data) }
      format.json
    end
  end
end
