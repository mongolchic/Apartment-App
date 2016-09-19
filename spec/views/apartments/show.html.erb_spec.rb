require 'rails_helper'

RSpec.describe "apartments/show", type: :view do
  before(:each) do
    @apartment = assign(:apartment, Apartment.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Owner Name/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
  end
end
