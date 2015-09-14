require 'spec_helper'

describe Project do
  context "correct project" do
    before do
      @project = Project.create(name: 'Facedook', short_description: 'Your d.',
                                markdown_description: 'Long description about project')
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

    it "should respond to full html description" do
      @project.should respond_to(:description)
    end

    it "should have not empty rendered html description" do
      @project.description.should_not be_empty
    end

    it "should respond for markdown description" do
      @project.should respond_to(:markdown_description)
    end
  end

  context "project with empty full description" do
    before do
      @incorrect_project = Project.create(name: 'Facedook',
                                          short_description: 'Your d.',
                                          description: '')
    end

    subject { @incorrect_project }

    it "should not be valid" do
      @incorrect_project.should_not be_valid
    end
  end

  context "project with empty short description" do
    before do
      @incorrect_project = Project.create(name: 'Facedook',
                                          short_description: '',
                                          description: 'Long story')
    end

    subject { @incorrect_project }

    it "should not be valid" do
      @incorrect_project.should_not be_valid
    end
  end

  context "project with empty name description" do
    before do
      @incorrect_project = Project.create(name: '',
                                          short_description: 'Your d.',
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
                                          short_description: 'a' * 147,
                                          description: 'Long story')
    end

    subject { @incorrect_project }

    it "should not be valid" do
      @incorrect_project.should_not be_valid
    end

    it "should pass after deleting one symbol from short description" do
      @incorrect_project.short_description = 'a' * 146
      @incorrect_project.should be_valid
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

    it "should pass after deleting one symbol from name" do
      @incorrect_project.name = 'a' * 50
      @incorrect_project.should be_valid
    end
  end

  context "testing markdown convertion function" do
    before do
      @project = Project.create(name: 'Facedook', short_description: 'Your d.',
                                markdown_description: '# Long story')
    end

    it "should convert text after '#' symbol to h1 tag" do
      @project.description.should eq("<h1>Long story</h1>")
    end

    it "should have unrendered markdown text" do
      @project.markdown_description.should eq("# Long story")
    end
  end
end
