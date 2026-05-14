import functools
import json
import typing as t
from collections import Counter
from pathlib import Path

from pydantic import BaseModel, Field, field_validator, TypeAdapter, validate_call


class Package(BaseModel):
    name: str
    command: str
    after: list[str] = Field(default_factory=list)


@functools.cache
def get_packages() -> list[Package]:
    data = json.loads($(chezmoi data))
    package_list = TypeAdapter(list[Package]).validate_python(data["packages"])

    return package_list


@validate_call
def get_commands(*pkgs: Package, commands: t.Annotated[list, Field(default_factory=list)], seen: t.Annotated[list, Field(default_factory=list)]) -> list[str]:
    for p1 in pkgs:
        if p1 not in seen:
            seen.append(p1)

            after_pkgs = [next(p2 for p2 in get_packages() if p2.name == after) for after in p1.after]
            commands = get_commands(*after_pkgs, commands=commands, seen=seen)

            commands.append(p1.command)

    return commands

if str(Path.home() / ".local/bin") not in $PATH:
	raise Exception("~/.local/bin is not in your system path. Add it and try again.")

for name, count in Counter(package.name for package in get_packages()).items():
    if count > 1:
        raise Exception(f'{count} packages named "{name}"')

commands = get_commands(*get_packages())

echo @("\n".join(commands)) | sh
