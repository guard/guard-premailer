require 'spec_helper'

describe Guard::Premailer do
  subject { Guard::Premailer.new }
  
  describe 'run all' do
    it 'should rebuild all files being watched' do
      Guard::Premailer.stub(:run_on_change).with([]).and_return([])
      Guard.stub(:guards).and_return([subject])
      subject.run_all
    end
  end
  
  describe '#get_output' do
    context 'by default' do
      it 'should return test/index.html as test/index.html' do
        subject.get_output('test/index.html').should eq('test/index.html')
      end
      
      it 'should return test/index.htm as test/index.htm' do
        subject.get_output('test/index.htm').should eq('test/index.htm')
      end
    end
    
    context 'when the output option is set to "demo/output"' do
      before do
        subject.options[:output] = 'demo/output'
      end
      
      it 'should return test/index.html as demo/output/test/index.html' do
        subject.get_output('test/index.html').should eq('demo/output/test/index.html')
      end
    end
    
    context 'when the input option is set to "test/ignore"' do
      before do
        subject.options[:input] = 'test/ignore'
      end
      
      it 'should return test/ignore/index.html as index.html' do
        subject.get_output('test/ignore/index.html').should eq('index.html')
      end
      
      context 'when the output option is set to "demo/output"' do
        before do
          subject.options[:output] = 'demo/output'
        end
        
        it 'should return test/ignore/abc/index.html as demo/output/abc/index.html' do
          subject.get_output('test/ignore/abc/index.html').should eq('demo/output/abc/index.html')
        end
      end
    end
  end
  
  describe 'building haml to html' do
    it 'should notify other guards upon completion' do
      other_guard = mock('guard')
      other_guard.should_receive(:watchers).and_return([])
      Guard.stub(:guards).and_return([subject, other_guard])
      subject.notify([])
    end
  end  
end
