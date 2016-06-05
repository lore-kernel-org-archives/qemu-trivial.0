Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9Siy-000380-7g
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:43:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sis-00032U-8h
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:43:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sin-0004RU-HH
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:43:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9Sig-0004OQ-82; Sun, 05 Jun 2016 03:43:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A34F5408D7;
	Sun,  5 Jun 2016 10:43:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 30F89928;
	Sun,  5 Jun 2016 10:43:32 +0300 (MSK)
Received: (nullmailer pid 1088 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Sun,  5 Jun 2016 10:42:37 +0300
Message-Id: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/52] Trivial patches for 2016-06-05
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 07:43:54 -0000

This is a big pile of patches collected in -trivial queue
for quite a while.  I was busy with other stuff in recent
months, now am trying to catch up.  This is the result,
with everything all over.  Please consider pulling.

/mjt

The following changes since commit 6b3532b20b787cbd697a68b383232f5c3b39bd1e:

  Merge remote-tracking branch 'remotes/kraxel/tags/pull-ui-20160603-1' into staging (2016-06-03 12:03:36 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2016-06-05

for you to fetch changes up to 275757ac23428a641983200805bedee8f7b96793:

  hbitmap: Use DIV_ROUND_UP (2016-06-05 10:10:48 +0300)

----------------------------------------------------------------
trivial patches for 2016-06-05

----------------------------------------------------------------
Alberto Garcia (1):
      docs: Fix a couple of typos in throttle.txt

Cao jin (3):
      ICH9: fix typo
      qdev: Clean up around properties
      fw_cfg: follow CODING_STYLE

Eric Blake (2):
      monitor: Typo fix
      host-utils: Prefer 'false' for bool type

Igor Mammedov (1):
      pc: cleanup unused struct PcRomPciInfo

James Clarke (1):
      Fix linking relocatable objects on Sparc

Jan Vesely (1):
      po/Makefile: call rm -f directly

Laurent Vivier (21):
      scripts: add muldiv64() checking coccinelle scripts
      The only 64bit parameter of muldiv64() is the first one.
      remove useless muldiv64()
      replace muldiv64(a, b, c) by (uint64_t)a * b / c
      ppc: Remove a potential overflow in muldiv64()
      coccinelle: use macro DIV_ROUND_UP instead of (((n) + (d) - 1) /(d))
      parallels: Use DIV_ROUND_UP
      qcow/qcow2: Use DIV_ROUND_UP
      qed: Use DIV_ROUND_UP
      block: Use DIV_ROUND_UP
      crypto: Use DIV_ROUND_UP
      xen: Use DIV_ROUND_UP
      audio: Use DIV_ROUND_UP
      SPICE: Use DIV_ROUND_UP
      rocker: Use DIV_ROUND_UP
      usb: Use DIV_ROUND_UP
      slirp: Use DIV_ROUND_UP
      linux-user: Use DIV_ROUND_UP
      pc-bios/s390-ccw: Use DIV_ROUND_UP
      qemu-timer: Use DIV_ROUND_UP
      hbitmap: Use DIV_ROUND_UP

Michael Tokarev (5):
      s390x/virtio-ccw: fix spelling
      hw/ipmi: fix spelling
      docs: "specify" spell fix
      qga: spelling fix
      fsdev: spelling fix

Peter Maydell (10):
      qemu-options.hx: Specify the units for -machine kvm_shadow_mem
      replay: Clean up includes
      hw: Clean up includes
      clean-includes: Add glib.h to list of unneeded includes
      tests: Remove unnecessary glib.h includes
      qga: Remove unnecessary glib.h includes
      all: Remove unnecessary glib.h includes
      qemu-common.h: Drop WORDS_ALIGNED define
      thunk: Drop unused NO_THUNK_TYPE_SIZE guards
      thunk: Rename args and fields in host-target bitmask conversion code

Peter Wu (1):
      gdbstub: set listen backlog to 1

Sameeh Jubran (1):
      e1000: Removing unnecessary if statement

Stefan Weil (3):
      target-moxie: Remove unused struct elements
      configure: Use $(..) instead of deprecated `..`
      scripts: Use $(..) instead of deprecated `..`

Steven Luo (1):
      Fix configure test for PBKDF2 in nettle

Wei Jiangang (1):
      docs/multi-thread-compression: Fix wrong command string

 block/dmg.c                                |   1 -
 block/parallels.c                          |   2 +-
 block/qcow.c                               |   4 +-
 block/qcow2-cluster.c                      |   4 +-
 block/qcow2-refcount.c                     |   6 +-
 block/qed-check.c                          |   3 +-
 block/qed.c                                |   3 +-
 block/vhdx.c                               |   1 -
 block/vmdk.c                               |   1 -
 block/vvfat.c                              |   3 +-
 configure                                  | 188 ++++++++++++++++-------------
 crypto/block-luks.c                        |   6 +-
 docs/multi-thread-compression.txt          |   2 +-
 docs/qapi-code-gen.txt                     |   2 +-
 docs/throttle.txt                          |   4 +-
 fsdev/9p-iov-marshal.c                     |   1 -
 fsdev/9p-marshal.c                         |   1 -
 fsdev/virtfs-proxy-helper.texi             |   2 +-
 gdbstub.c                                  |   2 +-
 hw/9pfs/9p.h                               |   1 -
 hw/audio/gus.c                             |   2 +-
 hw/audio/pcspk.c                           |   2 +-
 hw/block/tc58128.c                         |   2 +-
 hw/core/qdev.c                             |  30 +++--
 hw/display/xenfb.c                         |   4 +-
 hw/i386/acpi-build.c                       |   1 -
 hw/i386/pc.c                               |   8 --
 hw/i386/pc_piix.c                          |   1 -
 hw/intc/aspeed_vic.c                       |   1 -
 hw/ipmi/ipmi_bmc_extern.c                  |   2 +-
 hw/isa/lpc_ich9.c                          |   4 +-
 hw/net/e1000.c                             |   8 +-
 hw/net/rocker/rocker_of_dpa.c              |   5 +-
 hw/nvram/fw_cfg.c                          |  17 ++-
 hw/ppc/ppc.c                               |   2 +-
 hw/s390x/virtio-ccw.c                      |   2 +-
 hw/timer/mc146818rtc.c                     |   1 -
 hw/timer/omap_gptimer.c                    |   4 +-
 hw/usb/hcd-ohci.c                          |   2 +-
 hw/usb/redirect.c                          |   6 +-
 hw/xtensa/pic_cpu.c                        |   4 +-
 include/exec/cpu-all.h                     |   5 -
 include/exec/hwaddr.h                      |   1 -
 include/exec/user/thunk.h                  |  15 +--
 include/hw/acpi/aml-build.h                |   1 -
 include/hw/acpi/bios-linker-loader.h       |   1 -
 include/hw/i386/ich9.h                     |   4 +-
 include/hw/qdev-properties.h               |  10 +-
 include/qemu-common.h                      |   4 -
 include/qemu/bitmap.h                      |   1 -
 include/qemu/fifo32.h                      |   1 -
 include/qemu/host-utils.h                  |   2 +-
 include/qemu/rcu.h                         |   1 -
 include/qom/object.h                       |   1 -
 include/sysemu/tpm_backend_int.h           |   1 -
 linux-user/syscall.c                       |   4 +-
 memory_mapping.c                           |   1 -
 migration/postcopy-ram.c                   |   1 -
 monitor.c                                  |   2 +-
 page_cache.c                               |   1 -
 pc-bios/s390-ccw/bootmap.c                 |   2 +-
 po/Makefile                                |   2 +-
 qapi/qmp-registry.c                        |   1 -
 qemu-bridge-helper.c                       |   1 -
 qemu-options.hx                            |   6 +-
 qemu-timer.c                               |   2 +-
 qga/channel-posix.c                        |   1 -
 qga/channel-win32.c                        |   1 -
 qga/channel.h                              |   1 -
 qga/commands-posix.c                       |  13 +-
 qga/commands-win32.c                       |   1 -
 qga/commands.c                             |   1 -
 qga/guest-agent-command-state.c            |   1 -
 qga/main.c                                 |   1 -
 qga/service-win32.c                        |   1 -
 replay/replay-char.c                       |   4 -
 rules.mak                                  |   2 +-
 scripts/clean-includes                     |   5 +-
 scripts/coccinelle/overflow_muldiv64.cocci |  16 +++
 scripts/coccinelle/remove_muldiv64.cocci   |   6 +
 scripts/coccinelle/round.cocci             |  19 +++
 scripts/coccinelle/simplify_muldiv64.cocci |  11 ++
 scripts/coccinelle/swap_muldiv64.cocci     |  13 ++
 scripts/create_config                      |   6 +-
 scripts/feature_to_c.sh                    |   6 +-
 scripts/make_device_config.sh              |   4 +-
 scripts/qemu-binfmt-conf.sh                |   2 +-
 scripts/update-linux-headers.sh            |   2 +-
 slirp/dnssearch.c                          |   5 +-
 slirp/slirp.h                              |   1 -
 target-moxie/mmu.h                         |   5 -
 tests/ac97-test.c                          |   1 -
 tests/ahci-test.c                          |   1 -
 tests/bios-tables-test.c                   |   1 -
 tests/boot-order-test.c                    |   1 -
 tests/check-qdict.c                        |   1 -
 tests/check-qfloat.c                       |   1 -
 tests/check-qint.c                         |   1 -
 tests/check-qjson.c                        |   1 -
 tests/check-qlist.c                        |   1 -
 tests/check-qnull.c                        |   1 -
 tests/check-qom-interface.c                |   1 -
 tests/check-qom-proplist.c                 |   1 -
 tests/check-qstring.c                      |   1 -
 tests/device-introspect-test.c             |   1 -
 tests/display-vga-test.c                   |   1 -
 tests/drive_del-test.c                     |   1 -
 tests/ds1338-test.c                        |   2 -
 tests/e1000-test.c                         |   1 -
 tests/eepro100-test.c                      |   1 -
 tests/endianness-test.c                    |   1 -
 tests/es1370-test.c                        |   1 -
 tests/fdc-test.c                           |   1 -
 tests/fw_cfg-test.c                        |   1 -
 tests/hd-geo-test.c                        |   1 -
 tests/i440fx-test.c                        |   1 -
 tests/i82801b11-test.c                     |   1 -
 tests/ide-test.c                           |   1 -
 tests/intel-hda-test.c                     |   1 -
 tests/ioh3420-test.c                       |   1 -
 tests/ipmi-bt-test.c                       |   1 -
 tests/ipmi-kcs-test.c                      |   1 -
 tests/ipoctal232-test.c                    |   1 -
 tests/ivshmem-test.c                       |   1 -
 tests/libqos/ahci.c                        |   1 -
 tests/libqos/fw_cfg.c                      |   1 -
 tests/libqos/i2c-imx.c                     |   1 -
 tests/libqos/i2c-omap.c                    |   1 -
 tests/libqos/libqos.c                      |   1 -
 tests/libqos/malloc-generic.c              |   1 -
 tests/libqos/malloc-pc.c                   |   1 -
 tests/libqos/malloc.c                      |   1 -
 tests/libqos/pci-pc.c                      |   1 -
 tests/libqos/pci.c                         |   1 -
 tests/libqos/usb.c                         |   1 -
 tests/libqos/virtio-mmio.c                 |   1 -
 tests/libqos/virtio-pci.c                  |   1 -
 tests/libqos/virtio.c                      |   1 -
 tests/libqtest.c                           |   1 -
 tests/m48t59-test.c                        |   1 -
 tests/ne2000-test.c                        |   1 -
 tests/nvme-test.c                          |   1 -
 tests/pc-cpu-test.c                        |   1 -
 tests/pcnet-test.c                         |   1 -
 tests/pvpanic-test.c                       |   1 -
 tests/pxe-test.c                           |   1 -
 tests/q35-test.c                           |   1 -
 tests/qom-test.c                           |   1 -
 tests/rcutorture.c                         |   1 -
 tests/rtc-test.c                           |   1 -
 tests/rtl8139-test.c                       |   1 -
 tests/spapr-phb-test.c                     |   1 -
 tests/tco-test.c                           |   1 -
 tests/test-aio.c                           |   1 -
 tests/test-base64.c                        |   1 -
 tests/test-bitops.c                        |   1 -
 tests/test-blockjob-txn.c                  |   1 -
 tests/test-coroutine.c                     |   1 -
 tests/test-crypto-cipher.c                 |   1 -
 tests/test-crypto-hash.c                   |   1 -
 tests/test-crypto-secret.c                 |   1 -
 tests/test-cutils.c                        |   1 -
 tests/test-filter-mirror.c                 |   1 -
 tests/test-filter-redirector.c             |   1 -
 tests/test-hbitmap.c                       |   7 +-
 tests/test-int128.c                        |   1 -
 tests/test-io-task.c                       |   1 -
 tests/test-iov.c                           |   1 -
 tests/test-logging.c                       |   1 -
 tests/test-mul64.c                         |   1 -
 tests/test-netfilter.c                     |   1 -
 tests/test-opts-visitor.c                  |   1 -
 tests/test-qdev-global-props.c             |   1 -
 tests/test-qemu-opts.c                     |   1 -
 tests/test-qga.c                           |   1 -
 tests/test-qmp-commands.c                  |   1 -
 tests/test-qmp-event.c                     |   1 -
 tests/test-qmp-input-strict.c              |   1 -
 tests/test-qmp-input-visitor.c             |   1 -
 tests/test-qmp-output-visitor.c            |   1 -
 tests/test-rcu-list.c                      |   1 -
 tests/test-rfifolock.c                     |   1 -
 tests/test-string-input-visitor.c          |   1 -
 tests/test-string-output-visitor.c         |   1 -
 tests/test-thread-pool.c                   |   1 -
 tests/test-throttle.c                      |   1 -
 tests/test-timed-average.c                 |   1 -
 tests/test-visitor-serialization.c         |   1 -
 tests/test-vmstate.c                       |   1 -
 tests/test-write-threshold.c               |   1 -
 tests/test-x86-cpuid.c                     |   1 -
 tests/tmp105-test.c                        |   1 -
 tests/tpci200-test.c                       |   1 -
 tests/usb-hcd-ehci-test.c                  |   1 -
 tests/usb-hcd-ohci-test.c                  |   1 -
 tests/usb-hcd-uhci-test.c                  |   1 -
 tests/usb-hcd-xhci-test.c                  |   1 -
 tests/vhost-user-test.c                    |   1 -
 tests/virtio-9p-test.c                     |   1 -
 tests/virtio-balloon-test.c                |   1 -
 tests/virtio-blk-test.c                    |   1 -
 tests/virtio-console-test.c                |   1 -
 tests/virtio-net-test.c                    |   1 -
 tests/virtio-rng-test.c                    |   1 -
 tests/virtio-scsi-test.c                   |   1 -
 tests/virtio-serial-test.c                 |   1 -
 tests/vmxnet3-test.c                       |   1 -
 tests/wdt_ib700-test.c                     |   1 -
 thunk.c                                    |  32 +++--
 ui/sdl_zoom.c                              |   1 -
 ui/spice-display.c                         |   2 +-
 ui/vnc-palette.c                           |   1 -
 util/coroutine-gthread.c                   |   1 -
 util/hbitmap.c                             |   1 -
 util/memfd.c                               |   1 -
 util/oslib-win32.c                         |   1 -
 util/uri.c                                 |   1 -
 vl.c                                       |   1 -
 xen-hvm.c                                  |   2 +-
 219 files changed, 305 insertions(+), 407 deletions(-)
 create mode 100644 scripts/coccinelle/overflow_muldiv64.cocci
 create mode 100644 scripts/coccinelle/remove_muldiv64.cocci
 create mode 100644 scripts/coccinelle/round.cocci
 create mode 100644 scripts/coccinelle/simplify_muldiv64.cocci
 create mode 100644 scripts/coccinelle/swap_muldiv64.cocci

