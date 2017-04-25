require 'rails_helper'

describe MessagesController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:message) { attributes_for(:message) }
  let(:invalid_message) { attributes_for(:message, body: nil) }

  describe 'GET #index' do
    before do
      login_user user
      get :index, group_id: group
    end

    it "assigns the requested messsage to @message" do
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    before do
      login_user user
    end

    context 'if @message can be saved' do
      before do
        post :create, params: { group_id: group, message: message }
      end

      it "assigns the requested message to @message" do
        expect(assigns(:message)).to be_valid
      end

      it 'redirect to group_messages_path' do
        expect(response).to redirect_to group_messages_path
      end

      it 'flash[:success] will be displayed' do
        expect(flash[:notice]).not_to be_empty
      end
    end

    context 'if @message cant be saved' do
      before do
        post :create, params: { group_id: group, message: invalid_message}
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end

      it 'flash[:alert] will be displayed' do
        expect(flash[:alert]).not_to be_empty
      end
    end
  end
end
