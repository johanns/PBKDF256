require 'spec_helper'
require 'pbkdf256'

describe PBKDF256 do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end
end

describe "PBKDF256::pbkdf2_sha256 returned bits" do
  it "should match test vectors" do
    PBKDF256.pbkdf2_sha256("", "", 1, 16).unpack("H*").first.should eq("f7ce0b653d2d72a4108cf5abe912ffdd")

    PBKDF256.pbkdf2_sha256("password", "NaCl", 1000, 32).unpack("H*").first.should\
      eq("67dbcc78548a75328f6890125bec2c59876e8de2e4c92c99b201872a760e2aec")

    PBKDF256.pbkdf2_sha256("pleaseletmein", "SodiumChloride", 2000, 64).unpack("H*").first.should\
      eq("36b238ac8d027e1f36d6f0b4438e1943be7af230856513f5d54d58689991726414b3603ab229d8a4f54c6ab5ebdc2ff6c55e9924e1d228e9d7a36cf0a4757d3a")

    PBKDF256.pbkdf2_sha256("pleaseletmein", "SodiumChloride", 100000, 64).unpack("H*").first.should\
      eq("8270be2612522a439dc2c9629b18fdbbb364e35c6b5080d9bfe2176ca0e7a432b0625aa2177f75080844ec32bc226968381c07ebca0fe162d6df11af975be70e")
  end
end