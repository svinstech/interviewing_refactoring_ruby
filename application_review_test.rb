require_relative "application_review"
require "test/unit"
require "json"

class TestApplicationReview < Test::Unit::TestCase
  def setup
    file = File.read('./application_review_output.json')
    @expected_hash = JSON.parse(file)
    @application_review_hash = ApplicationReview.to_hash
  end

  def test_meta_data_is_correct
    assert_equal(@application_review_hash["$schema"], @expected_hash["$schema"])
    assert_equal(@application_review_hash["type"], @expected_hash["type"])
    assert_equal(@application_review_hash["title"], @expected_hash["title"])
  end

  def test_the_correct_keys_in_all_of
    assert_equal(@application_review_hash["allOf"].map{|k| k.keys}, @expected_hash["allOf"].map{|k| k.keys})
  end

  def test_pii_fields
    assert_equal(@application_review_hash["allOf"][0], @expected_hash["allOf"][0]) 
  end

  def test_engineering_contractor_dependencies_fields
    assert_equal(@application_review_hash["allOf"][1], @expected_hash["allOf"][1]) 
  end
  
  def test_401k_dependencies_fields
    assert_equal(@application_review_hash["allOf"][2], @expected_hash["allOf"][2]) 
  end

  def test_benefits_dependencies_fields
    assert_equal(@application_review_hash["allOf"][3], @expected_hash["allOf"][3]) 
  end

  def test_pending_claims_dependencies_fields
    assert_equal(@application_review_hash["allOf"][4], @expected_hash["allOf"][4]) 
  end

  def test_current_claims_dependencies_fields
    assert_equal(@application_review_hash["allOf"][5], @expected_hash["allOf"][5]) 
  end

  def test_denied_coverage_dependencies_fields
    assert_equal(@application_review_hash["allOf"][6], @expected_hash["allOf"][6]) 
  end

  def test_filed_liability_claim_dependecies_fields
    assert_equal(@application_review_hash["allOf"][7], @expected_hash["allOf"][7]) 
  end

  def test_full_time_worker_dependencies_fields
    assert_equal(@application_review_hash["allOf"][8], @expected_hash["allOf"][8]) 
  end
end
