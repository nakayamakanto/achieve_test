require "rails_helper"

describe Contact do
    it "メアド、名前、内容があると有効" do
       contact=Contact.new(email: "hoge@hoge.com", name: "hoge", content: "hoge")
       expect(contact).to be_valid
    end
    
    it "is invalid without email" do
        contact=Contact.new(name:"hoge", content:"hoge")
        expect(contact).not_to be_valid
    end
    
    it "is invalid without name" do
        contact=Contact.new(email: "hoge@hoge.com", content: "hoge")
        expect(contact).not_to be_valid
    end
    
    it "is invalid without content" do
        contact=Contact.new(email: "hoge@hoge.com", name: "hoge")
        expect(contact).not_to be_valid
    end
end