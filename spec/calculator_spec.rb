require 'spec_helper'
require 'calculator'

describe Calculator do
  let(:expression) { "1,2" }
  subject(:calculator) { Calculator.new(expression) }

  describe "new" do
    subject(:new) { Calculator.new(expression) }
    specify { expect { new }.to_not raise_error }
  end

  describe ".expr" do
    it { should respond_to(:expr) }
    its(:expr) { should eq([1,2]) }
    it "resets the expression" do
      calculator.expr = "2,3"
      calculator.expr.should eq([2,3])
    end
  end

  describe ".add" do
    it { should respond_to(:add) }
    its(:add) { should eq(3) }

    context " '' " do
      let(:expression) { '' }
      its(:add) { should eq(0) }
    end

    context "1" do
      let(:expression) { '1' }
      its(:add) { should eq(1) }
    end

    context "1,2,3" do
      let(:expression) { '1,2,3' }
      its(:add) { should eq(6) }
    end

    context "1,2,5,8" do
      let(:expression) { '1,2,5,8' }
      its(:add) { should eq(16) }
    end
  end

  describe ".diff" do
    it { should respond_to(:diff) }
    its(:diff) { should eq(-1) }
    context '1,0' do
      let(:expression) { '1,0' }
      its(:diff) { should eq(1) }
    end
    context 'less than 2 digit expression' do
      let(:expression) { '5' }
      specify { expect { calculator.diff }.to raise_exception }
    end
  end

  describe ".prod" do
    its(:prod) { should eq(2) }

    context '0' do
      let(:expression) { '0' }
      its(:prod) { should eq(0) }
    end
  end

  describe ".div" do
    its(:div) { should eq(0) }

    context "divide by zero" do
      let(:expression) { "1,2,3,0,99,1" }
      specify { expect { calculator.div }.to raise_exception }
    end

    context "3,2,1" do
      let(:expression) { "3,2,1" }
      its(:div) { should eq(1) }
    end
  end
end
