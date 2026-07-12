Gem::Specification.new do |spec|
  spec.name          = "llm_audit"
  spec.version       = "0.2.0"
  spec.authors       = ["Sai Teja Bandaru"]
  spec.email         = ["Saitejaroyal2311@gmail.com"]

  spec.summary       = "AI-powered Financial Fraud & Ledger Transaction Auditor Gem."
  spec.description   = "Integrates multiple LLMs to vote on transaction anomalies and flags potential financial fraud on ledger streams using sequential testing."
  spec.homepage      = "https://github.com/saitejabandaru-in/llm-audit"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb", "README.md", "LICENSE"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5.0"
end
