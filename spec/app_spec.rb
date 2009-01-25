require File.dirname(__FILE__) + '/spec_helper'
require Jigo.root / 'app'

describe 'Jigo' do
  describe "on index" do
    before(:all) do
      @gem = Gemlist.all.first
      get '/'
    end
    it 'should not error out' do
      @response.should be_ok
      body.should_not be_empty
    end
    
    it "should display a list containing gems" do
      body.should have_tag("ol") do |gems|
        gems.should have_tag("li > a[@href=#{@gem.main_rdoc_path}]", /#{@gem.name}/i)
      end
    end
    
    it "should contain an iframe containing the first gems rdoc" do
      body.should have_tag("iframe[@src=#{@gem.main_rdoc_path}]")
    end
  end
  
  describe "on main css" do
    it "should pass a css file" do
      get "/jigo.css"
      @response.should be_ok
      @response.headers.should include("Content-Type"=>"text/css")
      body.should_not be_empty
    end
  end
  
  describe "on rdoc passthru" do
    it "should not error out" do
      @gem = Gemlist.all.first
      get @gem.main_rdoc_path
      @response.should be_ok
      body.should_not be_empty
    end
  end
end
