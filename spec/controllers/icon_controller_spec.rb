require 'spec_helper'

describe IconController do
  before do
    @feed = FactoryGirl.create(:feed)
  end

  let(:image_header) {
    { filename: 'favicon', type: 'image/png', disposition: 'inline'}
  }

  describe 'GET /' do
    it "should send favicon" do
      expect(Feed).to receive(:find_by_feedlink).with(@feed.link) { @feed }
      expect(controller).to receive(:send_data).with(anything, image_header) {
        @controller.render nothing: true
      }
      get :get, feed: @feed.link
    end
  end
end
