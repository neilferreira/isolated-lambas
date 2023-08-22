def test_handler():
    from handler import handler
    assert handler().items() >= {"success": True}


def test_version_pin():
    import pydicom
    assert pydicom.__version__ == '2.4.1'
