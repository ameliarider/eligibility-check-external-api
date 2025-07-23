require 'ffaker'

i = 0
99.times do
  member = Member.create(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    dob: FFaker::Date.birthday,
    external_member_id: "1111111#{i}",
    zip: FFaker::AddressUS.zip_code,
    group_number: "ABC123"
  )
  i+=1
end
