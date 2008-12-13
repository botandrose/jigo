require File.dirname(__FILE__) + '/spec_helper'
require Jigo.root / 'lib/file_join'

describe "string core extension: / to replace File.join" do
  it "should concatenate strings together with /" do
    ("test" / "body" / "hmm").should == "test/body/hmm"
  end
  it "should not allow ajacent slashes" do
    ("test/" / "/body").should == "test/body"
  end
end
