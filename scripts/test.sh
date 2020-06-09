#!/bin/sh -e
# Copyright (c) 2020 Famedly GmbH
# SPDX-License-Identifier: AGPL-3.0-or-later

cd "$(dirname "$0")"/..
[ -d src ] && export LD_LIBRARY_PATH=$(pwd)/build
pub run test -p vm
