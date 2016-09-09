class DataManipulation

  def self.clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

  def self.clean_phone(phone)
    return "0000000000" if phone.nil?
    phone = phone.to_s.gsub(/\D/, "")
    if phone.length == 10
      return phone
    elsif phone.length == 11 and phone[0] == "1"
      return phone[1..11]
    else
      return "0000000000"
    end
  end

  def self.clean_first_name(first_name)
    first_name.strip
  end

  def self.clean_last_name(last_name)
    last_name.strip
  end

  def self.clean_city(city)
    if city
    city.strip
    else
      return ""
    end
  end

  def self.clean_street(street)
    if street
    street.strip
    else
      return ""
    end
  end

  def self.clean_state(state)
    if state
    state.strip
    else
      return ""
    end
  end
end
