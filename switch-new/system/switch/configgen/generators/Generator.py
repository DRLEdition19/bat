from __future__ import annotations

from abc import ABCMeta, abstractmethod
from typing import TYPE_CHECKING, Any

if TYPE_CHECKING:
    from collections.abc import Mapping

    from configgen.Command import Command
    from configgen.controllersConfig import ControllerMapping
    from configgen.Emulator import Emulator
    from configgen.types import DeviceInfoMapping, GunMapping, HotkeysContext, Resolution


class Generator(metaclass=ABCMeta):
    @abstractmethod
    def generate(
        self,
        system: Emulator,
        rom: str,
        playersControllers: ControllerMapping,
        metadata: Mapping[str, str],
        guns: GunMapping,
        wheels: DeviceInfoMapping,
        gameResolution: Resolution,
    ) -> Command:
        ...

    def getResolutionMode(self, config: dict[str, Any]) -> str:
        return config['videomode']

    def getMouseMode(self, config: dict[str, Any], rom: str) -> bool:
        return False

    def executionDirectory(self, config: dict[str, Any], rom: str) -> str | None:
        return None

    # mame or libretro have internal bezels, don't display the one of mangohud
    def supportsInternalBezels(self) -> bool:
        return False

    # mangohud must be called by the generator itself (wine based emulator for example)
    def hasInternalMangoHUDCall(self) -> bool:
        return False

    def getInGameRatio(self, config: dict[str, Any], gameResolution: Resolution, rom: str) -> float:
        # put a default value, but it should be overriden by generators
        return 4/3

    @abstractmethod
    def getHotkeysContext(self) -> HotkeysContext:
        ...
