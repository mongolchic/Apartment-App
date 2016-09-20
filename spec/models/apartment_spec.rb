require 'rails_helper'

RSpec.describe Apartment, type: :model do
  # Story: As an internet user, I can go to a web page and see a list of apartments.
  it "has to be an apartment" do
    expect{Apartment.new}.to_not raise_error
  end

  it "has to list out the apartment credentials" do
    a = Apartment.new
    a.address1 = "10116 burrock drive"
    a.address2 = ""
    a.city = "santee"
    a.postal_code = 92071
    a.state = "Ca"
    a.country = "United States"
    a.owner_name = "Sea-Anna"
    a.contact_time = 4
    a.phone_number = 619
    expect(a.save).to eq true
    b = Apartment.find_by_address1("10116 burrock drive")
    expect(b.address1).to eq "10116 burrock drive"
    expect(b.address2).to eq ""
    expect(b.city).to eq "santee"
    expect(b.postal_code).to eq 92071
    expect(b.state).to eq "Ca"
    expect(b.country).to eq "United States"
    expect(b.owner_name).to eq "Sea-Anna"
    expect(b.contact_time).to eq 4
    expect(b.phone_number).to eq 619
  end
end




# Apartments have two street designations, and a city, postal code, state, country, in a addition to the owner's contact info: name, time, phone number.
#   it "has an address" do
#     a = Apartment.new
#     a.address1 = "10116 burrock drive"
#     a.address2 = ""
#     a.city = "santee"
#     a.postal_code = "92071"
#     a.state = "Ca"
#     a.country = "United States"
#     a.owner_name = "Sea-Anna"
#     a.contact_time = "4"
#     a.phone_number = "619"
#     expect(a.save).to eq true
#     b = Apartment.find_by_address1("10116 burrock drive")
#     expect(b.address1).to eq "10116 burrock drive"
#   end
#
#   it "must have an address" do
#     a = Apartment.new
#     a.city = "santee"
#     a.postal_code = "92071"
#     a.state = "Ca"
#     a.country = "United States"
#     a.owner_name = "Sea-Anna"
#     a.contact_time = "4"
#     a.phone_number = "619"
#     expect(a.save).to eq false
# end
