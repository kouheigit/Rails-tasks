require "rails_helper"

RSpec.describe "Customers", type: :request do
  before do
    host! "www.example.com"
  end

  let(:headers) do
    {
      "User-Agent" => "Mozilla/5.0 AppleWebKit/537.36 Chrome/120.0 Safari/537.36"
    }
  end

  let(:valid_attributes) do
    {
      company_name: "Acme Inc.",
      contact_name: "Taro Yamada",
      contact_email: "taro@example.com",
      phone: "090-1234-5678",
      customer_status: "active",
      memo: "Important customer"
    }
  end

  let(:invalid_attributes) do
    valid_attributes.merge(company_name: nil)
  end

  describe "GET /customers" do
    it "returns a successful response" do
      get customers_path, headers: headers
      warn response.body[/<h1.*?<\/h1>/m]

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /customers/:id" do
    it "returns a successful response" do
      customer = Customer.create!(valid_attributes)

      get customer_path(customer), headers: headers

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /customers" do
    it "creates a customer" do
      expect do
        post customers_path, params: { customer: valid_attributes }, headers: headers
      end.to change(Customer, :count).by(1)

      expect(response).to redirect_to(customer_path(Customer.last))
    end

    it "does not create a customer with invalid attributes" do
      expect do
        post customers_path, params: { customer: invalid_attributes }, headers: headers
      end.not_to change(Customer, :count)

      expect(response).to have_http_status(:unprocessable_content)
    end
  end

  describe "PATCH /customers/:id" do
    it "updates a customer" do
      customer = Customer.create!(valid_attributes)

      patch customer_path(customer),
            params: { customer: { company_name: "Updated Inc." } },
            headers: headers

      expect(response).to redirect_to(customer_path(customer))
      expect(customer.reload.company_name).to eq("Updated Inc.")
    end
  end

  describe "DELETE /customers/:id" do
    it "destroys a customer" do
      customer = Customer.create!(valid_attributes)

      expect do
        delete customer_path(customer), headers: headers
      end.to change(Customer, :count).by(-1)

      expect(response).to redirect_to(customers_path)
    end
  end
end
