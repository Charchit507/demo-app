require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_one_attached(:avatar) }
  end

  describe 'callbacks' do
    it 'triggers the send_welcome_mail callback after create' do
      allow(UserMailer).to receive_message_chain(:with, :welcome_email, :deliver_now)
    end
  end

  describe 'methods' do
    it 'returns the full name of the user' do
      u = User.new(first_name: "Charchit", last_name: "Khandelwal")
      expect(u.full_name).to eq("Charchit Khandelwal")
    end
  end

  describe 'devise modules' do
    it 'includes database_authenticatable module' do
      expect(described_class.devise_modules).to include(:database_authenticatable)
    end

    it 'includes registerable module' do
      expect(described_class.devise_modules).to include(:registerable)
    end

    it 'includes recoverable module' do
      expect(described_class.devise_modules).to include(:recoverable)
    end

    it 'includes rememberable module' do
      expect(described_class.devise_modules).to include(:rememberable)
    end

    it 'includes validatable module' do
      expect(described_class.devise_modules).to include(:validatable)
    end

    it 'includes omniauthable module' do
      expect(described_class.devise_modules).to include(:omniauthable)
    end

    it 'includes trackable module' do
      expect(described_class.devise_modules).to include(:trackable)
    end
  end

  it 'has omniauth_providers set to [:google_oauth2]' do
    expect(described_class.omniauth_providers).to eq([:google_oauth2])
  end

end
