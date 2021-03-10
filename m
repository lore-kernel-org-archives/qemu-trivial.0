Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lK6dw-00037j-Iu
	for mharc-qemu-trivial@gnu.org; Wed, 10 Mar 2021 16:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dp-00032s-CX; Wed, 10 Mar 2021 16:45:18 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:40621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dl-0004FK-Q4; Wed, 10 Mar 2021 16:45:17 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MQdMG-1l8bdS2pZW-00NjVm; Wed, 10 Mar 2021 22:45:08 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/22] Trivial branch for 6.0 patches
Date: Wed, 10 Mar 2021 22:44:42 +0100
Message-Id: <20210310214504.1183162-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lSUKlv47sMVh6z1jJzwmMshxuPwmX5D4HPAkltqZgimoVeX9B6c
 myXbhnpyXjncDMNXdupVA111SGrO9kzlJWD4Ni4UdClDxjypIbITSj4jpNGHVXXcK74ggg5
 OPKNzl56mC3fuTZJlpbjF0MCoOYrZezNJvo6uu6kgBncQWuAvxM+dNeDcKmsRPToW1EQieY
 dpN6A0kgLdsiOPZxR8aVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RJA2rbkwHmM=:jptZ8grRk39LANcyuSNtUP
 AZHoMbphUC14oYswNem1zhKRvoi5mQvngcCQWLjE3J/FNgi1/FBoW14JF3z2XvcYhQRvT5E/R
 GILKNGvY3kA25J6135GOCnPgfou4o0ChqcvHO1NxZ0nobssePLSodE3Q76UdcLn58RVKzy5G7
 18YpXeJ+IG5FasLPTp0ulbbI0mwE6nraDfaVR49g1jikWBLoYSrxTBS5nJDzK0lzsJgHNUI8J
 sk/CtF29i/YFcOo1sthYHLR2dSfhVJF87LQGbpdxGnVd+UJbw9jF8gCsbRbL1niRA5IbPcuRm
 5xSAFEx0CvC3hA7Nr7Uwq6wN/RmpfBSogSPb6x/XcKqjGDOz0lYVcMaxDDDAmkbY5E5Z0DeRy
 lBGVXDjB6n37DAj1E44EvvQMJrW6Iho1mdVvjSgOuirvKHSVJTs6yOMGOIUuh
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Mar 2021 21:45:20 -0000

