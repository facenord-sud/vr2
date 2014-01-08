require "spec_helper"

describe CarreersController do
  describe "routing" do

    it "routes to #index" do
      get("/carreers").should route_to("carreers#index")
    end

    it "routes to #new" do
      get("/carreers/new").should route_to("carreers#new")
    end

    it "routes to #show" do
      get("/carreers/1").should route_to("carreers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/carreers/1/edit").should route_to("carreers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/carreers").should route_to("carreers#create")
    end

    it "routes to #update" do
      put("/carreers/1").should route_to("carreers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/carreers/1").should route_to("carreers#destroy", :id => "1")
    end

  end
end
