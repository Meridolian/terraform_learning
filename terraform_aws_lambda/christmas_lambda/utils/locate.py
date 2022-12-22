import pathlib
import christmas_lambda


def abspath_root():
    return pathlib.Path(christmas_lambda.__file__).parents[1]


def abspath_data(path):
    return abspath_root() / f"tests/data/{path}"
