require 'rails_helper'

RSpec.describe "apartments/edit", type: :view do
  before(:each) do
    @apartment = assign(:apartment, Apartment.create!(
      :latitude => 1.5,
      :longitude => 1.5,
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :postal_code => 1,
      :state => "MyString",
      :country => "MyString",
      :owner_name => "MyString",
      :contact_time => 1,
      :phone_number => 1
    ))
  end

  it "renders the edit apartment form" do
    render

    assert_select "form[action=?][method=?]", apartment_path(@apartment), "post" do

      assert_select "input#apartment_latitude[name=?]", "apartment[latitude]"

      assert_select "input#apartment_longitude[name=?]", "apartment[longitude]"

      assert_select "input#apartment_address1[name=?]", "apartment[address1]"

      assert_select "input#apartment_address2[name=?]", "apartment[address2]"

      assert_select "input#apartment_city[name=?]", "apartment[city]"

      assert_select "input#apartment_postal_code[name=?]", "apartment[postal_code]"

      assert_select "input#apartment_state[name=?]", "apartment[state]"

      assert_select "input#apartment_country[name=?]", "apartment[country]"

      assert_select "input#apartment_owner_name[name=?]", "apartment[owner_name]"

      assert_select "input#apartment_contact_time[name=?]", "apartment[contact_time]"

      assert_select "input#apartment_phone_number[name=?]", "apartment[phone_number]"
    end
  end
end
