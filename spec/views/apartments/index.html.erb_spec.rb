require 'rails_helper'

RSpec.describe "apartments/index", type: :view do
  before(:each) do
    assign(:apartments, [
      Apartment.create!(
        :latitude => 2.5,
        :longitude => 3.5,
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :postal_code => 4,
        :state => "State",
        :country => "Country",
        :owner_name => "Owner Name",
        :contact_time => 5,
        :phone_number => 6
      ),
      Apartment.create!(
        :latitude => 2.5,
        :longitude => 3.5,
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :postal_code => 4,
        :state => "State",
        :country => "Country",
        :owner_name => "Owner Name",
        :contact_time => 5,
        :phone_number => 6
      )
    ])
  end

  it "renders a list of apartments" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Owner Name".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
