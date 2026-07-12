module LlmFinancialAuditor
  class Transaction
    attr_reader :id, :amount, :sender, :receiver, :metadata
    
    def initialize(id, amount, sender, receiver, metadata = {})
      @id = id
      @amount = amount
      @sender = sender
      @receiver = receiver
      @metadata = metadata
    end
  end

  class LedgerAuditor
    attr_reader :audited_count, :anomaly_count

    def initialize(alpha: 0.05, beta: 0.10, p0: 0.02, p1: 0.10)
      @alpha = alpha
      @beta = beta
      @p0 = p0
      @p1 = p1

      @log_lower_bound = Math.log(beta / (1.0 - alpha))
      @log_upper_bound = Math.log((1.0 - beta) / alpha)

      @log_likelihood_ratio = 0.0
      @audited_count = 0
      @anomaly_count = 0
    end

    # Audits a transaction based on AI models' consensus votes.
    # votes is an array of booleans (true for anomaly/fraud, false for normal) representing LLM predictions.
    # Returns :continue, :lock_ledger (anomalies detected beyond normal noise), or :approve_ledger (clear of structural anomalies).
    def audit_transaction(transaction, votes)
      @audited_count += 1
      
      # AI Model Consensus (Majority Vote)
      anomaly_votes = votes.count(true)
      is_anomaly = anomaly_votes > (votes.size / 2)
      
      if is_anomaly
        @anomaly_count += 1
      end

      p_success_ratio = @p1 / @p0
      p_failure_ratio = (1.0 - @p1) / (1.0 - @p0)

      @log_likelihood_ratio += Math.log(is_anomaly ? p_success_ratio : p_failure_ratio)

      if @log_likelihood_ratio >= @log_upper_bound
        :lock_ledger
      elsif @log_likelihood_ratio <= @log_lower_bound
        :approve_ledger
      else
        :continue
      end
    end

    def log_likelihood_ratio
      @log_likelihood_ratio
    end
  end
end
