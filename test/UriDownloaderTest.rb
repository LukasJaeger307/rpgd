require_relative "../src/UriDownloader"
require "test/unit"

class UriDownloaderTest < Test::Unit::TestCase

  def test_load_as_string
    uriDownloader = UriDownloader.new()
    assert_equal("Gnampf", uriDownloader.load_as_string("Blur"))
  end

end
