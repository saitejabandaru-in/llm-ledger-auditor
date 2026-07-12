# 📊 llm_proof (Ruby)

<p align="center">
  <img src="https://img.shields.io/badge/ruby-%3E%3D2.5.0-red.svg?style=flat-square&logo=ruby" alt="Ruby Version" />
  <img src="https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square" alt="License" />
</p>

`llm_proof` is a fast Wald's Sequential Probability Ratio Testing (SPRT) statistical evaluator for LLM and AI agent comparison in Ruby. It lets you statistically compare LLM responses in Ruby on Rails applications and stop testing early as soon as mathematical significance is reached, saving up to 50%+ in token evaluation costs.

---

## 🚀 Quick Start (Ruby)

```ruby
require 'llm_proof'

# Configure evaluator (alpha = 5%, beta = 10%)
evaluator = LlmProof::SprtEvaluator.new(alpha: 0.05, beta: 0.10, p0: 0.50, p1: 0.70)

# Record outcomes (true for preferred model win, false otherwise)
evaluator.add_sample(true)
evaluator.add_sample(true)

decision = evaluator.add_sample(true)

if decision == :accept_h1
  puts "Alternative model is statistically superior. Stop testing early!"
end
```

---

## 📄 License
MIT License.
