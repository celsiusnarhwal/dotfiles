import json
from collections import Counter

from pydantic import BaseModel, field_validator, TypeAdapter, Field

class Package(BaseModel):
	name: str
	command: str
	depends: list[str] = Field(default_factory=list)

def get_packages() -> list[Package]:
	data = json.loads($(chezmoi data))
	package_list = TypeAdapter(list[Package]).validate_python(data["packages"])

	return package_list

def install_packages(*pkgs: Package) -> None:
	for p1 in pkgs:
		if p1 not in installed:
			if p1.depends:
				dep_defs = [p2 for p2 in pkgs if p2.name in p1.depends]
				install_packages(*dep_defs)

			echo @(p1.command) | sh
			installed.append(p1)

installed = []

for name, count in Counter(package.name for package in get_packages()).items():
	if count > 1:
		raise Exception(f'{count} packages named "{name}"')

install_packages(*get_packages())	
