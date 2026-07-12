require 'minitest/autorun'
require_relative '../lib/llm_financial_auditor'

class TestLedgerAuditor < Minitest::Test
  def setup
    @auditor = LlmFinancialAuditor::LedgerAuditor.new(alpha: 0.05, beta: 0.10, p0: 0.02, p1: 0.10)
  end

  def test_consensus_normal_transactions
    decision = :continue
    tx = LlmFinancialAuditor::Transaction.new("tx-1", 100.0, "Alice", "Bob")
    
    # 40 normal transactions where the majority of 3 LLMs vote false
    40.times do |i|
      decision = @auditor.audit_transaction(tx, [false, false, true]) # 2 to 1 vote: normal
      break if decision != :continue
    end

    assert_equal :approve_ledger, decision
    assert_equal 0, @auditor.anomaly_count
  end

  def test_consensus_fraud_triggers_lock
    decision = :continue
    tx = LlmFinancialAuditor::Transaction.new("tx-2", 9999.0, "Alice", "Chacker")

    # 15 fraudulent transactions where the majority of 3 LLMs vote true
    15.times do |i|
      decision = @auditor.audit_transaction(tx, [true, true, false]) # 2 to 1 vote: anomaly
      break if decision != :continue
    end

    assert_equal :lock_ledger, decision
    assert_operator @auditor.anomaly_count, :>, 0
  end
end
