
from pprint import pprint

class Foo(object):
    """A helper object for the admin/Drilldown view."""

    def __init__(self,**kwargs):
        for k,v in kwargs.items():
            setattr(self,k,v)

    @classmethod
    def fromBar(self,**kwargs):
        """Construct an object of type Foo from a Bar object."""
        return self(**kwargs)

if __name__ == '__main__':
    f = Foo.fromBar(one=2)
    pprint(f)
    pprint(f.__dict__)

