require 'rails_helper'

RSpec.feature "ApartmentPages", type: :feature do
    context 'Going to website' do
    Steps 'Seeing listing apartments' do
      Given 'I am on the Apartment page' do
        visit '/'
      end

      Then 'I can add a new apartment' do
        click_link 'New Apartment'
        fill_in 'Address1', with: "10116 burrock drive"
        fill_in 'Address2', with: ""
        fill_in 'City', with: "santee"
        fill_in 'Postal code', with: 92071
        fill_in 'State', with: "Ca"
        fill_in 'Country', with: "United States"
        fill_in 'Owner name', with: "Contact name"
        fill_in 'Contact time', with: 4
        fill_in 'Phone number', with: 619
        click_button 'Create Apartment'
      end
      Then 'I can see the new apartment' do
        expect(page).to have_content("Apartment was successfully created.")
        expect(page).to have_content("10116 burrock drive")
        expect(page).to have_content("")
        expect(page).to have_content("santee")
        expect(page).to have_content(92071)
        expect(page).to have_content("Ca")
        expect(page).to have_content("United States")
        expect(page).to have_content("Sea-Anna")
        expect(page).to have_content(4)
        expect(page).to have_content(619)
      end
    end
  end
end
