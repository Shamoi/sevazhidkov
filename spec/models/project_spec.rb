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
      @incorrect_project = Project.create(name: 'Facedook', short_description: 'Your d.',
                                          description: '')
    end

    subject { @incorrect_project }

    it "should not be valid" do
      @incorrect_project.should_not be_valid
    end
  end

  context "project with empty short description" do
    before do
      @incorrect_project = Project.create(name: 'Facedook', short_description: '',
                                          description: 'Long story')
    end

    subject { @incorrect_project }

    it "should not be valid" do
      @incorrect_project.should_not be_valid
    end
  end

  context "project with empty name description" do
    before do
      @incorrect_project = Project.create(name: '', short_description: 'Your d.',
                                          description: 'Long story')
    end

    subject { @incorrect_project }

    it "should not be valid" do
      @incorrect_project.should_not be_valid
    end
  end

  context "project with too many symbols in short description" do
    before do
      # Limit for short description - 146 characters
      @incorrect_project = Project.create(name: 'Facebook',
                                          short_description: 'Your d.',
                                          description: 'a' * 147)
    end

    subject { @incorrect_project }

    it "should not be valid" do
      @incorrect_project.should_not be_valid
    end
  end

  context "project with too many symbols in project name" do
    before do
      # Limit for name - 50 characters
      @incorrect_project = Project.create(name: 'a' * 51,
                                          short_description: 'Your d.',
                                          description: 'Long story')
    end

    subject { @incorrect_project }

    it "should not be valid" do
      @incorrect_project.should_not be_valid
    end
  end
end
