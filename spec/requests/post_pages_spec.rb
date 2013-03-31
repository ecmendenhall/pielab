require 'spec_helper'

describe "Post pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "Post creation" do
    before { visit new_post_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Post, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
   end

    describe "with valid information" do

      before { fill_in 'post_title', with: "Pies are rad!" }
      before { fill_in 'post_content', with: "Pies are rad, guys!" }
      it "should create a post" do
        expect { click_button "Post" }.to change(Post, :count).by(1)
      end
    end
  end

  describe "Post edits" do
    before { @post = FactoryGirl.create(:post, user: user) }

    describe "as correct user" do
        before do
            visit edit_post_path(@post)
            fill_in 'post_title', with: "Edited post."
            fill_in 'post_content', with: "Edited content."
            click_button "Post"
            visit post_path(@post)
        end

        it { should have_selector('h3', text: "Edited post.") }
        it { should have_selector("div.post-content", text: "Edited content.") }
    end
  end

  describe "Post destruction" do
      before { @post = FactoryGirl.create(:post, user: user) }
      
      describe "as correct user" do
          before { visit post_path(@post) }

          it "should delete a post" do
              expect { click_link "Delete" }.to change(Post, :count).by(-1)
          end
      end
  end

  describe "Show post" do
      before { @post = FactoryGirl.create(:post, user: user) }
      before { visit post_path(@post) }
      it { should have_selector('h3', text: @post.title) }
      it { should have_selector('div.post-content', text: @post.content) }
  end
end
