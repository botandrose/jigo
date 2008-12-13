require File.dirname(__FILE__) + '/spec_helper'
require Jigo.root / 'app'

describe Gemlist do
  describe "new method" do
    it "should return an object with a name and versions" do
      gem_spec = mock("Fake Gem Spec", :name => "fake_gem")
      @g = Gemlist.new(gem_spec)
      @g.name.should == gem_spec.name
      @g.versions.should include(gem_spec)
    end
  end
  
  describe "<=> method" do
    it "should compare the gems by name" do
      @g1 = Gemlist.new mock("Fake Gem Spec 1", :name => "fake_gem")
      @g2 = Gemlist.new mock("Fake Gem Spec 2", :name => "crappy_gem")
      @g1.should > @g2
    end
  end
  
  describe "main_rdoc_path method" do
    it "should return nil if there are no rdocs for any versions" do
      @g = Gemlist.new mock("Fake Gem Spec 1", :name => "fake_gem")
      @g.stub!(:available_versions).and_return([])
      @g.main_rdoc_path.should be_nil
    end
  end
end
