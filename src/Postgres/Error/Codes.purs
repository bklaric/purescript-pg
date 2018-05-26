module Postgres.Error.Codes where

-- Class 00 — Successful Completion
successful_completion :: String
successful_completion = "00000"
    

-- Class 01 — Warning
warning :: String
warning = "01000"
    
dynamic_result_sets_returned :: String
dynamic_result_sets_returned = "0100C"
    
implicit_zero_bit_padding :: String
implicit_zero_bit_padding = "01008"
    
null_value_eliminated_in_set_function :: String
null_value_eliminated_in_set_function = "01003"
    
privilege_not_granted :: String
privilege_not_granted = "01007"
    
privilege_not_revoked :: String
privilege_not_revoked = "01006"
    
string_data_right_truncation_warning :: String
string_data_right_truncation_warning = "01004"
    
deprecated_feature :: String
deprecated_feature = "01P01"
    

-- Class 02 — No Data (this is also a warning class per the SQL standard)
no_data :: String
no_data = "02000"
    
no_additional_dynamic_result_sets_returned :: String
no_additional_dynamic_result_sets_returned = "02001"
    

-- Class 03 — SQL Statement Not Yet Complete
sql_statement_not_yet_complete :: String
sql_statement_not_yet_complete = "03000"
    

-- Class 08 — Connection Exception
connection_exception :: String
connection_exception = "08000"
    
connection_does_not_exist :: String
connection_does_not_exist = "08003"
    
connection_failure :: String
connection_failure = "08006"
    
sqlclient_unable_to_establish_sqlconnection :: String
sqlclient_unable_to_establish_sqlconnection = "08001"
    
sqlserver_rejected_establishment_of_sqlconnection :: String
sqlserver_rejected_establishment_of_sqlconnection = "08004"
    
transaction_resolution_unknown :: String
transaction_resolution_unknown = "08007"
    
protocol_violation :: String
protocol_violation = "08P01"
    

-- Class 09 — Triggered Action Exception
triggered_action_exception :: String
triggered_action_exception = "09000"
    

-- Class 0A — Feature Not Supported
feature_not_supported :: String
feature_not_supported = "0A000"
    

-- Class 0B — Invalid Transaction Initiation
invalid_transaction_initiation :: String
invalid_transaction_initiation = "0B000"
    

-- Class 0F — Locator Exception
locator_exception :: String
locator_exception = "0F000"
    
invalid_locator_specification :: String
invalid_locator_specification = "0F001"
    

-- Class 0L — Invalid Grantor
invalid_grantor :: String
invalid_grantor = "0L000"
    
invalid_grant_operation :: String
invalid_grant_operation = "0LP01"
    

-- Class 0P — Invalid Role Specification
invalid_role_specification :: String
invalid_role_specification = "0P000"
    

-- Class 0Z — Diagnostics Exception
diagnostics_exception :: String
diagnostics_exception = "0Z000"
    
stacked_diagnostics_accessed_without_active_handler :: String
stacked_diagnostics_accessed_without_active_handler = "0Z002"
    

-- Class 20 — Case Not Found
case_not_found :: String
case_not_found = "20000"
    

-- Class 21 — Cardinality Violation
cardinality_violation :: String
cardinality_violation = "21000"
    

-- Class 22 — Data Exception
data_exception :: String
data_exception = "22000"
    
array_subscript_error :: String
array_subscript_error = "2202E"
    
character_not_in_repertoire :: String
character_not_in_repertoire = "22021"
    
datetime_field_overflow :: String
datetime_field_overflow = "22008"
    
division_by_zero :: String
division_by_zero = "22012"
    
error_in_assignment :: String
error_in_assignment = "22005"
    
escape_character_conflict :: String
escape_character_conflict = "2200B"
    
indicator_overflow :: String
indicator_overflow = "22022"
    
interval_field_overflow :: String
interval_field_overflow = "22015"
    
invalid_argument_for_logarithm :: String
invalid_argument_for_logarithm = "2201E"
    
invalid_argument_for_ntile_function :: String
invalid_argument_for_ntile_function = "22014"
    
invalid_argument_for_nth_value_function :: String
invalid_argument_for_nth_value_function = "22016"
    