The following changes since commit b2ae1009d7cca2701e17eae55ae2d44fd22c942a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20210307' =
in=3D=0D
to staging (2021-03-09 13:50:35 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.0-pull-request=
=0D
=0D
for you to fetch changes up to 538f049704e9b7a07eeaf326af772fdd30d89576:=0D
=0D
  sysemu: Let VMChangeStateHandler take boolean 'running' argument (2021-03=
-0=3D=0D
9 23:13:57 +0100)=0D
=0D
----------------------------------------------------------------=0D
Pull request trivial patches 20210310=0D
=0D
----------------------------------------------------------------=0D
=0D
Alexander Bulekov (1):=0D
  fuzz-test: remove unneccessary debugging flags=0D
=0D
Eric Blake (1):=0D
  scsi: Silence gcc warning=0D
=0D
Markus Armbruster (2):=0D
  backends/dbus-vmstate: Fix short read error handling=0D
  vhost_user_gpu: Drop dead check for g_malloc() failure=0D
=0D
Michael Tokarev (1):=0D
  Various spelling fixes=0D
=0D
Peter Maydell (1):=0D
  qemu-common.h: Update copyright string to 2021=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (13):=0D
  hw/elf_ops: Fix a typo=0D
  target/hexagon/gen_tcg_funcs: Fix a typo=0D
  exec/memory: Use struct Object typedef=0D
  ui: Replace the word 'whitelist'=0D
  scripts/tracetool: Replace the word 'whitelist'=0D
  seccomp: Replace the word 'blacklist'=0D
  qemu-options: Replace the word 'blacklist'=0D
  tests/fp/fp-test: Replace the word 'blacklist'=0D
  hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for lm32-evr/uclinux boards=0D
  hw/lm32/Kconfig: Rename CONFIG_LM32 -> CONFIG_LM32_DEVICES=0D
  hw/lm32/Kconfig: Have MILKYMIST select LM32_DEVICES=0D
  sysemu/runstate: Let runstate_is_running() return bool=0D
  sysemu: Let VMChangeStateHandler take boolean 'running' argument=0D
=0D
Thomas Huth (1):=0D
  net: Use id_generate() in the network subsystem, too=0D
=0D
Wainer dos Santos Moschetta (1):=0D
  MAINTAINERS: Fix the location of tools manuals=0D
=0D
lijiejun (1):=0D
  virtio-gpu: Adjust code space style=0D
=0D
 MAINTAINERS                              | 10 ++++----=0D
 accel/xen/xen-all.c                      |  2 +-=0D
 audio/audio.c                            |  2 +-=0D
 backends/dbus-vmstate.c                  |  5 +++-=0D
 block/block-backend.c                    |  2 +-=0D
 default-configs/devices/lm32-softmmu.mak |  2 +-=0D
 disas/nanomips.cpp                       |  2 +-=0D
 gdbstub.c                                |  2 +-=0D
 hw/block/pflash_cfi01.c                  |  2 +-=0D
 hw/block/virtio-blk.c                    |  2 +-=0D
 hw/char/meson.build                      |  4 +--=0D
 hw/display/qxl.c                         |  2 +-=0D
 hw/display/vhost-user-gpu.c              |  1 -=0D
 hw/display/virtio-gpu-3d.c               |  3 +--=0D
 hw/i386/kvm/clock.c                      |  2 +-=0D
 hw/i386/kvm/i8254.c                      |  2 +-=0D
 hw/i386/kvmvapic.c                       |  2 +-=0D
 hw/i386/xen/xen-hvm.c                    |  2 +-=0D
 hw/ide/core.c                            |  2 +-=0D
 hw/intc/arm_gicv3_its_kvm.c              |  2 +-=0D
 hw/intc/arm_gicv3_kvm.c                  |  2 +-=0D
 hw/intc/meson.build                      |  2 +-=0D
 hw/intc/spapr_xive_kvm.c                 |  2 +-=0D
 hw/lm32/Kconfig                          | 10 +++++---=0D
 hw/lm32/meson.build                      |  2 +-=0D
 hw/misc/mac_via.c                        |  2 +-=0D
 hw/misc/trace-events                     |  2 +-=0D
 hw/net/allwinner-sun8i-emac.c            |  2 +-=0D
 hw/net/e1000e_core.c                     |  2 +-=0D
 hw/nvram/spapr_nvram.c                   |  2 +-=0D
 hw/ppc/pnv_bmc.c                         |  2 +-=0D
 hw/ppc/pnv_xscom.c                       |  2 +-=0D
 hw/ppc/ppc.c                             |  2 +-=0D
 hw/ppc/ppc_booke.c                       |  2 +-=0D
 hw/s390x/tod-kvm.c                       |  2 +-=0D
 hw/scsi/scsi-bus.c                       |  2 +-=0D
 hw/scsi/scsi-disk.c                      |  1 +=0D
 hw/timer/meson.build                     |  2 +-=0D
 hw/usb/ccid-card-emulated.c              |  2 +-=0D
 hw/usb/hcd-ehci.c                        |  2 +-=0D
 hw/usb/hcd-ohci.c                        |  2 +-=0D
 hw/usb/host-libusb.c                     |  2 +-=0D
 hw/usb/redirect.c                        |  2 +-=0D
 hw/vfio/migration.c                      |  2 +-=0D
 hw/virtio/vhost.c                        |  2 +-=0D
 hw/virtio/virtio-rng.c                   |  2 +-=0D
 hw/virtio/virtio.c                       |  2 +-=0D
 include/exec/memory.h                    | 32 ++++++++++++------------=0D
 include/hw/elf_ops.h                     |  2 +-=0D
 include/hw/ppc/pnv_xscom.h               |  2 +-=0D
 include/hw/s390x/css.h                   |  2 +-=0D
 include/qemu-common.h                    |  2 +-=0D
 include/qemu/id.h                        |  1 +=0D
 include/sysemu/runstate.h                | 12 ++++++---=0D
 net/net.c                                |  8 +++---=0D
 qemu-options.hx                          | 10 ++++----=0D
 scripts/tracetool/__init__.py            |  2 +-=0D
 softmmu/memory.c                         | 14 +++++------=0D
 softmmu/qemu-seccomp.c                   | 16 ++++++------=0D
 softmmu/runstate.c                       |  4 +--=0D
 target/arm/kvm.c                         |  2 +-=0D
 target/arm/kvm_arm.h                     |  2 +-=0D
 target/hexagon/gen_tcg_funcs.py          | 14 +++++------=0D
 target/i386/cpu.c                        |  2 +-=0D
 target/i386/kvm/kvm.c                    |  2 +-=0D
 target/i386/machine.c                    |  2 +-=0D
 target/i386/sev.c                        |  2 +-=0D
 target/i386/whpx/whpx-all.c              |  2 +-=0D
 target/m68k/op_helper.c                  |  2 +-=0D
 target/mips/kvm.c                        |  4 +--=0D
 target/ppc/cpu-qom.h                     |  2 +-=0D
 target/riscv/cpu.c                       |  2 +-=0D
 tests/fp/fp-test.c                       |  8 +++---=0D
 tests/qtest/fuzz-test.c                  |  3 +--=0D
 ui/console.c                             |  2 +-=0D
 ui/gtk.c                                 |  2 +-=0D
 ui/spice-core.c                          |  2 +-=0D
 ui/vnc-auth-sasl.c                       |  4 +--=0D
 util/id.c                                |  1 +=0D
 79 files changed, 147 insertions(+), 134 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

