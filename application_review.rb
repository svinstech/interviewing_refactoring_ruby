class ApplicationReview
  def self.to_hash
    schema_definition
  end

  def self.schema_definition
    {
      "$schema" => "http://json-schema.org/draft-04/schema#",
      "type" => "object",
      "title" => "Definition dictionary schema",
      "allOf" => application_review_requirements,
    }
  end

  def self.application_review_requirements
    result = []

    # boolean depedencies
    result << pii_dependencies
    result << engineering_contractor_dependencies
    result << benefits_dependencies
    result << pending_claims_dependencies

    # insurance history container dependencies
    result << current_claims_dependencies
    result << denied_coverage_dependencies
    result << filed_liability_claim_dependecies

    # numeric dependencies
    result << full_time_worker_dependencies

    result
  end

  def self.pii_dependencies
    {
      "oneOf_01" => [
        {
          "properties" => {
            "2019-07-01--HAS_ANY_PII" => {
              "type" => "boolean",
              "enum" => [false],
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--HAS_ANY_PII" => {
              "type" => "boolean",
              "enum" => [true],
            },
            "2019-07-01--PII_AMOUNT" => { "$ref" => "#/definitions/2019-07-01--PII_AMOUNT" },
          },
          "required" => ["2019-07-01--PII_AMOUNT"],
        },
      ],
    }
  end

  def self.engineering_contractor_dependencies
    {
      "oneOf_02" => [
        {
          "properties" => {
            "2019-07-01--HAS_ENGINEERING_CONTRACTORS" => {
              "type" => "boolean",
              "enum" => [false],
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--HAS_ENGINEERING_CONTRACTORS" => {
              "type" => "boolean",
              "enum" => [true],
            },
            "2019-07-01--NUM_ENGINEERING_CONTRACTORS" => { "$ref" => "#/definitions/2019-07-01--NUM_ENGINEERING_CONTRACTORS" },
          },
          "required" => ["2019-07-01--NUM_ENGINEERING_CONTRACTORS"],
        },
      ],
    }
  end

  def self.benefits_dependencies
    {
      "oneOf_03" => [
        {
          "properties" => {
            "2019-07-01--HAS_401K" => {
              "type" => "boolean",
              "enum" => [false],
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--HAS_401K" => {
              "type" => "boolean",
              "enum" => [true],
            },
            "2019-07-01--BENEFITS_WORTH" => { "$ref" => "#/definitions/2019-07-01--BENEFITS_WORTH" },
          },
          "required" => ["2019-07-01--BENEFITS_WORTH"],
        },
      ],
    }
  end

  def self.pending_claims_dependencies
    {
      "oneOf_04" => [
        {
          "properties" => {
            "2019-07-01--HAS_PENDING_CLAIMS" => {
              "type" => "boolean",
              "enum" => [false],
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--HAS_PENDING_CLAIMS" => {
              "type" => "boolean",
              "enum" => [true],
            },
            "2019-07-01--PENDING_CLAIMS_DESCRIPTION" => { "$ref" => "#/definitions/2019-07-01--PENDING_CLAIMS_DESCRIPTION" },
          },
          "required" => ["2019-07-01--PENDING_CLAIMS_DESCRIPTION"],
        },
      ],
    }
  end

  def self.current_claims_dependencies
    {
      "oneOf_05" => [
        {
          "properties" => {
            "2019-07-01--INSURANCE_HISTORY_CONTAINER" => {
              "type" => "object",
              "properties" => {
                "2019-07-01--HAS_CURRENT_CLAIMS" => {
                  "type" => "boolean",
                  "enum" => [false],
                },
              },
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--INSURANCE_HISTORY_CONTAINER" => {
              "type" => "object",
              "properties" => {
                "2019-07-01--HAS_CURRENT_CLAIMS" => {
                  "type" => "boolean",
                  "enum" => [true],
                },
              },
            },
            "2019-07-01--CURRENT_CLAIMS_DESCRIPTION" => { "$ref" => "#/definitions/2019-07-01--CURRENT_CLAIMS_DESCRIPTION" },
          },
          "required" => ["2019-07-01--CURRENT_CLAIMS_DESCRIPTION"],
        },
      ],
    }
  end

  def self.denied_coverage_dependencies
    {
      "oneOf_06" => [
        {
          "properties" => {
            "2019-07-01--INSURANCE_HISTORY_CONTAINER" => {
              "type" => "object",
              "properties" => {
                "2019-07-01--HAS_DENIED_COVERAGE" => {
                  "type" => "boolean",
                  "enum" => [false],
                },
              },
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--INSURANCE_HISTORY_CONTAINER" => {
              "type" => "object",
              "properties" => {
                "2019-07-01--HAS_DENIED_COVERAGE" => {
                  "type" => "boolean",
                  "enum" => [true],
                },
              },
            },
            "2019-07-01--DENIED_COVERAGE_DESCRIPTION" => { "$ref" => "#/definitions/2019-07-01--DENIED_COVERAGE_DESCRIPTION" },
          },
          "required" => ["2019-07-01--DENIED_COVERAGE_DESCRIPTION"],
        },
      ],
    }
  end

  def self.filed_liability_claim_dependecies
    {
      "oneOf_07" => [
        {
          "properties" => {
            "2019-07-01--INSURANCE_HISTORY_CONTAINER" => {
              "type" => "object",
              "properties" => {
                "2019-07-01--HAS_FILED_LIABILITY_CLAIM" => {
                  "type" => "boolean",
                  "enum" => [false],
                },
              },
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--INSURANCE_HISTORY_CONTAINER" => {
              "type" => "object",
              "properties" => {
                "2019-07-01--HAS_FILED_LIABILITY_CLAIM" => {
                  "type" => "boolean",
                  "enum" => [true],
                },
              },
            },
            "2019-07-01--PAYOUT_AMOUNT" => { "$ref" => "#/definitions/2019-07-01--PAYOUT_AMOUNT" },
            "2019-07-01--PAYOUT_DESCRIPTION" => { "$ref" => "#/definitions/2019-07-01--PAYOUT_DESCRIPTION" },
          },
          "required" => ["2019-07-01--PAYOUT_AMOUNT", "2019-07-01--PAYOUT_DESCRIPTION"],
        },
      ],
    }
  end

  def self.insurance_requirements_format_dependencies
    {
      "oneOf_08" => [
        {
          "properties" => {
            "2019-07-01--HAS_INSURANCE_REQS" => {
              "type" => "boolean",
              "enum" => [false],
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--INSURANCE_REQ_FORMAT" => {
              "type" => "string",
              "enum" => ["manual"],
            },
            "2019-07-01--MANUAL_INSURANCE_REQS" => { "$ref" => "#/definitions/2019-07-01--MANUAL_INSURANCE_REQS" },
          },
          "required" => ["2019-07-01--MANUAL_INSURANCE_REQS"],
        },
        {
          "properties" => {
            "2019-07-01--INSURANCE_REQ_FORMAT" => {
              "type" => "string",
              "enum" => ["high-touch"],
            },
            "2019-07-01--HIGH_TOUCH_INSURANCE_REQS" => { "$ref" => "#/definitions/2019-07-01--HIGH_TOUCH_INSURANCE_REQS" },
          },
          "required" => ["2019-07-01--HIGH_TOUCH_INSURANCE_REQS"],
        },
      ],
    }
  end

  def self.full_time_worker_dependencies
    {
      "oneOf_09" => [
        {
          "properties" => {
            "2019-07-01--NUM_FULL_TIME_WORKERS" => {
              "type" => "number",
              "maximum" => 24,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--NUM_FULL_TIME_WORKERS" => {
              "type" => "number",
              "minimum" => 25,
            },
            "2019-07-01--NUM_INVOLUNTARY_TERMINATION" => { "$ref" => "#/definitions/2019-07-01--NUM_INVOLUNTARY_TERMINATION" },
            "2019-07-01--HAS_401K" => { "$ref" => "#/definitions/2019-07-01--HAS_401K" },
          },
          "required" => ["2019-07-01--NUM_INVOLUNTARY_TERMINATION", "2019-07-01--HAS_401K"],
        },
      ],
    }
  end
end
