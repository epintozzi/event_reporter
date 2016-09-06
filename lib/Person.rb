class Person
  attr_accessor :id, :reg_date, :first_name, :last_name, :email_address, :home_phone, :street, :city, :zipcode

  def initialize(id, reg_date, first_name, last_name, email_address, home_phone, street, city, state, zipcode)
    @id = id
    @reg_date = reg_date
    @first_name = first_name
    @last_name = last_name
    @email_address = email_address
    @home_phone = home_phone
    @street = street
    @city = city
    @state = state
    @zipcode = zipcode
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end
