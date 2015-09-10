require 'spec_helper'

describe Project do
  context "correct project" do
    before do
      @project = Project.create(name: 'Facedook', short_description: 'Your d.',
                                description: 'Long description about project')
    end

    subject { @project }

    it "should be valid" do
      @project.should be_valid
    end

    it "should respond to name" do
      @project.should respond_to(:name)
    end

    it "should respond to short_description" do
      @project.should respond_to(:short_description)
    end

    it "should respond to full description" do
      @project.should respond_to(:description)
    end
  end

  context "project with empty full description" do
    before do
      @project = Project.create(name: 'Facedook', short_description: 'Your d.',
                                description: '')
    end

    subject { @project }

    it "should not be valid" do
      @project.should_not be_valid
    end
  end
end