invalid_argument_for_power_function :: String
invalid_argument_for_power_function = "2201F"
    
invalid_argument_for_width_bucket_function :: String
invalid_argument_for_width_bucket_function = "2201G"
    
invalid_character_value_for_cast :: String
invalid_character_value_for_cast = "22018"
    
invalid_datetime_format :: String
invalid_datetime_format = "22007"
    
invalid_escape_character :: String
invalid_escape_character = "22019"
    
invalid_escape_octet :: String
invalid_escape_octet = "2200D"
    
invalid_escape_sequence :: String
invalid_escape_sequence = "22025"
    
nonstandard_use_of_escape_character :: String
nonstandard_use_of_escape_character = "22P06"
    
invalid_indicator_parameter_value :: String
invalid_indicator_parameter_value = "22010"
    
invalid_parameter_value :: String
invalid_parameter_value = "22023"
    
invalid_regular_expression :: String
invalid_regular_expression = "2201B"
    
invalid_row_count_in_limit_clause :: String
invalid_row_count_in_limit_clause = "2201W"
    
invalid_row_count_in_result_offset_clause :: String
invalid_row_count_in_result_offset_clause = "2201X"
    
invalid_tablesample_argument :: String
invalid_tablesample_argument = "2202H"
    
invalid_tablesample_repeat :: String
invalid_tablesample_repeat = "2202G"
    
invalid_time_zone_displacement_value :: String
invalid_time_zone_displacement_value = "22009"
    
invalid_use_of_escape_character :: String
invalid_use_of_escape_character = "2200C"
    
most_specific_type_mismatch :: String
most_specific_type_mismatch = "2200G"
    
null_value_not_allowed_data :: String
null_value_not_allowed_data = "22004"
    
null_value_no_indicator_parameter :: String
null_value_no_indicator_parameter = "22002"
    
numeric_value_out_of_range :: String
numeric_value_out_of_range = "22003"
    
sequence_generator_limit_exceeded :: String
sequence_generator_limit_exceeded = "2200H"
    
string_data_length_mismatch :: String
string_data_length_mismatch = "22026"
    
string_data_right_truncation_data :: String
string_data_right_truncation_data = "22001"
    
substring_error :: String
substring_error = "22011"
    
trim_error :: String
trim_error = "22027"
    
unterminated_c_string :: String
unterminated_c_string = "22024"
    
zero_length_character_string :: String
zero_length_character_string = "2200F"
    
floating_point_exception :: String
floating_point_exception = "22P01"
    
invalid_text_representation :: String
invalid_text_representation = "22P02"
    
invalid_binary_representation :: String
invalid_binary_representation = "22P03"
    
bad_copy_file_format :: String
bad_copy_file_format = "22P04"
    
untranslatable_character :: String
untranslatable_character = "22P05"
    
not_an_xml_document :: String
not_an_xml_document = "2200L"
    
invalid_xml_document :: String
invalid_xml_document = "2200M"
    
invalid_xml_content :: String
invalid_xml_content = "2200N"
    
invalid_xml_comment :: String
invalid_xml_comment = "2200S"
    
invalid_xml_processing_instruction :: String
invalid_xml_processing_instruction = "2200T"
    

-- Class 23 — Integrity Constraint Violation
integrity_constraint_violation :: String
integrity_constraint_violation = "23000"
    
restrict_violation :: String
restrict_violation = "23001"
    
not_null_violation :: String
not_null_violation = "23502"
    
foreign_key_violation :: String
foreign_key_violation = "23503"
    
unique_violation :: String
unique_violation = "23505"
    
check_violation :: String
check_violation = "23514"
    
exclusion_violation :: String
exclusion_violation = "23P01"
    

-- Class 24 — Invalid Cursor State
invalid_cursor_state :: String
invalid_cursor_state = "24000"
    

-- Class 25 — Invalid Transaction State
invalid_transaction_state :: String
invalid_transaction_state = "25000"
    
active_sql_transaction :: String
active_sql_transaction = "25001"
    
branch_transaction_already_active :: String
branch_transaction_already_active = "25002"
    
held_cursor_requires_same_isolation_level :: String
held_cursor_requires_same_isolation_level = "25008"
    
inappropriate_access_mode_for_branch_transaction :: String
inappropriate_access_mode_for_branch_transaction = "25003"
    
