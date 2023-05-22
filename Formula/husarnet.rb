class Husarnet < Formula
  desc "Low latency P2P VPN solution for robotics and more"
  homepage "https://husarnet.com"
  url "https://nightly.husarnet.com/husarnet-macos-2.0.146-arm64.tar.gz"
  version "2.0.146"
  sha256 "a065368ef6bbe4895b17b9232d5ecff46ee03d01fb51a5d78a99f4b8c1b8d502"
  license ""

  def install
    bin.install "husarnet-macos-arm64" => "husarnet"
    bin.install "husarnet-daemon-macos-macos_arm64" => "husarnet-daemon"
  end

  # def post_install
  #   print "Will attempt to install the service. This requires sudo privileges."
  #   system "sudo", "#{bin}/husarnet", "daemon", "service-install"
  # end

  def caveats
    <<~EOS
      If service installation fails, execute:
        sudo husarnet daemon service-install
      To start husarnet daemon and enable it on startup.
      Enjoy!
    EOS
  end

  service do
    run opt_bin/"husarnet-daemon"
    keep_alive true
    require_root true
    log_path var/"log/husarnet.log"
    error_log_path var/"log/husarnet.err.log"
  end

  test do
    system "#{bin}/husarnet", "version"
  end
end
