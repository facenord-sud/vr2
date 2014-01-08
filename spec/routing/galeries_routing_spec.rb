require "spec_helper"

describe GaleriesController do
  describe "routing" do

    it "routes to #index" do
      get("/galeries").should route_to("galeries#index")
    end

    it "routes to #new" do
      get("/galeries/new").should route_to("galeries#new")
    end

    it "routes to #show" do
      get("/galeries/1").should route_to("galeries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/galeries/1/edit").should route_to("galeries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/galeries").should route_to("galeries#create")
    end

    it "routes to #update" do
      put("/galeries/1").should route_to("galeries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/galeries/1").should route_to("galeries#destroy", :id => "1")
    end

  end
end
