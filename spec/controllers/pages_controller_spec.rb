require 'spec_helper'

describe PagesController do
  integrate_views




  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      response.should have_tag("title", "Ruby on Rails Tutorial Sample App | Home" )
    end
    
     describe "when signed in" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        other_user = Factory(:user, :email => Factory.next(:email))
        other_user.follow!(@user)
      end

      it "should have the right follower/following counts" do
        get :home
        response.should have_tag("a[href=?]", following_user_path(@user), 
                                              /0 following/)
        response.should have_tag("a[href=?]", followers_user_path(@user), 
                                              /1 follower/)
      end
    end
  end 


  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.should have_tag("title", "Ruby on Rails Tutorial Sample App | Contact" )
    end
  end


  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

      it "should have the right title" do
      get 'about'
      response.should have_tag("title", "Ruby on Rails Tutorial Sample App | About" )
    end
  end


    describe "GET 'contact'" do
       it "should be successful" do
     get 'help'
     response.should be_success
    end
 
 
    it "should have the right title" do
      get 'help'
      response.should have_tag("title", "Ruby on Rails Tutorial Sample App | Help" )
    end
   end 


end  
