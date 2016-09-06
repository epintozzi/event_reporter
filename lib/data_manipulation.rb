class DataManipulation

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

  def clean_phone(phone)
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

  def clean_first_name(first_name)
    first_name.strip
  end

  def clean_last_name(last_name)
    last_name.strip
  end

end
