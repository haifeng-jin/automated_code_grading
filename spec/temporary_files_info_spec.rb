require 'spec_helper'
require 'executor/temporary_files_info'

describe TemporaryFilesInfo do
  before :each do
    @temp = TemporaryFilesInfo.new('/path')
  end
end

describe "#new" do
    it "takes one parameter and returns a TemporaryFilesInfo object" do
        @temp.should be_an_instance_of TemporaryFilesInfo
    end
end
