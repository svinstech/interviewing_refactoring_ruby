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

    # niche dependencies
    result << dangerous_products_niche_requirements
    result << professional_license_business_niche_requirements
    result << certificate_business_niche_requirements
    result << mobile_games_niche_requirements
    result << physical_activity_business_niche_requirements
    result << contractor_dispute_niche_requirements
    result << medical_data_niche_requirements
    result << regulator_license_niche_requirements
    result << real_estate_license_niche_requirements
    result << advertising_claim_niche_requirements
    result << international_sales_niche_requirements
    result << physical_product_niche_requirements
    result << services_business_niche_requirements
    result << benefits_business_niche_requirements
    result << chemical_niche_requirements
    result << pollutant_niche_requirements
    result << accounting_business_niche_requirements
    result << finance_clients_business_niche_requirements
    result << real_estate_business_niche_requirements
    result << high_risk_client_niche_requirements
    result << blockchain_business_niche_requirements
    result << robotics_business_niche_requirements
    result << copyright_claim_niche_requirements
    result << consumer_loan_business_niche_requirements
    result << enterprise_finance_business_niche_requirements
    result << finance_business_niche_requirements
    result << enterprise_big_revenue_contract_niche_requirements
    result << big_revenue_contract_niche_requirements
    result << sensitive_pii_niche_requirements

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

  def self.dangerous_products_niche_requirements
    {
      "oneOf_10" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - dangerous_products_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => dangerous_products_niches,
            },
            "2019-07-01--HAS_DANGEROUS_PRODUCTS" => { "$ref" => "#/definitions/2019-07-01--HAS_DANGEROUS_PRODUCTS" },
          },
          "required" => ["2019-07-01--HAS_DANGEROUS_PRODUCTS"],
        },
      ],
    }
  end

  def self.dangerous_products_niches
    @dangerous_products_niches ||= [
      "e-Commerce",
      "Retail Brands",
      "Marketplaces",
      "Subscription",
    ]
  end

  def self.professional_license_business_niche_requirements
    {
      "oneOf_11" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - professional_license_business_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => professional_license_business_niches,
            },
            "2019-07-01--HAS_PROFESSIONAL_LICENSE_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_PROFESSIONAL_LICENSE_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_PROFESSIONAL_LICENSE_BUSINESS"],
        },
      ],
    }
  end

  def self.professional_license_business_niches
    @professional_license_business_niches ||= [
      "On-Demand Services",
      "Marketplaces",
    ]
  end

  def self.certificate_business_niche_requirements
    {
      "oneOf_12" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - certificate_business_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => certificate_business_niches,
            },
            "2019-07-01--HAS_CERTIFICATE_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_CERTIFICATE_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_CERTIFICATE_BUSINESS"],
        },
      ],
    }
  end

  def self.certificate_business_niches
    @certificate_business_niches ||= [
      "Education Technology",
      "Education Technology - Enterprise",
    ]
  end

  def self.mobile_games_niche_requirements
    {
      "oneOf_13" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - mobile_games_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => mobile_games_niches,
            },
            "2019-07-01--HAS_MOBILE_GAMES" => { "$ref" => "#/definitions/2019-07-01--HAS_MOBILE_GAMES" },
          },
          "required" => ["2019-07-01--HAS_MOBILE_GAMES"],
        },
      ],
    }
  end

  def self.mobile_games_niches
    @mobile_games_niches ||= ["Gaming"]
  end

  def self.physical_activity_business_niche_requirements
    {
      "oneOf_14" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - physical_activity_business_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => physical_activity_business_niches,
            },
            "2019-07-01--HAS_PHYSICAL_ACTIVITY_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_PHYSICAL_ACTIVITY_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_PHYSICAL_ACTIVITY_BUSINESS"],
        },
      ],
    }
  end

  def self.physical_activity_business_niches
    @physical_activity_business_niches ||= [
      "Health & Wellness",
      "Connected Home",
      "Toys, Entertainment & Media",
      "Drones",
      "Wearables, Health Tech, Connected Self",
      "VR/AR Hardware and Distribution",
    ]
  end

  def self.contractor_dispute_niche_requirements
    {
      "oneOf_15" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - contractor_dispute_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => contractor_dispute_niches,
            },
            "2019-07-01--HAS_CONTRACTORS_DISPUTES" => { "$ref" => "#/definitions/2019-07-01--HAS_CONTRACTORS_DISPUTES" },
          },
          "required" => ["2019-07-01--HAS_CONTRACTORS_DISPUTES"],
        },
      ],
    }
  end

  def self.contractor_dispute_niches
    @contractor_dispute_niches ||= [
      "Marketplaces",
      "On-Demand Services",
    ]
  end

  def self.medical_data_niche_requirements
    {
      "oneOf_16" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - medical_data_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => medical_data_niches,
            },
            "2019-07-01--HAS_MEDICAL_DATA" => { "$ref" => "#/definitions/2019-07-01--HAS_MEDICAL_DATA" },
          },
          "required" => ["2019-07-01--HAS_MEDICAL_DATA"],
        },
      ],
    }
  end

  def self.medical_data_niches
    @medical_data_niches ||= ["Health & Wellness"]
  end

  def self.regulator_license_niche_requirements
    {
      "oneOf_17" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - regulator_license_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => regulator_license_niches,
            },
            "2019-07-01--HAS_REGULATOR_LICENSE" => { "$ref" => "#/definitions/2019-07-01--HAS_REGULATOR_LICENSE" },
          },
          "required" => ["2019-07-01--HAS_REGULATOR_LICENSE"],
        },
      ],
    }
  end

  def self.regulator_license_niches
    @regulator_license_niches ||= [
      "Insurance Tech - Life or Annuities",
      "Insurance Tech - Property & Casualty",
      "Insurance Tech - Health",
      "Alternative Lending",
      "Personal Finance and Wealth Management",
    ]
  end

  def self.real_estate_license_niche_requirements
    {
      "oneOf_18" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - real_estate_license_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => real_estate_license_niches,
            },
            "2019-07-01--HAS_REAL_ESTATE_LICENSE" => { "$ref" => "#/definitions/2019-07-01--HAS_REAL_ESTATE_LICENSE" },
          },
          "required" => ["2019-07-01--HAS_REAL_ESTATE_LICENSE"],
        },
      ],
    }
  end

  def self.real_estate_license_niches
    @real_estate_license_niches ||= ["Real Estate Tech"]
  end

  def self.advertising_claim_niche_requirements
    {
      "oneOf_19" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - advertising_claim_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => advertising_claim_niches,
            },
            "2019-07-01--HAS_ADVERTISING_CLAIM" => { "$ref" => "#/definitions/2019-07-01--HAS_ADVERTISING_CLAIM" },
          },
          "required" => ["2019-07-01--HAS_ADVERTISING_CLAIM"],
        },
      ],
    }
  end

  def self.advertising_claim_niches
    @advertising_claim_niches ||= [
      "Ad Placement Management",
      "Data Platforms/Analysis",
      "Marketing Software",
    ]
  end

  def self.international_sales_niche_requirements
    {
      "oneOf_20" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - international_sales_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => international_sales_niches,
            },
            "2019-07-01--INTERNATIONAL_SALES" => { "$ref" => "#/definitions/2019-07-01--INTERNATIONAL_SALES" },
          },
          "required" => ["2019-07-01--INTERNATIONAL_SALES"],
        },
      ],
    }
  end

  def self.international_sales_niches
    @international_sales_niches ||= [
      "Insurance Tech - Life or Annuities",
      "Insurance Tech - Property & Casualty",
      "Insurance Tech - Health", "Alternative Lending",
      "Personal Finance and Wealth Management",
      "Payments",
      "Real Estate Tech",
      "Ad Placement Management",
      "Data Platforms/Analysis",
      "Insurance Tech (agency/MGA/carrier)",
      "Insurance Tech (other than agency/MGA/carrier)",
    ]
  end

  def self.physical_product_niche_requirements
    {
      "oneOf_21" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - physical_product_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => physical_product_niches,
            },
            "2019-07-01--HAS_PHYSICAL_PRODUCTS" => { "$ref" => "#/definitions/2019-07-01--HAS_PHYSICAL_PRODUCTS" },
          },
          "required" => ["2019-07-01--HAS_PHYSICAL_PRODUCTS"],
        },
      ],
    }
  end

  def self.physical_product_niches
    @physical_products_niches ||= [
      "Artificial Intelligence and Machine Learning",
      "VR/AR Software, Platforms and Delivery Services",
      "Industrial Internet of Things (IIOT)",
      "Automotive Technology",
      "Aerospace Software and Services",
    ]
  end

  def self.services_business_niche_requirements
    {
      "oneOf_22" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - services_business_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => services_business_niches,
            },
            "2019-07-01--HAS_SERVICES_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_SERVICES_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_SERVICES_BUSINESS"],
        },
      ],
    }
  end

  def self.services_business_niches
    @services_business_niches ||= [
      "Alternative Lending",
      "Artificial Intelligence and Machine Learning",
      "eCommerce Applications",
      "Personal Finance and Wealth Management",
    ]
  end

  def self.benefits_business_niche_requirements
    {
      "oneOf_23" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - benefits_business_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => benefits_business_niches,
            },
            "2019-07-01--HAS_BENEFITS_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_BENEFITS_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_BENEFITS_BUSINESS"],
        },
      ],
    }
  end

  def self.benefits_business_niches
    @benefits_business_niches ||= ["HR and Workforce Management"]
  end

  def self.chemical_niche_requirements
    {
      "oneOf_24" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - chemical_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => chemical_niches,
            },
            "2019-07-01--HAS_CHEMICALS" => { "$ref" => "#/definitions/2019-07-01--HAS_CHEMICALS" },
          },
          "required" => ["2019-07-01--HAS_CHEMICALS"],
        },
      ],
    }
  end

  def self.chemical_niches
    @chemical_niches ||= [
      "Aerospace Software and Services",
      "Aerospace Technology",
      "Automotive Technology",
      "Connected Home",
      "Drones",
      "Industrial Internet of Things (IIOT)",
      "IOT Network Infrastructure and Sensor Developers",
      "Manufacturing/3D Printing",
      "Networking/Security - WAN/LAN",
      "Robotics",
      "Semiconductors",
      "Servers & Storage",
      "Toys, Entertainment & Media",
      "VR/AR Hardware and Distribution",
      "VR/AR Software, Platforms and Delivery Services",
      "Wearables, Health Tech, Connected Self",
      "Wired/Wireless Telecom Infrastructure",
    ]
  end

  def self.pollutant_niche_requirements
    {
      "oneOf_25" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - pollutant_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => pollutant_niches,
            },
            "2019-07-01--HAS_POLLUTANTS" => { "$ref" => "#/definitions/2019-07-01--HAS_POLLUTANTS" },
          },
          "required" => ["2019-07-01--HAS_POLLUTANTS"],
        },
      ],
    }
  end

  def self.pollutant_niches
    @pollutant_niches ||= [
      "Aerospace Software and Services",
      "Aerospace Technology",
      "Automotive Technology",
      "Manufacturing/3D Printing",
      "Robotics",
      "Semiconductors",
    ]
  end

  def self.accounting_business_niche_requirements
    {
      "oneOf_26" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - accounting_business_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => accounting_business_niches,
            },
            "2019-07-01--HAS_ACCOUNTING_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_ACCOUNTING_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_ACCOUNTING_BUSINESS"],
        },
      ],
    }
  end

  def self.accounting_business_niches
    @accounting_business_niches ||= [
      "Payments",
      "Financial Business Process Software",
    ]
  end

  def self.finance_clients_business_niche_requirements
    {
      "oneOf_27" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - finance_clients_business_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => finance_clients_business_niches,
            },
            "2019-07-01--HAS_FINANCE_CLIENTS_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_FINANCE_CLIENTS_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_FINANCE_CLIENTS_BUSINESS"],
        },
      ],
    }
  end

  def self.finance_clients_business_niches
    @finance_clients_business_niches ||= [
      "Alternative Lending",
      "Big Data Analytics and Business Intelligence",
      "Blockchain (currency related)",
      "Blockchain (non-currency related)",
      "Cloud Infrastructure/Infrastructure as a Service",
      "CRM/ERP/Supply Chain Management/Operations Software",
      "Cyber Security/ Network Management Software",
      "Financial Business Process Software",
      "Payments",
      "Personal Finance and Wealth Management",
      "Real Estate Tech",
    ]
  end

  def self.real_estate_business_niche_requirements
    {
      "oneOf_28" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - real_estate_business_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => real_estate_business_niches,
            },
            "2019-07-01--HAS_REAL_ESTATE_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_REAL_ESTATE_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_REAL_ESTATE_BUSINESS"],
        },
      ],
    }
  end

  def self.real_estate_business_niches
    @real_estate_business_niches ||= ["Real Estate Tech"]
  end

  def self.high_risk_client_niche_requirements
    {
      "oneOf_29" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - high_risk_client_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => high_risk_client_niches,
            },
            "2019-07-01--HAS_HIGH_RISK_CLIENTS" => { "$ref" => "#/definitions/2019-07-01--HAS_HIGH_RISK_CLIENTS" },
          },
          "required" => ["2019-07-01--HAS_HIGH_RISK_CLIENTS"],
        },
      ],
    }
  end

  def self.high_risk_client_niches
    @high_risk_client_niches ||= [
      "Aerospace Software and Services",
      "Artificial Intelligence and Machine Learning",
      "Automotive Technology",
      "Connected Home",
      "Developer Tools and Microservices",
      "Drones",
      "Industrial Internet of Things (IIOT)",
      "IOT Network Infrastructure and Sensor Developers",
      "Manufacturing/3D Printing",
      "Marketplaces",
      "On-Demand Services",
      "Robotics",
      "Semiconductors",
      "Subscription",
      "Toys, Entertainment & Media",
      "VR/AR Content and Publishing",
      "VR/AR Software, Platforms and Delivery Services",
      "Wearables, Health Tech, Connected Self",
    ]
  end

  def self.blockchain_business_niche_requirements
    {
      "oneOf_30" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - blockchain_business_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => blockchain_business_niches,
            },
            "2019-07-01--HAS_BLOCKCHAIN_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_BLOCKCHAIN_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_BLOCKCHAIN_BUSINESS"],
        },
      ],
    }
  end

  def self.blockchain_business_niches
    @blockchain_business_niches ||= ["Blockchain (non-currency related)"]
  end

  def self.robotics_business_niche_requirements
    {
      "oneOf_31" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - robotics_business_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => robotics_business_niches,
            },
            "2019-07-01--HAS_ROBOTICS_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_ROBOTICS_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_ROBOTICS_BUSINESS"],
        },
      ],
    }
  end

  def self.robotics_business_niches
    @robotics_business_niches ||= ["Robotics"]
  end

  def self.copyright_claim_niche_requirements
    {
      "oneOf_32" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - copyright_claim_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => copyright_claim_niches,
            },
            "2019-07-01--HAS_COPYRIGHT_CLAIM" => { "$ref" => "#/definitions/2019-07-01--HAS_COPYRIGHT_CLAIM" },
          },
          "required" => ["2019-07-01--HAS_COPYRIGHT_CLAIM"],
        },
      ],
    }
  end

  def self.copyright_claim_niches
    @copyright_claim_niches ||= [
      "Ad Placement Management",
      "Data Platforms/Analysis",
      "eCommerce Applications",
      "Enterprise Communication/Collaboration Software",
      "Marketing Software",
      "Media and Entertainment",
      "Messaging",
      "Original Content and Publishing",
      "Search Engines/Research Tools",
      "VR/AR Content and Publishing",
    ]
  end

  def self.consumer_loan_business_niche_requirements
    {
      "oneOf_33" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches[:enterprise_and_smb_niches],
            },
            "2019-07-01--CATEGORY_CUSTOMER" => {
              "type" => "string",
              "enum" => ["Enterprise & SMB"],
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches[:consumer_niches] - consumer_loan_business_niches,
            },
            "2019-07-01--CATEGORY_CUSTOMER" => {
              "type" => "string",
              "enum" => ["Consumer"],
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => consumer_loan_business_niches,
            },
            "2019-07-01--CATEGORY_CUSTOMER" => {
              "type" => "string",
              "enum" => ["Consumer"],
            },
            "2019-07-01--HAS_LOANS_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_LOANS_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_LOANS_BUSINESS"],
        },
      ],
    }
  end

  def self.consumer_loan_business_niches
    @consumer_loan_business_niches ||= ["Real Estate Tech"]
  end

  def self.enterprise_finance_business_niche_requirements
    {
      "oneOf_34" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches[:consumer_niches],
            },
            "2019-07-01--CATEGORY_CUSTOMER" => {
              "type" => "string",
              "enum" => ["Consumer"],
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches[:enterprise_and_smb_niches] - enterprise_finance_business_niches,
            },
            "2019-07-01--CATEGORY_CUSTOMER" => {
              "type" => "string",
              "enum" => ["Enterprise & SMB"],
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => enterprise_finance_business_niches,
            },
            "2019-07-01--CATEGORY_CUSTOMER" => {
              "type" => "string",
              "enum" => ["Enterprise & SMB"],
            },
            "2019-07-01--HAS_FINANCE_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_FINANCE_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_FINANCE_BUSINESS"],
        },
      ],
    }
  end

  def self.enterprise_finance_business_niches
    @enterprise_finance_business_niches ||= ["Real Estate Tech"]
  end

  def self.finance_business_niche_requirements
    {
      "oneOf_35" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - finance_business_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => finance_business_niches,
            },
            "2019-07-01--HAS_FINANCE_BUSINESS" => { "$ref" => "#/definitions/2019-07-01--HAS_FINANCE_BUSINESS" },
          },
          "required" => ["2019-07-01--HAS_FINANCE_BUSINESS"],
        },
      ],
    }
  end

  def self.finance_business_niches
    @finance_business_niches ||= ["Personal Finance and Wealth Management"]
  end

  def self.enterprise_big_revenue_contract_niche_requirements
    {
      "oneOf_36" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches[:consumer_niches],
            },
            "2019-07-01--CATEGORY_CUSTOMER" => {
              "type" => "string",
              "enum" => ["Consumer"],
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches[:enterprise_and_smb_niches] - enterprise_big_revenue_contract_niches,
            },
            "2019-07-01--CATEGORY_CUSTOMER" => {
              "type" => "string",
              "enum" => ["Enterprise & SMB"],
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => enterprise_big_revenue_contract_niches,
            },
            "2019-07-01--CATEGORY_CUSTOMER" => {
              "type" => "string",
              "enum" => ["Enterprise & SMB"],
            },
            "2019-07-01--NUM_BIG_REVENUE_CONTRACTS" => { "$ref" => "#/definitions/2019-07-01--NUM_BIG_REVENUE_CONTRACTS" },
          },
          "required" => ["2019-07-01--NUM_BIG_REVENUE_CONTRACTS"],
        },
      ],
    }
  end

  def self.enterprise_big_revenue_contract_niches
    @enterprise_big_revenue_contract_niches ||= ["Real Estate Tech"]
  end

  def self.big_revenue_contract_niche_requirements
    {
      "oneOf_37" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - big_revenue_contract_niches,
            },
          },
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => big_revenue_contract_niches,
            },
            "2019-07-01--NUM_BIG_REVENUE_CONTRACTS" => { "$ref" => "#/definitions/2019-07-01--NUM_BIG_REVENUE_CONTRACTS" },
          },
          "required" => ["2019-07-01--NUM_BIG_REVENUE_CONTRACTS"],
        },
      ],
    }
  end

  def self.big_revenue_contract_niches
    @big_revenue_contract_niches ||= [
      "Aerospace Software and Services",
      "Artificial Intelligence and Machine Learning",
      "Automotive Technology",
      "Backend Infrastructure",
      "Big Data Analytics and Business Intelligence",
      "Blockchain (non-currency related)",
      "Blockchain (currency related)",
      "Cloud Infrastructure/Infrastructure as a Service",
      "CRM/ERP/Supply Chain Management/Operations Software",
      "Cyber Security/ Network Management Software",
      "Developer Tools and Microservices",
      "eCommerce Applications",
      "Education Technology - Enterprise",
      "Enterprise Communication/Collaboration Software",
      "Financial Business Process Software",
      "HR and Workforce Management",
      "Industrial Internet of Things (IIOT)",
      "Marketing Software",
      "VR/AR Software, Platforms and Delivery Services",
    ]
  end

  def self.sensitive_pii_unique_niches
    @sensitive_pii_unique_niches ||= ["e-Commerce", "Retail Brands", "On-Demand Services", "Marketplaces", "Subscription", "Other Commerce", "Productivity and Utilities", "Search Engines/Research Tools", "Connected Home", "Toys, Entertainment & Media", "Drones", "Wearables, Health Tech, Connected Self", "Manufacturing/3D Printing", "Robotics", "IOT Network Infrastructure and Sensor Developers", "Aerospace Technology", "Wired/Wireless Telecom Infrastructure", "Networking/Security - WAN/LAN", "Servers & Storage", "Semiconductors"]
  end

  def self.sensitive_pii_niche_requirements
    {
      "oneOf_38" => [
        {
          "properties" => {
            "2019-07-01--CATEGORY_TECHNOLOGY" => {
              "type" => "string",
              "enum" => ["Hardware"],
            },
            "2019-07-01--CATEGORY_CUSTOMER" => {
              "type" => "string",
              "enum" => ["Consumer", "Enterprise & SMB"],
            },
            "2019-07-01--CATEGORY_VERTICAL" => {
              "type" => "string",
              "enum" => ["Goods and Services"],
            },
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => ["VR/AR Hardware and Distribution"],
            },
            "2019-07-01--HAS_ANY_SENSITIVE_PII" => { "$ref" => "#/definitions/2019-07-01--HAS_ANY_SENSITIVE_PII" },
          },
          "required" => ["2019-07-01--HAS_ANY_SENSITIVE_PII"],
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_TECHNOLOGY" => {
              "type" => "string",
              "enum" => ["Hardware"],
            },
            "2019-07-01--CATEGORY_CUSTOMER" => {
              "type" => "string",
              "enum" => ["Enterprise & SMB"],
            },
            "2019-07-01--CATEGORY_VERTICAL" => {
              "type" => "string",
              "enum" => ["Goods and Services"],
            },
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => ["Automotive Technology"],
            },
            "2019-07-01--HAS_ANY_SENSITIVE_PII" => { "$ref" => "#/definitions/2019-07-01--HAS_ANY_SENSITIVE_PII" },
          },
          "required" => ["2019-07-01--HAS_ANY_SENSITIVE_PII"],
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => sensitive_pii_unique_niches,
            },
            "2019-07-01--HAS_ANY_SENSITIVE_PII" => { "$ref" => "#/definitions/2019-07-01--HAS_ANY_SENSITIVE_PII" },
          },
          "required" => ["2019-07-01--HAS_ANY_SENSITIVE_PII"],
        },
        {
          "properties" => {
            "2019-07-01--CATEGORY_NICHE" => {
              "type" => "string",
              "enum" => niches.values.flatten.uniq - sensitive_pii_unique_niches - ["Automotive Technology", "VR/AR Hardware and Distribution"],
            },
          },
        },
      ],
    }
  end
  def self.niches
    @niches ||= {
      consumer_niches: [
        "e-Commerce",
        "Retail Brands",
        "On-Demand Services",
        "Marketplaces",
        "Education Technology",
        "Gaming",
        "Media and Entertainment",
        "Messaging",
        "Other Consumer FinTech",
        "Connected Home",
        "Toys, Entertainment & Media",
        "Drones",
        "Wearables, Health Tech, Connected Self",
        "VR/AR Hardware and Distribution",
        "Other Consumer Electronics",
      ],
      enterprise_and_smb_niches: [
        "Ad Placement Management",
        "Data Platforms/Analysis",
        "Other Advertising Technology",
        "IOT Network Infrastructure and Sensor Developers",
        "Aerospace Technology",
        "Wired/Wireless Telecom Infrastructure",
        "Networking/Security - WAN/LAN",
        "Servers & Storage",
        "Semiconductors",
        "Other Enterprise Hardware",
      ],
    }
  end
end
