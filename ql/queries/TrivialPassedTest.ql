/**
 * @name Trivial passed test
 * @description Highlight passed tests that do not contain non-trivial assertions.
 */

import AssertionQuality

from GeneratedTest t, string reason
where
  not t.fails() and
  not exists(AssertionInGeneratedTest a |
    a.getFile() = t and a.isNonTrivial()
  ) and
  (
    if exists(AssertionInGeneratedTest a | a.getFile() = t)
    then reason = "only trivial assertions"
    else reason = "no assertions"
  )
select t, "Passed test contains " + reason + "."
