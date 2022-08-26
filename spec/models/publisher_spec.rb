require "rails_helper"

RSpec.describe Publisher, type: :model do
  let(:publisher){
    FactoryBot.create :publisher
  }

  let(:publisher_1){
    FactoryBot.create :publisher
  }

  let(:publisher_2){
    FactoryBot.create :publisher
  }

  describe "presence" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "Associations" do
    it { should have_many(:books).dependent(:destroy) }
  end

  describe "Validations" do
    context "when field name" do
      subject{FactoryBot.build(:publisher)}
      it {should validate_presence_of(:name)}
      it {is_expected.to validate_length_of(:name).is_at_least(Settings.publishers.min)}
      it {is_expected.to validate_length_of(:name).is_at_most(Settings.publishers.max)}
    end

    context "when field description" do
      subject{FactoryBot.build(:publisher)}
      it {should validate_presence_of(:description)}
      it {is_expected.to validate_length_of(:description).is_at_least(Settings.publishers.min)}
    end
  end

  describe "check scope" do
    context "orders by created_at descending" do
      it "Should order by created_at" do
        expect(Publisher.latest).not_to eq([publisher_1, publisher_2])
      end
    end
  end

  describe "when dispay image" do
    context "display image" do
      it "Should display image" do
        expect(publisher.display_image).to eq(Settings.publishers.avatar_default)
      end
    end
  end
end
