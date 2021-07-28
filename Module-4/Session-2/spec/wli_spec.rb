require_relative "../src/wli.rb"

RSpec.describe Wli do
    it 'is 2 likes' do
        # given
        wli = Wli.new

        # when
        wli.names = ["Marro", "Sandy"]
        like = wli.likes

        # then
        expect(like).to eq("Marro and Sandy like this")
    end

    it 'is 3 likes' do
        wli = Wli.new

        wli.names = ["Marro", "Sandy", "Bagus"]
        like = wli.likes

        expect(like).to eq("Marro, Sandy and Bagus like this")
    end

    it 'is zero likes' do
        wli = Wli.new

        like = wli.likes

        expect(like).to eq("no one like this")
    end

    it 'is 1 likes' do
        wli = Wli.new

        wli.names = ["Marro"]
        like = wli.likes

        expect(like).to eq("Marro like this")
    end

    it 'is more then 3 likes' do
        wli = Wli.new

        wli.names = ["Marro", "Sandy", "Bagus", "Saputra"]
        like = wli.likes

        expect(like).to eq("Marro, Sandy and 2 others like this")
    end

end