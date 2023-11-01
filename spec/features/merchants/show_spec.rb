require 'rails_helper' 

RSpec.describe Merchant, type: :feature do 
  before(:each) do 
    @merchant_1 = Merchant.create!(name: "Spongebob")

  end

  describe "visiting the admin/namespace show page" do 
    describe "US1. When I visit my merchant dashboard" do
      it "Then I see the name of my merchant" do
        visit "/merchants/#{@merchant_1.id}/dashboard"

        expect(page).to have_content("Name: #{@merchant_1.name}")
      
      end
    end

    describe "US2. Then I see a link to my merchant items index" do
      it "And I see a link to my merchant invoices index" do
        visit "/merchants/#{@merchant_1.id}/dashboard"

        expect(page).to have_link("Merchant Items Index")
        click_link("Merchant Items Index")
        expect(current_path).to eq("/merchants/#{@merchant_1.id}/items")

        visit "/merchants/#{@merchant_1.id}/dashboard"

        expect(page).to have_link("Merchant Invoices Index")
        click_link("Merchant Invoices Index")
        expect(current_path).to eq("/merchants/#{@merchant_1.id}/invoices")

      end
    end
  end
end

# (/merchants/:merchant_id/items)
# (/merchants/:merchant_id/invoices)