# functions for getting data into H2O

function upload_file(path;
                     destination_frame = "",
                     parse = true,
                     header = null)

    this
    that
    other


end

h2o.uploadFile(path, destination_frame = "", parse = TRUE, header = NA,
sep = "", col.names = NULL, col.types = NULL, na.strings = NULL,
progressBar = FALSE, parse_type = NULL)

function create_frame(;rows = 10000,
                     cols = 1000,
                     randomize = true,
                     value = 0,
                     real_range = 100,
                     categorical_fraction = 0.2,
                     factors = 100,
                     integer_range = 100,
                     binary_fraction = 0.1,
                     binary_ones_fraction = 0.02,
                     missing_fraction = 0.01,
                     response_factors = 2,
                     has_response = false,
                     seed = 0,
                     key = 0)

  results = h2o_post("CreateFrame",
                    "rows=$(rows)",
                    "cols=$(cols)",
                    "randomize=$(randomize)",
                    "value=$(value)",
                    "real_range=$(real_range)",
                    "categorical_fraction=$(categorical_fraction)",
                    "factors=$(factors)",
                    "integer_range=$(integer_range)",
                    "binary_fraction=$(binary_fraction)",
                    "binary_ones_fraction=$(binary_ones_fraction)",
                    "missing_fraction=$(missing_fraction)",
                    "response_factors=$(response_factors)",
                    "has_response=$(has_response)")
                    # "seed=$(seed)",
                    # "key=$(key)")
  return results
end
