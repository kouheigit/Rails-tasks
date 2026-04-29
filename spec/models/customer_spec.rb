require "rails_helper"

RSpec.describe Customer, type: :model do
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

  it "is valid with valid attributes" do
    customer = described_class.new(valid_attributes)

    expect(customer).to be_valid
  end

  it "is invalid without a company name" do
    customer = described_class.new(valid_attributes.merge(company_name: nil))

    expect(customer).not_to be_valid
    expect(customer.errors[:company_name]).to be_present
  end

  it "is invalid without a contact name" do
    customer = described_class.new(valid_attributes.merge(contact_name: nil))

    expect(customer).not_to be_valid
    expect(customer.errors[:contact_name]).to be_present
  end

  it "is invalid without a contact email" do
    customer = described_class.new(valid_attributes.merge(contact_email: nil))

    expect(customer).not_to be_valid
    expect(customer.errors[:contact_email]).to be_present
  end

  it "is invalid with a duplicate contact email" do
    described_class.create!(valid_attributes)
    customer = described_class.new(valid_attributes.merge(company_name: "Other Inc."))

    expect(customer).not_to be_valid
    expect(customer.errors[:contact_email]).to be_present
  end

  it "is invalid without a customer status" do
    customer = described_class.new(valid_attributes.merge(customer_status: nil))

    expect(customer).not_to be_valid
    expect(customer.errors[:customer_status]).to be_present
  end
end
