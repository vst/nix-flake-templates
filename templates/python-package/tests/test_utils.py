"""This module provides tests for utilities module."""

# ruff: noqa: S101,PLR2004

from zamazingo.utils import safe_divide


def test_safe_divide() -> None:
    """Test the safe_divide function."""
    assert safe_divide(0, 0) is None
    assert safe_divide(1, 0) is None
    assert safe_divide(0, 1) == 0
    assert safe_divide(1, 1) == 1
    assert safe_divide(1, 2) == 0.5
    assert safe_divide(2, 1) == 2
