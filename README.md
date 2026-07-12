# 📊 llm_financial_auditor (Ruby Gem)

<p align="center">
  <img src="https://img.shields.io/badge/ruby-%3E%3D2.5.0-red.svg?style=flat-square&logo=ruby" alt="Ruby Version" />
  <img src="https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square" alt="License" />
</p>

`llm_financial_auditor` is an AI-powered Financial Fraud & Ledger Transaction Auditor Gem for Ruby and Ruby on Rails. It integrates multiple LLMs/agents to vote on transaction anomalies and flags potential financial fraud on ledger streams using sequential testing (SPRT).

---

## 🚀 Quick Start (Ruby)

```ruby
require 'llm_financial_auditor'

# Initialize Ledger Auditor
auditor = LlmFinancialAuditor::LedgerAuditor.new(alpha: 0.05, beta: 0.10, p0: 0.02, p1: 0.10)

tx = LlmFinancialAuditor::Transaction.new("tx-99", 5000.0, "Alice", "UnknownAccount")

# Feed transaction and votes from 3 LLM agents (true = anomaly, false = normal)
decision = auditor.audit_transaction(tx, [true, true, false]) # 2 to 1 vote: anomaly

if decision == :lock_ledger
  puts "Excessive anomalies detected in transaction stream. Locking ledger!"
end
```

---

## 📄 License
MIT License.
