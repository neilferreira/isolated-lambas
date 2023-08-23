def test_handler():
    from handler import handler
    assert handler(event={}).items() >= {"success": True}.items()


def test_version_pin():
    import pydicom
    assert pydicom.__version__ == '2.4.2'
