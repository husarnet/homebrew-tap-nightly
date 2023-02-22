class HusarnetMacos2064Arm64 < Formula
  desc "P2P VPN"
  homepage "https://husarnet.com"
  url "https://nightly.husarnet.com/husarnet-macos-2.0.64-arm64.tar.gz"
  sha256 "9eeb21607bb478e3322b119afcc23be4e1352598b4ffea497442dfb7985b2571"
  license ""

  # depends_on "cmake" => :build

  def install
    system "mv husarnet-macos-arm64 husarnet"
    system "mv husarnet-daemon-macos-arm64 husarnet-daemon"
    bin.install "husarnet"
    bin.install "husarnet-daemon"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test husarnet-macos-2.0.64-arm64`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "husarnet version"
  end
end
