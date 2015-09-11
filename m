Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaM7l-0004rk-6b
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:04:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaM7d-0004cs-CK
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:04:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaM7b-0006sS-Vh
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:04:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40707)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaM7W-0006or-2D; Fri, 11 Sep 2015 07:03:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F000141207;
	Fri, 11 Sep 2015 14:03:51 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 85BCBA52;
	Fri, 11 Sep 2015 14:03:51 +0300 (MSK)
Received: (nullmailer pid 22751 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:24 +0300
Message-Id: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/26] Trivial patches for 2015-09-11
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Sep 2015 11:04:03 -0000

Here's a next trivial-patches pull request after more than one month
delay.  Hopefully this one is okay...

The following changes since commit 7b9c09f7d486647784c605739d69b708a7249c=
9b:

  Merge remote-tracking branch 'remotes/sstabellini/tags/xen-2015-09-10-t=
ag' into staging (2015-09-10 18:25:52 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-09-11

for you to fetch changes up to af5b83d7d5297f8bdfd3353a420c120c4fd5adfd:

  virtio-vga: enable for i386 (2015-09-11 12:18:37 +0300)

----------------------------------------------------------------
trivial patches for 2015-09-11

----------------------------------------------------------------
Andrey Korolyov (1):
      Trivial: fix commandline help message

Daniel P. Berrange (7):
      maint: remove double semicolons in many files
      maint: remove / fix many doubled words
      maint: remove unused include for assert.h
      maint: remove unused include for dirent.h
      maint: remove unused include for signal.h
      maint: remove unused include for strings.h
      maint: avoid useless "if (foo) free(foo)" pattern

Gerd Hoffmann (1):
      virtio-vga: enable for i386

John Snow (1):
      trivial: remove trailing newline from error_report

K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n (1):
      opts: produce valid command line in qemu_opts_print

Laurent Vivier (2):
      i6300esb: fix timer overflow
      help: dd missing newline

Marc-Andr=C3=A9 Lureau (2):
      docs: fix a qga/qapi-schema.json comment
      qapi-schema: remove legacy<> from doc

Markus Armbruster (1):
      maint: avoid useless "if (foo) free(foo)" pattern

Samuel Thibault (1):
      baum: Fix build with debugging enabled

Shannon Zhao (4):
      hw/s390x/s390-virtio-bus: Remove meaningless blank Property
      hw/virtio/virtio-pci: Remove meaningless blank Property
      hw/gpio/zaurus: Remove meaningless blank Property
      hw/arm/spitz: Remove meaningless blank Property

Shraddha Barke (1):
      Target-ppc: Remove unnecessary variable

Stefan Weil (3):
      Update language files for QEMU 2.4.0
      linux-user: Fix warnings caused by missing 'static' attribute
      disas/microblaze: Remove unused code

Veres Lajos (1):
      typofixes - v4

 backends/baum.c                  |   2 +-
 backends/hostmem-file.c          |   4 +-
 block.c                          |   2 +-
 block/qcow2-cluster.c            |   4 +-
 block/qcow2-refcount.c           |   2 +-
 block/vhdx.c                     |   2 +-
 bsd-user/elfload.c               |   4 +-
 bsd-user/signal.c                |   1 -
 default-configs/i386-softmmu.mak |   1 +
 disas/i386.c                     |   2 +-
 disas/ia64.c                     |   1 -
 disas/microblaze.c               | 151 ---------------------------------=
