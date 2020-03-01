require_relative "application_review_static"
require_relative "application_review_refactor_me"
require "test/unit"
require "pry"

class TestApplicationReview < Test::Unit::TestCase
  def setup
    @applicaiton_review = ApplicationReview.to_hash
    @applicaiton_review_refactored = ApplicationReviewStatic.to_hash
  end

  def assert_dependency_equal(dependency)
    assert_equal(
      ApplicationReview.send(dependency),
      ApplicationReviewStatic.send(dependency),
    )
  end

  def test_metadata
    assert_equal(
      @applicaiton_review_refactored.keys,
      @applicaiton_review.keys,
    )
  end

  def test_dependencies
    %i[
      pii_dependencies
      engineering_contractor_dependencies
      benefits_dependencies
      pending_claims_dependencies
      current_claims_dependencies
      denied_coverage_dependencies
      filed_liability_claim_dependecies
      full_time_worker_dependencies
      dangerous_products_niche_requirements
      professional_license_business_niche_requirements
      certificate_business_niche_requirements
      mobile_games_niche_requirements
      physical_activity_business_niche_requirements
      contractor_dispute_niche_requirements
      medical_data_niche_requirements
      regulator_license_niche_requirements
      real_estate_license_niche_requirements
      advertising_claim_niche_requirements
      international_sales_niche_requirements
      physical_product_niche_requirements
      services_business_niche_requirements
      benefits_business_niche_requirements
      chemical_niche_requirements
      pollutant_niche_requirements
      accounting_business_niche_requirements
      finance_clients_business_niche_requirements
      real_estate_business_niche_requirements
      high_risk_client_niche_requirements
      blockchain_business_niche_requirements
      robotics_business_niche_requirements
      copyright_claim_niche_requirements
      consumer_loan_business_niche_requirements
      enterprise_finance_business_niche_requirements
      finance_business_niche_requirements
      enterprise_big_revenue_contract_niche_requirements
      big_revenue_contract_niche_requirements
      sensitive_pii_niche_requirements
    ].each do |dependency|
      assert_dependency_equal(dependency)
    end
  end

  def test_full_output
    assert_equal(@applicaiton_review, @applicaiton_review_refactored)
  end
end
