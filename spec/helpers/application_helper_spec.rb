require 'spec_helper'

describe ApplicationHelper do
  describe 'getting full title' do
    it 'getting full title for one word' do
      helper.get_full_title('Контакты').should == 'Контакты — Сева Жидков'
    end

    it 'getting full title for few words' do
      helper.get_full_title('Обо мне').should == 'Обо мне — Сева Жидков'
    end

    it 'getting title without title' do
      helper.get_full_title().should == 'Сева Жидков'
    end
  end
end
