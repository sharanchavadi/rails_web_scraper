class Vehicle < ApplicationRecord
  def self.to_csv
    attributes = %w{title stock_type exterior_color interior_color transmission drivetrain price miles created_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.find_each do |vehicle|
        csv << attributes.map{ |attr| vehicle.send(attr) }
      end
    end
  end
end

#Simple csv generator without options (attributes and column_names are built-in methods)
=begin
CSV.generate do |csv|
  csv << column_names
  all.each do |vehicle|
     csv << vehicle.attributes.values_at(*column_names)
  end
end
=end