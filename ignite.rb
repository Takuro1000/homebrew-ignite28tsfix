class Ignite < Formula
  version "28.15.3" # バージョンを指定
  desc "Takuro1000 ignite ts test"
  homepage "https://github.com/Takuro1000/ignite28tsfix"
  url "https://github.com/Takuro1000/ignite28tsfix/archive/refs/tags/julienTS.tar.gz" # 最新のバージョンを指定
  sha256 "d46a8350d39c859b398e72604b02931b3976cbb39c377d8903be34cfb2ec414f" # 正しいSHA256ハッシュを指定

  depends_on "go"   # Goの依存関係
  depends_on "node" # Node.jsの依存関係

  def install
    system "go", "build", "-mod=readonly", *std_go_args(output: bin/"ignite"), "./ignite/cmd/ignite"
  end

  test do
    ENV["DO_NOT_TRACK"] = "1"
    system bin/"ignite", "s", "chain", "mars"
    assert_predicate testpath/"mars/go.mod", :exist?
  end
end
