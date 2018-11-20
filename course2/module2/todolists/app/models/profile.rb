class Profile < ActiveRecord::Base
  belongs_to :user
  validate  :name, :denomination, :sue

  def name
    errors.add(:first_name, "cannot be empty if last_name it is empty") if first_name.nil? and last_name.nil?
  end

  def denomination
    errors.add(:gender, "cannot have a value different from male or female") unless ["male", "female"].include? gender
  end

  def sue
    errors.add(:first_name, "cannot accetp Sue as a value") if first_name.eql? "Sue"
  end
end
