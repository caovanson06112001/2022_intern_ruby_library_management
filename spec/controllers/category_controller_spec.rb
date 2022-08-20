require "rails_helper"
include SessionsHelper

RSpec.describe Admin::CategoryController, type: :controller do
  let(:admin){
    FactoryBot.create :user
  }
  let(:user1){
    FactoryBot.create :user
  }
  let(:category_1){
    FactoryBot.create :category
  }

  before do
    log_in admin
  end

  describe "GET amdin/category#index" do
    it "assign @categories" do
      get :index
      expect(assigns(:categories)).to eq([category_1])
    end

    it "render the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET amdin/category#new" do
    it "assign @categories" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST admin/category#create" do
    context "when valid attributes successfull" do
      before do
        post :create, params: {
            category: {name: "sach giao duc"},
          }
      end

      it "should display message flash" do
        expect(flash.now[:message]).to eq I18n.t("category.save")
      end

      it "should redirects to the admin category" do
        expect(response).to redirect_to admin_category_index_path
      end
    end

    context "when create category failed with wrong value" do
      before do
        post :create, params: {
            category: {name: ""},
          }
      end

      it "should display danger flash" do
        expect(flash.now[:danger]).to eq I18n.t("category.fails")
      end

      it "should render to new admin category path" do
        expect(response).to render_template :new
      end
    end
  end

  describe "GET amdin/category#edit" do
    context "When category is not found" do
      before do
        get :edit, params:{
          id: -1
        }
      end

      it "should display danger flash" do
        expect(flash[:danger]).to eq I18n.t("category.find_error")
      end
    end

    context "When category is found" do
      before do
        get :edit, params:{
          id: category_1.id
        }
      end

      it "should show category" do
        expect(response).to render_template :edit
      end
    end
  end

  describe "PATCH amdin/category#update" do
    context "when update category failed with wrong value" do
      before do
        patch :update, params:{
          id: category_1.id,
          category: {name: ""}
        }
      end

      it "should display danger flash" do
        expect(flash[:danger]).to eq I18n.t("category.update_fails")
      end

      it "should render edit category" do
        expect(response).to render_template :edit
      end
    end

    context "when update category successfull" do
      before do
        patch :update, params:{
          id: category_1.id,
          category: {name: "sach van hoc"}
        }
      end

      it "should display message flash" do
        expect(flash[:message]).to eq I18n.t("category.update")
      end

      it "should redirects to the admin category" do
        expect(response).to redirect_to admin_category_index_path
      end
    end
  end

  describe "DELETE amdin/category#update" do
    context "When category is not found" do
      before do
        delete :destroy, params:{
          id: -1
        }
      end

      it "should display danger flash" do
        expect(flash[:danger]).to eq I18n.t("category.find_error")
      end
    end

    context "When delete category successfull" do
      before do
        delete :destroy, params:{
          id: category_1.id
        }
      end

      it "should render json" do
        expect(response).to have_http_status 200
      end
    end

    context "When delete category failed" do
      before do
        delete :destroy, params:{
          id: -1
        }
      end

      it "should render json" do
        expect(response).to have_http_status 302
      end
    end
  end

end
