require 'minitest/autorun'
require_relative '../lib/llm_proof'

class TestSprtEvaluator < Minitest::Test
  def test_h0_decision
    evaluator = LlmProof::SprtEvaluator.new(alpha: 0.05, beta: 0.10, p0: 0.50, p1: 0.70)
    decision = :continue
    
    20.times do
      decision = evaluator.add_sample(false)
      break if decision != :continue
    end

    assert_equal :accept_h0, decision
  end

  def test_h1_decision
    evaluator = LlmProof::SprtEvaluator.new(alpha: 0.05, beta: 0.10, p0: 0.50, p1: 0.70)
    decision = :continue
    
    20.times do
      decision = evaluator.add_sample(true)
      break if decision != :continue
    end

    assert_equal :accept_h1, decision
  end
end