inappropriate_isolation_level_for_branch_transaction :: String
inappropriate_isolation_level_for_branch_transaction = "25004"
    
no_active_sql_transaction_for_branch_transaction :: String
no_active_sql_transaction_for_branch_transaction = "25005"
    
read_only_sql_transaction :: String
read_only_sql_transaction = "25006"
    
schema_and_data_statement_mixing_not_supported :: String
schema_and_data_statement_mixing_not_supported = "25007"
    
no_active_sql_transaction :: String
no_active_sql_transaction = "25P01"
    
in_failed_sql_transaction :: String
in_failed_sql_transaction = "25P02"
    
idle_in_transaction_session_timeout :: String
idle_in_transaction_session_timeout = "25P03"
    

-- Class 26 — Invalid SQL Statement Name
invalid_sql_statement_name :: String
invalid_sql_statement_name = "26000"
    

-- Class 27 — Triggered Data Change Violation
triggered_data_change_violation :: String
triggered_data_change_violation = "27000"
    

-- Class 28 — Invalid Authorization Specification
invalid_authorization_specification :: String
invalid_authorization_specification = "28000"
    
invalid_password :: String
invalid_password = "28P01"
    

-- Class 2B — Dependent Privilege Descriptors Still Exist
dependent_privilege_descriptors_still_exist :: String
dependent_privilege_descriptors_still_exist = "2B000"
    
dependent_objects_still_exist :: String
dependent_objects_still_exist = "2BP01"
    

-- Class 2D — Invalid Transaction Termination
invalid_transaction_termination :: String
invalid_transaction_termination = "2D000"
    

-- Class 2F — SQL Routine Exception
sql_routine_exception :: String
sql_routine_exception = "2F000"
    
function_executed_no_return_statement :: String
function_executed_no_return_statement = "2F005"
    
modifying_sql_data_not_permitted_sql :: String
modifying_sql_data_not_permitted_sql = "2F002"
    
prohibited_sql_statement_attempted_sql :: String
prohibited_sql_statement_attempted_sql = "2F003"
    
reading_sql_data_not_permitted_sql :: String
reading_sql_data_not_permitted_sql = "2F004"
    

-- Class 34 — Invalid Cursor Name
invalid_cursor_name :: String
invalid_cursor_name = "34000"
    

-- Class 38 — External Routine Exception
external_routine_exception :: String
external_routine_exception = "38000"
    
containing_sql_not_permitted :: String
containing_sql_not_permitted = "38001"
    
modifying_sql_data_not_permitted_external :: String
modifying_sql_data_not_permitted_external = "38002"
    
prohibited_sql_statement_attempted_external :: String
prohibited_sql_statement_attempted_external = "38003"
    
reading_sql_data_not_permitted_external :: String
reading_sql_data_not_permitted_external = "38004"
    

-- Class 39 — External Routine Invocation Exception
external_routine_invocation_exception :: String
external_routine_invocation_exception = "39000"
    
invalid_sqlstate_returned :: String
invalid_sqlstate_returned = "39001"
    
null_value_not_allowed_external :: String
null_value_not_allowed_external = "39004"
    
trigger_protocol_violated :: String
trigger_protocol_violated = "39P01"
    
srf_protocol_violated :: String
srf_protocol_violated = "39P02"
    
event_trigger_protocol_violated :: String
event_trigger_protocol_violated = "39P03"
    

-- Class 3B — Savepoint Exception
savepoint_exception :: String
savepoint_exception = "3B000"
    
invalid_savepoint_specification :: String
invalid_savepoint_specification = "3B001"
    

-- Class 3D — Invalid Catalog Name
invalid_catalog_name :: String
invalid_catalog_name = "3D000"
    

-- Class 3F — Invalid Schema Name
invalid_schema_name :: String
invalid_schema_name = "3F000"
    

-- Class 40 — Transaction Rollback
transaction_rollback :: String
transaction_rollback = "40000"
    
transaction_integrity_constraint_violation :: String
transaction_integrity_constraint_violation = "40002"
    
serialization_failure :: String
serialization_failure = "40001"
    
statement_completion_unknown :: String
statement_completion_unknown = "40003"
    
