class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  version "2.0.134" # fake bump, to reload homebrew and figure out its behavior
  url "https://nightly.husarnet.com/husarnet-macos-2.0.134-arm64.tar.gz"
  sha256 "2788d3c48564b81bf8fe0aaba8f632d82bcf1b9d0b4dbd1a6c9f3cbc9f3f7c0f"
  license ""

  def install
    bin.install "husarnet-macos-arm64" => "husarnet"
    bin.install "husarnet-daemon-unix-macos_arm64" => "husarnet-daemon"
  end

  def post_install
    print "Will attempt to install the service. This requires sudo privileges."
    system "sudo", "#{bin}/husarnet", "daemon", "service-install"
  end

  def caveats
    s = <<~EOS
      If service installation fails, execute:
        sudo husarnet daemon service-install
      To start husarnet daemon and enable it on startup.
      Enjoy!
    EOS
    s
  end

  test do
    system "#{bin}/husarnet", "version"
  end
end
