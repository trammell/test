
from typing import AbstractSet, Any, Dict, List, Callable

import inspect
import logging

logger = logging.getLogger(__name__)


def deco1(func):
    def mywrapper(*args, **kwargs):
        print("I'm inside the decorator")
        func(*args, **kwargs)
        print("I ran the func")
    return mywrapper


def deco2(method):
    def mywrapper(self, dispatcher, tracker, domain, *args, **kwargs):
        print("I'm inside the decorator")
        method(self, dispatcher, tracker, domain, *args, **kwargs)
        print("I ran the func")
    return mywrapper

def arguments_of(func) -> AbstractSet[str]:
    """Return the parameters of the function `func` as a list of their names."""
    return inspect.signature(func).parameters.keys()


def SlotSet(slotname, slotval) -> None:
    return None


def get_contacts(foo) -> List[str]:
    return ["larry", "moe", "curly"]

class Tracker:
    sender_id = 123

tracker = Tracker()

class CustomActionA:

    def run(self, dispatcher, tracker, domain: Dict[str, Any]) -> List[Dict[str, Any]]:
        contacts = get_contacts(tracker.sender_id)
        if len(contacts) > 0:
            contacts_list = "".join([f"- {c.name} ({c.handle}) \n" for c in contacts])
            return [SlotSet("contacts_list", contacts_list)]
        else:
            return [SlotSet("contacts_list", None)]

class CustomActionB:

    @deco1
    def run(self, dispatcher, tracker, domain: Dict[str, Any]) -> List[Dict[str, Any]]:
        contacts = get_contacts(tracker.sender_id)
        if len(contacts) > 0:
            contacts_list = "".join([f"- {c.name} ({c.handle}) \n" for c in contacts])
            return [SlotSet("contacts_list", contacts_list)]
        else:
            return [SlotSet("contacts_list", None)]

class CustomActionC:

    def run(self, dispatcher, tracker, domain: Dict[str, Any]) -> List[Dict[str, Any]]:
        contacts = get_contacts(tracker.sender_id)
        if len(contacts) > 0:
            contacts_list = "".join([f"- {c.name} ({c.handle}) \n" for c in contacts])
            return [SlotSet("contacts_list", contacts_list)]
        else:
            return [SlotSet("contacts_list", None)]

class ActionExecutor:

    def __init__(self):
        self.actions: Dict[str, Callable] = {}

    def register_function(self, name: str, f: Callable) -> None:
        valid_keys = arguments_of(f)
        if len(valid_keys) < 3:
            raise Exception(
                "You can only register functions that take "
                "3 parameters as arguments. The three parameters "
                "your function will receive are: dispatcher, "
                f"tracker, domain. Your function accepts only {len(valid_keys)} "
                "parameters."
            )

        if name in self.actions:
            logger.info(f"Re-registered function for '{name}'.")
        else:
            logger.info(f"Registered function for '{name}'.")

        self.actions[name] = f


def main():
    print(arguments_of(CustomActionA.run))
    print(arguments_of(CustomActionB.run))
    print(arguments_of(CustomActionC.run))

    ae = ActionExecutor()
    ae.register_function("a", CustomActionA.run)

    try:
        ae.register_function("b", CustomActionB.run)
    except Exception as e:
        print(f"caught exception {e=}")

    ae.register_function("c", CustomActionC.run)

    print(ae.actions)



if __name__ == "__main__":
    main()

