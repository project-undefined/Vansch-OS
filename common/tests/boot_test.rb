# frozen_string_literal: true

# SPDX-License-Identifier: MIT
#
# Copyright (c) 2021-2022 Andre Richter <andre.o.richter@gmail.com>

require_relative 'console_io_test'

# Wait for an expected print during boot.
class ExpectedBootPrintTest < SubtestBase
    def initialize(expected_print)
        super()
        @expected_print = expected_print
    end

    def name
        "Checking for the string: '#{@expected_print}'"
    end

    def run(qemu_out, _qemu_in)
        expect_or_raise(qemu_out, @expected_print)
    end
end

# Check for an expected string when booting the kernel in QEMU.
class BootTest < ConsoleIOTest
    def initialize(qemu_cmd, expected_print)
        subtests = [ExpectedBootPrintTest.new(expected_print)]

        super(qemu_cmd, 'Boot test', subtests)
    end
end
