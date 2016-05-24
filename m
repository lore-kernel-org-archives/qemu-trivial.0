Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b5ECX-0000P2-5X
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2016 11:24:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5ECU-0000Li-86
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:24:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5ECP-0004UX-Tv
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:24:53 -0400
Received: from orth.archaic.org.uk ([81.2.115.148]:49459)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5ECP-0004Ty-Ja
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:24:49 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5ECG-0002xh-9N; Tue, 24 May 2016 16:24:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-trivial@nongnu.org
Date: Tue, 24 May 2016 16:24:35 +0100
Message-Id: <1464103479-26913-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 81.2.115.148
Subject: [Qemu-trivial] [PATCH 0/4] Remove unnecessary glib.h includes
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
X-List-Received-Date: Tue, 24 May 2016 15:24:55 -0000

This patchset removes '#include <glib.h>' lines, because the
header is already included via osdep.h.

Patch 1 adds the check to clean-includes, and patches 2-4
apply it (the breakup into 'tests', 'qga' and 'everything else'
is semi-arbitrary and just to keep patch sizes down.)

thanks
-- PMM


Peter Maydell (4):
  clean-includes: Add glib.h to list of unneeded includes
  tests: Remove unnecessary glib.h includes
  qga: Remove unnecessary glib.h includes
  all: Remove unnecessary glib.h includes

 block/dmg.c                          | 1 -
 block/vhdx.c                         | 1 -
 block/vmdk.c                         | 1 -
 fsdev/9p-iov-marshal.c               | 1 -
 fsdev/9p-marshal.c                   | 1 -
 hw/9pfs/9p.h                         | 1 -
 hw/i386/acpi-build.c                 | 1 -
 hw/i386/pc_piix.c                    | 1 -
 include/hw/acpi/aml-build.h          | 1 -
 include/hw/acpi/bios-linker-loader.h | 1 -
 include/qemu/bitmap.h                | 1 -
 include/qemu/rcu.h                   | 1 -
 include/qom/object.h                 | 1 -
 include/sysemu/tpm_backend_int.h     | 1 -
 memory_mapping.c                     | 1 -
 migration/postcopy-ram.c             | 1 -
 page_cache.c                         | 1 -
 qapi/qmp-registry.c                  | 1 -
 qemu-bridge-helper.c                 | 1 -
 qga/channel-posix.c                  | 1 -
 qga/channel-win32.c                  | 1 -
 qga/channel.h                        | 1 -
 qga/commands-posix.c                 | 1 -
 qga/commands-win32.c                 | 1 -
 qga/commands.c                       | 1 -
 qga/guest-agent-command-state.c      | 1 -
 qga/main.c                           | 1 -
 qga/service-win32.c                  | 1 -
 scripts/clean-includes               | 3 ++-
 slirp/dnssearch.c                    | 1 -
 slirp/slirp.h                        | 1 -
 tests/ac97-test.c                    | 1 -
 tests/ahci-test.c                    | 1 -
 tests/bios-tables-test.c             | 1 -
 tests/boot-order-test.c              | 1 -
 tests/check-qdict.c                  | 1 -
 tests/check-qfloat.c                 | 1 -
 tests/check-qint.c                   | 1 -
 tests/check-qjson.c                  | 1 -
 tests/check-qlist.c                  | 1 -
 tests/check-qnull.c                  | 1 -
 tests/check-qom-interface.c          | 1 -
 tests/check-qom-proplist.c           | 1 -
 tests/check-qstring.c                | 1 -
 tests/device-introspect-test.c       | 1 -
 tests/display-vga-test.c             | 1 -
 tests/drive_del-test.c               | 1 -
 tests/ds1338-test.c                  | 1 -
 tests/e1000-test.c                   | 1 -
 tests/eepro100-test.c                | 1 -
 tests/endianness-test.c              | 1 -
 tests/es1370-test.c                  | 1 -
 tests/fdc-test.c                     | 1 -
 tests/fw_cfg-test.c                  | 1 -
 tests/hd-geo-test.c                  | 1 -
 tests/i440fx-test.c                  | 1 -
 tests/i82801b11-test.c               | 1 -
 tests/ide-test.c                     | 1 -
 tests/intel-hda-test.c               | 1 -
 tests/ioh3420-test.c                 | 1 -
 tests/ipmi-bt-test.c                 | 1 -
 tests/ipmi-kcs-test.c                | 1 -
 tests/ipoctal232-test.c              | 1 -
 tests/ivshmem-test.c                 | 1 -
 tests/libqos/ahci.c                  | 1 -
 tests/libqos/fw_cfg.c                | 1 -
 tests/libqos/i2c-imx.c               | 1 -
 tests/libqos/i2c-omap.c              | 1 -
 tests/libqos/libqos.c                | 1 -
 tests/libqos/malloc-generic.c        | 1 -
 tests/libqos/malloc-pc.c             | 1 -
 tests/libqos/malloc.c                | 1 -
 tests/libqos/pci-pc.c                | 1 -
 tests/libqos/pci.c                   | 1 -
 tests/libqos/usb.c                   | 1 -
 tests/libqos/virtio-mmio.c           | 1 -
 tests/libqos/virtio-pci.c            | 1 -
 tests/libqos/virtio.c                | 1 -
 tests/libqtest.c                     | 1 -
 tests/m48t59-test.c                  | 1 -
 tests/ne2000-test.c                  | 1 -
 tests/nvme-test.c                    | 1 -
 tests/pc-cpu-test.c                  | 1 -
 tests/pcnet-test.c                   | 1 -
 tests/pvpanic-test.c                 | 1 -
 tests/pxe-test.c                     | 1 -
 tests/q35-test.c                     | 1 -
 tests/qom-test.c                     | 1 -
 tests/rcutorture.c                   | 1 -
 tests/rtc-test.c                     | 1 -
 tests/rtl8139-test.c                 | 1 -
 tests/spapr-phb-test.c               | 1 -
 tests/tco-test.c                     | 1 -
 tests/test-aio.c                     | 1 -
 tests/test-base64.c                  | 1 -
 tests/test-bitops.c                  | 1 -
 tests/test-blockjob-txn.c            | 1 -
 tests/test-coroutine.c               | 1 -
 tests/test-crypto-cipher.c           | 1 -
 tests/test-crypto-hash.c             | 1 -
 tests/test-crypto-secret.c           | 1 -
 tests/test-cutils.c                  | 1 -
 tests/test-filter-mirror.c           | 1 -
 tests/test-filter-redirector.c       | 1 -
 tests/test-hbitmap.c                 | 1 -
 tests/test-int128.c                  | 1 -
 tests/test-io-task.c                 | 1 -
 tests/test-iov.c                     | 1 -
 tests/test-logging.c                 | 1 -
 tests/test-mul64.c                   | 1 -
 tests/test-netfilter.c               | 1 -
 tests/test-opts-visitor.c            | 1 -
 tests/test-qdev-global-props.c       | 1 -
 tests/test-qemu-opts.c               | 1 -
 tests/test-qga.c                     | 1 -
 tests/test-qmp-commands.c            | 1 -
 tests/test-qmp-event.c               | 1 -
 tests/test-qmp-input-strict.c        | 1 -
 tests/test-qmp-input-visitor.c       | 1 -
 tests/test-qmp-output-visitor.c      | 1 -
 tests/test-rcu-list.c                | 1 -
 tests/test-rfifolock.c               | 1 -
 tests/test-string-input-visitor.c    | 1 -
 tests/test-string-output-visitor.c   | 1 -
 tests/test-thread-pool.c             | 1 -
 tests/test-throttle.c                | 1 -
 tests/test-timed-average.c           | 1 -
 tests/test-visitor-serialization.c   | 1 -
 tests/test-vmstate.c                 | 1 -
 tests/test-write-threshold.c         | 1 -
 tests/test-x86-cpuid.c               | 1 -
 tests/tmp105-test.c                  | 1 -
 tests/tpci200-test.c                 | 1 -
 tests/usb-hcd-ehci-test.c            | 1 -
 tests/usb-hcd-ohci-test.c            | 1 -
 tests/usb-hcd-uhci-test.c            | 1 -
 tests/usb-hcd-xhci-test.c            | 1 -
 tests/vhost-user-test.c              | 1 -
 tests/virtio-9p-test.c               | 1 -
 tests/virtio-balloon-test.c          | 1 -
 tests/virtio-blk-test.c              | 1 -
 tests/virtio-console-test.c          | 1 -
 tests/virtio-net-test.c              | 1 -
 tests/virtio-rng-test.c              | 1 -
 tests/virtio-scsi-test.c             | 1 -
 tests/virtio-serial-test.c           | 1 -
 tests/vmxnet3-test.c                 | 1 -
 tests/wdt_ib700-test.c               | 1 -
 ui/sdl_zoom.c                        | 1 -
 ui/vnc-palette.c                     | 1 -
 util/coroutine-gthread.c             | 1 -
 util/hbitmap.c                       | 1 -
 util/memfd.c                         | 1 -
 util/oslib-win32.c                   | 1 -
 util/uri.c                           | 1 -
 vl.c                                 | 1 -
 156 files changed, 2 insertions(+), 156 deletions(-)

-- 
1.9.1


