﻿CREATE TABLE step
(
  name character varying NOT NULL,
  task_id int NOT NULL,
  parameters json,
  submit_timestamp timestamp with time zone NOT NULL DEFAULT now(),
  start_timestamp timestamp with time zone,
  end_timestamp timestamp with time zone,
  exit_code int,
  status_id smallint NOT NULL,
  status_timestamp timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT step_pkey PRIMARY KEY (name, task_id)
)