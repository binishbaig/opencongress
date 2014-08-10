require 'spec_helper'
require 'pry'

describe IndexController do
  render_views
  describe 'index' do
    it 'should load' do
      get :index
      response.should be_success
    end

    it 'should load' do
      Article.should_receive(:frontpage_gossip).and_return([
        Article.new(
          :title => 'Title',
          :created_at => Time.now,
          :excerpt => 'blah, blah..'
        )
      ])
      get :index
      response.should have_selector("strong.gossip") do |content|
        content.text.should include('Title')
      end
    end
  end

  describe "pipa" do
    it "should render the pipa template" do
      get :pipa
      response.should render_template 'pipa'
    end
  end

  describe 'about' do
    it "should redirect to the about controller" do
      get :about
      response.should redirect_to :controller => 'about'
    end
  end

  describe "s1796_redirect" do
    it "should redirect to bill path" do
      get :s1796_redirect
      response.should redirect_to bill_path('111-s1796')
    end
  end


  describe "house_reconciliation" do
    it "should set @page_title" do
      title = 'Health Care Bill Text - H.R. 4872 - Reconciliation Act of 2010'
      get :house_reconciliation
      assigns(:page_title).should eq('Health Care Bill Text - H.R. 4872 - Reconciliation Act of 2010')
    end
  end

end
