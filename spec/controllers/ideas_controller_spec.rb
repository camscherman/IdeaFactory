require 'rails_helper'


RSpec.describe IdeasController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  describe '#new' do
    before { request.session[:user_id] = user.id }
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
      end

    it "creates an instance variable called idea" do
      get :new

      expect(assigns(:idea)).to be_a_new(Idea)
    end
  end

  describe '#create' do
    before { request.session[:user_id] = user.id }
    context "with invalid params" do
      it "does not save the new idea" do
        count_before = Idea.count
        post :create, params: {idea: FactoryGirl.attributes_for(:idea).merge({title:nil})}

        count_after = Idea.count

        expect(count_after).to eq(count_before)
      end
      it "renders the new page" do
        post :create, params: {idea: FactoryGirl.attributes_for(:idea).merge({title:nil})}
        expect(response).to render_template(:new)
      end
    end

    context "with valid params" do
      it "saves the new idea to the database" do
        count_before = Idea.count
        post :create, params: { idea: FactoryGirl.attributes_for(:idea)}
        count_after = Idea.count
        expect(count_after).to eq(count_before + 1)
      end
      it "redirects to the index page" do
        post :create, params: { idea: FactoryGirl.attributes_for(:idea)}
        expect(response).to redirect_to(ideas_path)
      end
    end
  end

end