deadlock_detected :: String
deadlock_detected = "40P01"
    

-- Class 42 — Syntax Error or Access Rule Violation
syntax_error_or_access_rule_violation :: String
syntax_error_or_access_rule_violation = "42000"
    
syntax_error :: String
syntax_error = "42601"
    
insufficient_privilege :: String
insufficient_privilege = "42501"
    
cannot_coerce :: String
cannot_coerce = "42846"
    
grouping_error :: String
grouping_error = "42803"
    
windowing_error :: String
windowing_error = "42P20"
    
invalid_recursion :: String
invalid_recursion = "42P19"
    
invalid_foreign_key :: String
invalid_foreign_key = "42830"
    
invalid_name :: String
invalid_name = "42602"
    
name_too_long :: String
name_too_long = "42622"
    
reserved_name :: String
reserved_name = "42939"
    
datatype_mismatch :: String
datatype_mismatch = "42804"
    
indeterminate_datatype :: String
indeterminate_datatype = "42P18"
    
collation_mismatch :: String
collation_mismatch = "42P21"
    
indeterminate_collation :: String
indeterminate_collation = "42P22"
    
wrong_object_type :: String
wrong_object_type = "42809"
    
generated_always :: String
generated_always = "428C9"
    
undefined_column :: String
undefined_column = "42703"
    
undefined_function :: String
undefined_function = "42883"
    
undefined_table :: String
undefined_table = "42P01"
    
undefined_parameter :: String
undefined_parameter = "42P02"
    
undefined_object :: String
undefined_object = "42704"
    
duplicate_column :: String
duplicate_column = "42701"
    
duplicate_cursor :: String
duplicate_cursor = "42P03"
    
duplicate_database :: String
duplicate_database = "42P04"
    
duplicate_function :: String
duplicate_function = "42723"
    
duplicate_prepared_statement :: String
duplicate_prepared_statement = "42P05"
    
duplicate_schema :: String
duplicate_schema = "42P06"
    
duplicate_table :: String
duplicate_table = "42P07"
    
duplicate_alias :: String
duplicate_alias = "42712"
    
duplicate_object :: String
duplicate_object = "42710"
    
ambiguous_column :: String
ambiguous_column = "42702"
    
ambiguous_function :: String
ambiguous_function = "42725"
    
ambiguous_parameter :: String
ambiguous_parameter = "42P08"
    
ambiguous_alias :: String
ambiguous_alias = "42P09"
    
invalid_column_reference :: String
invalid_column_reference = "42P10"
    
invalid_column_definition :: String
invalid_column_definition = "42611"
    
invalid_cursor_definition :: String
invalid_cursor_definition = "42P11"
    
invalid_database_definition :: String
invalid_database_definition = "42P12"
    
invalid_function_definition :: String
invalid_function_definition = "42P13"
    
invalid_prepared_statement_definition :: String
invalid_prepared_statement_definition = "42P14"
    
invalid_schema_definition :: String
invalid_schema_definition = "42P15"
    
invalid_table_definition :: String
invalid_table_definition = "42P16"
    
invalid_object_definition :: String
invalid_object_definition = "42P17"
    

-- Class 44 — WITH CHECK OPTION Violation
with_check_option_violation :: String
with_check_option_violation = "44000"
    

-- Class 53 — Insufficient Resources
insufficient_resources :: String
insufficient_resources = "53000"
    
disk_full :: String
disk_full = "53100"
    
out_of_memory :: String
out_of_memory = "53200"
    
too_many_connections :: String
too_many_connections = "53300"
    
configuration_limit_exceeded :: String
configuration_limit_exceeded = "53400"
    

-- Class 54 — Program Limit Exceeded
program_limit_exceeded :: String
program_limit_exceeded = "54000"
    
statement_too_complex :: String
statement_too_complex = "54001"
    
too_many_columns :: String
too_many_columns = "54011"
    
too_many_arguments :: String
too_many_arguments = "54023"
    

-- Class 55 — Object Not In Prerequisite State
object_not_in_prerequisite_state :: String
object_not_in_prerequisite_state = "55000"
    
object_in_use :: String
object_in_use = "55006"
    
cant_change_runtime_param :: String
cant_change_runtime_param = "55P02"
    
