Gem::Specification.new do |spec|
  spec.name          = "llm_proof"
  spec.version       = "0.1.0"
  spec.authors       = ["Sai Teja Bandaru"]
  spec.email         = ["Saitejaroyal2311@gmail.com"]

  spec.summary       = "Wald's Sequential Probability Ratio Testing (SPRT) statistical evaluator for LLM and AI agent output comparison in Ruby."
  spec.description   = "Rigorous, early-stopping model comparison algorithms for Ruby and Ruby on Rails AI platforms, saving up to 50%+ in LLM token evaluation cost."
  spec.homepage      = "https://github.com/saitejabandaru-in/llm-proof-ruby"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb", "README.md", "LICENSE"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5.0"
end
