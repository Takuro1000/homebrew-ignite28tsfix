class Ignite < Formula
  desc "Takuro1000 ignite ts test"
  homepage "https://github.com/ignite/cli"
  url "https://github.com/Takuro1000/ignite28tsfix/archive/refs/tags/v28.5.3ts.tar.gz" # 最新のバージョンを指定
  sha256 "cb84ed7bb65c3e13f3f867f2ae98c317272f24a05f27eb88ad4cfd7212de0e34" # 正しいSHA256ハッシュを指定

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
