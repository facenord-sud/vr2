require "spec_helper"

describe ObjectiveListsController do
  describe "routing" do

    it "routes to #index" do
      get("/objective_lists").should route_to("objective_lists#index")
    end

    it "routes to #new" do
      get("/objective_lists/new").should route_to("objective_lists#new")
    end

    it "routes to #show" do
      get("/objective_lists/1").should route_to("objective_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/objective_lists/1/edit").should route_to("objective_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/objective_lists").should route_to("objective_lists#create")
    end

    it "routes to #update" do
      put("/objective_lists/1").should route_to("objective_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/objective_lists/1").should route_to("objective_lists#destroy", :id => "1")
    end

  end
end