lock_not_available :: String
lock_not_available = "55P03"
    

-- Class 57 — Operator Intervention
operator_intervention :: String
operator_intervention = "57000"
    
query_canceled :: String
query_canceled = "57014"
    
admin_shutdown :: String
admin_shutdown = "57P01"
    
crash_shutdown :: String
crash_shutdown = "57P02"
    
cannot_connect_now :: String
cannot_connect_now = "57P03"
    
database_dropped :: String
database_dropped = "57P04"
    

-- Class 58 — System Error (errors external to PostgreSQL itself)
system_error :: String
system_error = "58000"
    
io_error :: String
io_error = "58030"
    
undefined_file :: String
undefined_file = "58P01"
    
duplicate_file :: String
duplicate_file = "58P02"
    

-- Class 72 — Snapshot Failure
snapshot_too_old :: String
snapshot_too_old = "72000"
    

-- Class F0 — Configuration File Error
config_file_error :: String
config_file_error = "F0000"
    
lock_file_exists :: String
lock_file_exists = "F0001"
    

-- Class HV — Foreign Data Wrapper Error (SQL/MED)
fdw_error :: String
fdw_error = "HV000"
    
fdw_column_name_not_found :: String
fdw_column_name_not_found = "HV005"
    
fdw_dynamic_parameter_value_needed :: String
fdw_dynamic_parameter_value_needed = "HV002"
    
fdw_function_sequence_error :: String
fdw_function_sequence_error = "HV010"
    
fdw_inconsistent_descriptor_information :: String
fdw_inconsistent_descriptor_information = "HV021"
    
fdw_invalid_attribute_value :: String
fdw_invalid_attribute_value = "HV024"
    
fdw_invalid_column_name :: String
fdw_invalid_column_name = "HV007"
    
fdw_invalid_column_number :: String
fdw_invalid_column_number = "HV008"
    
fdw_invalid_data_type :: String
fdw_invalid_data_type = "HV004"
    
fdw_invalid_data_type_descriptors :: String
fdw_invalid_data_type_descriptors = "HV006"
    
fdw_invalid_descriptor_field_identifier :: String
fdw_invalid_descriptor_field_identifier = "HV091"
    
fdw_invalid_handle :: String
fdw_invalid_handle = "HV00B"
    
fdw_invalid_option_index :: String
fdw_invalid_option_index = "HV00C"
    
fdw_invalid_option_name :: String
fdw_invalid_option_name = "HV00D"
    
fdw_invalid_string_length_or_buffer_length :: String
fdw_invalid_string_length_or_buffer_length = "HV090"
    
fdw_invalid_string_format :: String
fdw_invalid_string_format = "HV00A"
    
fdw_invalid_use_of_null_pointer :: String
fdw_invalid_use_of_null_pointer = "HV009"
    
fdw_too_many_handles :: String
fdw_too_many_handles = "HV014"
    
fdw_out_of_memory :: String
fdw_out_of_memory = "HV001"
    
fdw_no_schemas :: String
fdw_no_schemas = "HV00P"
    
fdw_option_name_not_found :: String
fdw_option_name_not_found = "HV00J"
    
fdw_reply_handle :: String
fdw_reply_handle = "HV00K"
    
fdw_schema_not_found :: String
fdw_schema_not_found = "HV00Q"
    
fdw_table_not_found :: String
fdw_table_not_found = "HV00R"
    
fdw_unable_to_create_execution :: String
fdw_unable_to_create_execution = "HV00L"
    
fdw_unable_to_create_reply :: String
fdw_unable_to_create_reply = "HV00M"
    
fdw_unable_to_establish_connection :: String
fdw_unable_to_establish_connection = "HV00N"
    

-- Class P0 — PL/pgSQL Error
plpgsql_error :: String
plpgsql_error = "P0000"
    
raise_exception :: String
raise_exception = "P0001"
    
no_data_found :: String
no_data_found = "P0002"
    
too_many_rows :: String
too_many_rows = "P0003"
    
assert_failure :: String
assert_failure = "P0004"
    

-- Class XX — Internal Error
internal_error :: String
internal_error = "XX000"
    
data_corrupted :: String
data_corrupted = "XX001"
    
index_corrupted :: String
index_corrupted = "XX002"
