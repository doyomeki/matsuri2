require "spec_helper"

describe Admin::BoothsController do
  describe "routing" do

    it "routes to #index" do
      get("/booths").should route_to("booths#index")
    end

    it "routes to #new" do
      get("/booths/new").should route_to("booths#new")
    end

    it "routes to #show" do
      get("/booths/1").should route_to("booths#show", :id => "1")
    end

    it "routes to #edit" do
      get("/booths/1/edit").should route_to("booths#edit", :id => "1")
    end

    it "routes to #create" do
      post("/booths").should route_to("booths#create")
    end

    it "routes to #update" do
      put("/booths/1").should route_to("booths#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/booths/1").should route_to("booths#destroy", :id => "1")
    end

  end
end
