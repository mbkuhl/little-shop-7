require 'rails_helper' 

RSpec.describe "Admin Dashboard Page", type: :feature do 
  before(:each) do 
    

  end

  describe "visiting the admin/namespace show page" do 
    describe "" do
      it "" do
        visit "/admin"

        expect(page).to have_content("Welcome to the Admin Dashboard, Boss")
      
      end
    end
  end

  describe "US24. As an admin, when I visit the admin dashboard ('/admin')" do
    describe "Then I see the names of my top 5 customers who have completed the largest number of successful transaction with any merchant" do
      it "And next to each customer name I see the number of successful transactions they have conducted" do
        @merchant1 = Merchant.create(name: "Spongebob")
        
        @item1 = @merchant1.items.create(name: "Krabby Patty", description: "yummy", unit_price: "999")
        @item2 = @merchant1.items.create(name: "Krabby Patty", description: "yummy", unit_price: "999")
    
        @customer1 = Customer.create(first_name: "Patrick", last_name: "Star")
        @customer2 = Customer.create(first_name: "Sandy", last_name: "Cheeks")
        @customer3 = Customer.create(first_name: "King", last_name: "Neptune")
        @customer4 = Customer.create(first_name: "Eugene", last_name: "Krabs")
        @customer5 = Customer.create(first_name: "Sheldon", last_name: "Plankton")
        @customer6 = Customer.create(first_name: "Poppy", last_name: "Puff")
    
        @invoice1 = Invoice.create(status: 1, customer_id: @customer1.id)
        @invoice2 = Invoice.create(status: 1, customer_id: @customer2.id)
        @invoice3 = Invoice.create(status: 1, customer_id: @customer3.id)
        @invoice4 = Invoice.create(status: 1, customer_id: @customer4.id)
        @invoice5 = Invoice.create(status: 1, customer_id: @customer5.id)
        @invoice6 = Invoice.create(status: 1, customer_id: @customer6.id)
    
        @invoiceitem1 = InvoiceItem.create(invoice_id: @invoice1.id, item_id: @item1.id)
        @invoiceitem2 = InvoiceItem.create(invoice_id: @invoice2.id, item_id: @item1.id)
        @invoiceitem3 = InvoiceItem.create(invoice_id: @invoice3.id, item_id: @item1.id)
        @invoiceitem4 = InvoiceItem.create(invoice_id: @invoice4.id, item_id: @item2.id)
        @invoiceitem5 = InvoiceItem.create(invoice_id: @invoice5.id, item_id: @item1.id)
        @invoiceitem6 = InvoiceItem.create(invoice_id: @invoice6.id, item_id: @item1.id)
  
          Transaction.create(invoice_id: @invoice1.id, result: 0)
          Transaction.create(invoice_id: @invoice2.id, result: 0)
          Transaction.create(invoice_id: @invoice2.id, result: 0)
        3.times do
          Transaction.create(invoice_id: @invoice3.id, result: 1)
        end
        4.times do
          Transaction.create(invoice_id: @invoice4.id, result: 0)
        end
        5.times do
          Transaction.create(invoice_id: @invoice5.id, result: 0)
        end
        5.times do
          Transaction.create(invoice_id: @invoice5.id, result: 1)
        end
        6.times do
          Transaction.create(invoice_id: @invoice6.id, result: 0)
        end
  
        @merchant2 = Merchant.create(name: "Squidward")
        @item3 = @merchant2.items.create(name: "Krabby Patty", description: "yummy", unit_price: "999")
        @customer7 = Customer.create(first_name: "Larry", last_name: "Lobster")
        @invoice7 = Invoice.create(status: 1, customer_id: @customer7.id)
        @invoiceitem7 = InvoiceItem.create(invoice_id: @invoice7.id, item_id: @item3.id)
        3.times do
          Transaction.create(invoice_id: @invoice7.id, result: 0)
        end
  
        visit "/admin"
        expect(page).to have_content("Top 5 Customers, # of Transactions")
        expect("Poppy Puff: 6").to appear_before("Sheldon Plankton: 5")
        expect("Sheldon Plankton: 5").to appear_before("Eugene Krabs: 4")
        expect("Eugene Krabs: 4").to appear_before("Larry Lobster: 3")
        expect("Larry Lobster: 3").to appear_before("Sandy Cheeks: 2")
      end      
    end
  end
end