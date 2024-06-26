---
name: AWS Pricing
stage: GA
title: AWS Pricing Source Plugin
description: CloudQuery AWS Pricing Plugin documentation
---

# AWS Pricing Source Plugin

:badge

The AWS Pricing Source plugin for CloudQuery extracts data from the [AWS Bulk Pricing Service](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/using-ppslong.html) and loads it into any supported CloudQuery destination (e.g. PostgreSQL, BigQuery, Snowflake, and [more](/docs/plugins/destinations/overview)).

## Configuration

The following configuration syncs from AWS Pricing service to a Postgres destination. The (top level) source spec section is described in the [Source Spec Reference](/docs/reference/source-spec). The config for the `postgresql` destination is not shown here. See our [Quickstart](/docs/quickstart) if you need help setting up the destination.

There is no connection string or credentials required to sync this data as all data is publicly available at `https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/index.json`

:configuration

## AWS Pricing Spec

This is the (nested) spec used by the AWS Pricing source plugin.

- `concurrency` (`int`) (default: `10000`):

  A best effort maximum number of Go routines to use. Lower this number to reduce memory usage.

- `region_codes` (`[]string`) (default: empty. Will sync data for all regions)

  Specify which region_codes to sync data for. No regular expressions are supported, matches must be an exact match
  Note: This is not just AWS Commercial regions. It includes Wavelength Zones and regions in other partitions (Gov Cloud and China).

- `offer_codes` (`[]string`) (default: empty. Will sync data for all services)

  Specify which services to sync data for. Regular expressions are not supported: matches must be exact.
  Note: This is a unique code for the product of an AWS service. For example, `AmazonEC2`, `AmazonS3` or `comprehend`.
