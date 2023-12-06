Rails.configuration.stripe = {
  publishable_key: "pk_test_51OKAjJLsHzh4QMRUzPhk04LyrTZkBVwRVoLdZcvO8EGOfGkZc6GQ77mUTky0ZFGkBuRdMgQ40vLGuk8yYRzPd2s700BbdlevIk",
  secret_key:      "sk_test_51OKAjJLsHzh4QMRUGZyqZLodsovqIAMAgL3yJQMtUVpPiKHYZlJvAMvVEVjPHgnny7WbWhA3PKNll695FpjiQBu200aCWja120"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
