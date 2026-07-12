module LlmProof
  class SprtEvaluator
    attr_reader :alpha, :beta, :p0, :p1, :sample_count, :success_count

    def initialize(alpha: 0.05, beta: 0.10, p0: 0.50, p1: 0.70)
      if p0 <= 0 || p0 >= 1 || p1 <= 0 || p1 >= 1 || p0 >= p1
        raise ArgumentError, "Hypothesis bounds must satisfy 0 < p0 < p1 < 1"
      end
      if alpha <= 0 || alpha >= 1 || beta <= 0 || beta >= 1
        raise ArgumentError, "Error bounds must satisfy 0 < alpha, beta < 1"
      end

      @alpha = alpha
      @beta = beta
      @p0 = p0
      @p1 = p1

      @log_lower_bound = Math.log(beta / (1.0 - alpha))
      @log_upper_bound = Math.log((1.0 - beta) / alpha)

      @log_likelihood_ratio = 0.0
      @sample_count = 0
      @success_count = 0
    end

    # Records a single boolean outcome (true for model win/success, false otherwise)
    # Returns :continue, :accept_h1, or :accept_h0
    def add_sample(is_success)
      @sample_count += 1
      @success_count += 1 if is_success

      p_success_ratio = @p1 / @p0
      p_failure_ratio = (1.0 - @p1) / (1.0 - @p0)

      @log_likelihood_ratio += Math.log(is_success ? pSuccessRatio = p_success_ratio : pFailureRatio = p_failure_ratio)

      if @log_likelihood_ratio >= @log_upper_bound
        :accept_h1
      elsif @log_likelihood_ratio <= @log_lower_bound
        :accept_h0
      else
        :continue
      end
    end

    def log_likelihood_ratio
      @log_likelihood_ratio
    end
  end
end
