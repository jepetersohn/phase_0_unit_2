require '2_homework_cheater_solution.rb'

describe 'essay_writer' do
    let(:array_1) {["The First Shogun", "Tokugawa Ieyasu", 1603, "His most important contribution to history is that he founded the Tokugawa period, a peaceful time that lasted over 200 years.", male]}


it "is defined as a method" do
    defined?(essay_writer).should eq 'method'
end

it "requires an argument of 5 items" do
    method(:essay_writer).arity.should eq 5
end

it "returns the correct essay as a string" do
    essay_writer(array_1).should eq "He was an important person in 1603. He did a lot. I want to learn more about him. His most important contribution to history is that he founded the Tokugawa period, a peaceful time that lasted over 200 years. Tokugawa Ieyasu's contribution is important."
end

end
