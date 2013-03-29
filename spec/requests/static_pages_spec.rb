require 'spec_helper'

describe "StaticPages" do

    describe "Home page" do

        it "should have the h1 'PieLab'" do
            visit '/static_pages/home'
            page.should have_selector('h1',
                                      :text => 'PieLab')
        end

        it "should have the title 'Home'" do
            visit '/static_pages/home'
            page.should have_selector('title',
                                      :text => 'PieLab | Home')
        end
    end

    describe "Help page" do

        it "should have the h1 'PieLab Help'" do
            visit '/static_pages/help'
            page.should have_selector('h1',
                                      :text => 'PieLab Help')
        end

        it "should have the title 'Help'" do
            visit '/static_pages/help'
            page.should have_selector('title',
                                      :text => 'PieLab | Help')
        end
    end

    describe "About page" do

        it "should have the h1 'About PieLab'" do
            visit '/static_pages/about'
            page.should have_selector('h1',
                                     :text => 'About PieLab')
        end
    end

    it "should have the title 'About'" do
            visit '/static_pages/about'
            page.should have_selector('title',
                                      :text => 'PieLab | About')
        end

end
