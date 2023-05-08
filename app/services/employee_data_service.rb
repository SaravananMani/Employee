class EmployeeDataService

  def self.employee_data_set(emplyee_sheet)
    employee_table_data = []
    employee_chart_data = {}
    emplyee_sheet.drop(2).each do |row|
      site = row[0]&.downcase&.strip
      permanent = row[1]
      contract = row[2]
      permanent_male = row[3]&.to_i
      permanent_female = row[4]&.to_i
      contract_male = row[5]&.to_i
      contract_female = row[6]&.to_i
      overall_workforce = permanent + contract
      male = permanent_male + contract_male
      female = permanent_female + contract_female
      total = male + female
      male_ratio = (male.to_f/total.to_f * 100).round
      female_ratio = (female.to_f/total.to_f * 100).round
      ratio = "#{male_ratio}:#{female_ratio}"

      country_name = EmployeeDataService.get_country_name(site)

      employee_table_data << [site, permanent, contract, permanent_male, permanent_female, contract_male, contract_female, overall_workforce, ratio]

      if employee_chart_data[country_name].nil?
        employee_chart_data[country_name] = {}
        employee_chart_data[country_name].merge!({permanent: {"#{site}": permanent}})
        employee_chart_data[country_name].merge!({contract: {"#{site}": contract}})
        employee_chart_data[country_name].merge!({permanent_male: {"#{site}": permanent_male}})
        employee_chart_data[country_name].merge!({permanent_female: {"#{site}": permanent_female}})
        employee_chart_data[country_name].merge!({contract_male: {"#{site}": contract_male}})
        employee_chart_data[country_name].merge!({contract_female: {"#{site}": contract_female}})
        employee_chart_data[country_name].merge!({overall_workforce: {"#{site}": overall_workforce}})
      else
        employee_chart_data[country_name][:permanent].merge!({"#{site}": permanent})
        employee_chart_data[country_name][:contract].merge!({"#{site}": contract})
        employee_chart_data[country_name][:permanent_male].merge!({"#{site}": permanent_male})
        employee_chart_data[country_name][:permanent_female].merge!({"#{site}": permanent_female})
        employee_chart_data[country_name][:contract_male].merge!({"#{site}": contract_male})
        employee_chart_data[country_name][:contract_female].merge!({"#{site}": contract_female})
        employee_chart_data[country_name][:overall_workforce].merge!({"#{site}": overall_workforce})
      end
    end
    return [employee_table_data, employee_chart_data]
  end

  class << self
    [:name, :state_name, :state_code, :country_code, :country_name].each do |attribute|
      define_method :"get_country_name_by_#{attribute}" do |value|
        data = EMPLOYEE.find {|i| i["#{attribute}"]&.downcase&.gsub('-', ' ')&.strip == "#{value}"&.downcase&.gsub('-', ' ')&.strip}
        if attribute.to_s == 'country_name'
          data ? data['country_name'] : 'Other'
        else
          data ? data['country_name'] : nil
        end
      end
    end
  end

  def self.get_country_name(name)
    if country_name = get_country_name_by_name(name)
    elsif country_name = get_country_name_by_state_name(name)
    elsif country_name = get_country_name_by_country_name(name)
    end
    return country_name
  end

end
