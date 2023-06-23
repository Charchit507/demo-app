require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_least(5) }
  it { should have_many(:comments).dependent(:destroy) }

  it 'has pagination set to 10' do
    expect(Article.default_per_page).to eq(10)
  end
end
