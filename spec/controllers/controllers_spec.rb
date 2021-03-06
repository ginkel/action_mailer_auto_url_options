require 'spec_helper'

describe "Controllers" do

  controller do
    def index
      render text: "OK"
    end
  end

  before do
    @routes.draw do
      get 'index' => 'anonymous#index'
    end
  end

  it "sets the host" do
    request.host = "fr.example.com:8080"
    get :index

    host = ActionMailer::Base.default_url_options[:host]
    expect(host).to eq("fr.example.com:8080")
  end

  it "sets the protocol" do
    request.stub(:protocol).and_return("ftp://")
    get :index

    protocol = ActionMailer::Base.default_url_options[:protocol]
    expect(protocol).to eq("ftp://")
  end

end