------
 disas/s390.c                     |   4 +-
 disas/sparc.c                    |   3 +-
 docs/libcacard.txt               |   4 +-
 docs/multiseat.txt               |   2 +-
 docs/specs/ppc-spapr-hcalls.txt  |   4 +-
 docs/specs/qcow2.txt             |   2 +-
 docs/specs/rocker.txt            |   2 +-
 docs/writing-qmp-commands.txt    |   2 +-
 fsdev/virtio-9p-marshal.c        |   1 -
 hw/arm/spitz.c                   |   5 --
 hw/arm/vexpress.c                |   4 +-
 hw/audio/fmopl.c                 |   2 +-
 hw/block/xen_disk.c              |   1 -
 hw/bt/hci.c                      |   9 +--
 hw/char/exynos4210_uart.c        |   6 +-
 hw/core/loader.c                 |   3 +-
 hw/core/qdev-properties.c        |   4 +-
 hw/core/qdev.c                   |   2 +-
 hw/cris/axis_dev88.c             |   2 +-
 hw/display/exynos4210_fimd.c     |   4 +-
 hw/display/qxl-render.c          |   2 +-
 hw/dma/xilinx_axidma.c           |   2 +-
 hw/gpio/zaurus.c                 |   5 --
 hw/i386/xen/xen_platform.c       |   2 -
 hw/ide/ahci.c                    |   2 +-
 hw/input/stellaris_input.c       |   2 +-
 hw/intc/arm_gic.c                |   2 +-
 hw/intc/xics.c                   |   2 +-
 hw/mips/mips_r4k.c               |   4 +-
 hw/net/fsl_etsec/etsec.c         |   2 +-
 hw/net/fsl_etsec/rings.c         |   4 +-
 hw/net/rocker/rocker.c           |   4 +-
 hw/net/rocker/rocker_desc.c      |   8 +--
 hw/net/rtl8139.c                 |   8 +--
 hw/net/xen_nic.c                 |   1 -
 hw/nvram/fw_cfg.c                |   4 +-
 hw/pci-host/prep.c               |   4 +-
 hw/pci/shpc.c                    |   1 -
 hw/ppc/spapr_pci.c               |  12 ++--
 hw/s390x/s390-virtio-bus.c       |   5 --
 hw/sd/pl181.c                    |   2 +-
 hw/sd/sd.c                       |   3 +-
 hw/sd/sdhci.c                    |   6 +-
 hw/tpm/tpm_passthrough.c         |   2 -
 hw/usb/hcd-ehci-pci.c            |   6 +-
 hw/usb/hcd-xhci.c                |   4 +-
 hw/usb/host-libusb.c             |   2 +-
 hw/usb/redirect.c                |   2 -
 hw/vfio/common.c                 |   2 +-
 hw/vfio/pci.c                    |   3 +-
 hw/vfio/platform.c               |   2 +-
 hw/virtio/virtio-pci.c           |   5 --
 hw/watchdog/wdt_i6300esb.c       |   2 +-
 hw/xen/xen-host-pci-device.c     |   2 +-
 hw/xen/xen_pt_config_init.c      |   4 +-
 include/block/block.h            |   2 +-
 include/block/scsi.h             |   2 +-
 include/exec/memory.h            |   4 +-
 libcacard/card_7816t.h           |   2 +-
 libdecnumber/decContext.c        |   2 +-
 libdecnumber/decNumber.c         |   8 +--
 linux-user/elfload.c             |   2 +-
 linux-user/main.c                |   8 +--
 linux-user/signal.c              |   1 -
 linux-user/syscall.c             |   1 -
 linux-user/syscall_defs.h        |   4 +-
 migration/rdma.c                 |   2 +-
 migration/savevm.c               |   8 +--
 net/tap-linux.c                  |   4 +-
 numa.c                           |   2 +-
 os-win32.c                       |   1 -
 page_cache.c                     |   1 -
 po/de_DE.po                      |  36 +++++-----
 po/fr_FR.po                      |  36 +++++-----
 po/hu.po                         |  50 +++++++++----
 po/it.po                         |  38 +++++-----
 po/messages.po                   |  50 +++++++++----
 po/tr.po                         |  50 +++++++++----
 po/zh_CN.po                      |  36 +++++-----
 qapi-schema.json                 |  15 ++--
 qemu-char.c                      |   5 +-
 qemu-doc.texi                    |   2 +-
 qemu-img.texi                    |   2 +-
 qemu-nbd.c                       |   2 +-
 qemu-options.hx                  |   4 +-
 qga/commands-posix.c             |   2 +-
 qga/commands-win32.c             |   2 +-
 qga/qapi-schema.json             |   3 +-
 target-alpha/mem_helper.c        |   2 +-
 target-arm/cpu.h                 |   8 +--
 target-arm/helper.c              |   2 +-
 target-arm/translate.c           |   2 +-
 target-cris/cpu.h                |   2 +-
 target-cris/translate.c          |   6 +-
 target-i386/translate.c          |   1 -
 target-lm32/helper.c             |   2 +-
 target-microblaze/op_helper.c    |   1 -
 target-microblaze/translate.c    |   2 +-
 target-mips/helper.c             |   3 +-
 target-moxie/helper.c            |   3 +-
 target-moxie/translate.c         |   1 -
 target-ppc/translate_init.c      |   9 +--
 target-s390x/kvm.c               |   4 +-
 target-sh4/helper.c              |   7 +-
 target-sh4/op_helper.c           |   1 -
 target-tricore/helper.c          |   1 -
 tcg/ia64/tcg-target.c            |   2 +-
 tcg/tcg.c                        |   4 +-
 tests/bios-tables-test.c         |  36 ++++------
 tests/image-fuzzer/runner.py     |   2 +-
 tests/qemu-iotests/017.out       |   2 +-
 tests/qemu-iotests/018.out       |   2 +-
 tests/qemu-iotests/019.out       |   2 +-
 tests/qemu-iotests/020.out       |   2 +-
 tests/qemu-iotests/024.out       |   2 +-
 tests/qemu-iotests/028.out       |   4 +-
 tests/qemu-iotests/034.out       |   2 +-
 tests/qemu-iotests/037.out       |   2 +-
 tests/qemu-iotests/038.out       |   2 +-
 tests/qemu-iotests/039.out       |   2 +-
 tests/qemu-iotests/041           |   2 +-
 tests/qemu-iotests/043.out       |  12 ++--
 tests/qemu-iotests/046.out       |   2 +-
 tests/qemu-iotests/049.out       |  22 +++---
 tests/qemu-iotests/050.out       |   2 +-
 tests/qemu-iotests/051.out       |   2 +-
 tests/qemu-iotests/061.out       |  10 +--
 tests/qemu-iotests/069.out       |   2 +-
 tests/qemu-iotests/073.out       |   2 +-
 tests/qemu-iotests/079.out       |  18 ++---
 tests/qemu-iotests/082.out       |   4 +-
 tests/qemu-iotests/085.out       |  38 +++++-----
 tests/qemu-iotests/095.out       |   4 +-
 tests/qemu-iotests/097.out       |  16 ++---
 tests/qemu-iotests/098.out       |   8 +--
 tests/qemu-iotests/110.out       |   4 +-
 tests/qemu-iotests/112.out       |   4 +-
 tests/qemu-iotests/114.out       |   2 +-
 tests/qemu-iotests/115.out       |   2 +-
 tests/qemu-iotests/121.out       |   4 +-
 tests/qemu-iotests/122.out       |   6 +-
 tests/qemu-iotests/130.out       |   4 +-
 tests/qemu-iotests/common.filter |   2 +-
 tests/tcg/testthread.c           |   1 -
 tests/test-hbitmap.c             |   6 +-
 tests/test-xbzrle.c              |   2 -
 translate-all.c                  |   6 +-
 ui/spice-display.c               |  14 ++--
 util/bitmap.c                    |   2 +-
 util/qemu-option.c               |  29 +++++++-
 util/qemu-thread-posix.c         |   2 +-
 vl.c                             |   6 +-
 xen-mapcache.c                   |   6 +-
 165 files changed, 472 insertions(+), 649 deletions(-)

