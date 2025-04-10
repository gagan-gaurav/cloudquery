CREATE TABLE IF NOT EXISTS `table_name` (
  `_cq_id` UUID,
  `_cq_parent_id` Nullable(UUID),
  `_cq_source_name` Nullable(String),
  `_cq_sync_time` Nullable(DateTime64(6)),
  `extra_col` Float64,
  `extra_inet_col` Nullable(String),
  `extra_inet_arr_col` Array(Nullable(String))
) ENGINE = ReplicatedMergeTree('a', 'b', 1, 2, 3, 1.2, 3.4, 327, false, true) ORDER BY (`extra_col`, `_cq_id`) SETTINGS allow_nullable_key=1