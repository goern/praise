require "spec_helper"

describe LobsController do
  describe "routing" do

    it "routes to #index" do
      get("/lobs").should route_to("lobs#index")
    end

    it "routes to #new" do
      get("/lobs/new").should route_to("lobs#new")
    end

    it "routes to #show" do
      get("/lobs/1").should route_to("lobs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lobs/1/edit").should route_to("lobs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lobs").should route_to("lobs#create")
    end

    it "routes to #update" do
      put("/lobs/1").should route_to("lobs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lobs/1").should route_to("lobs#destroy", :id => "1")
    end

  end
end
