Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkten-0004RY-EV
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:58:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bkteg-0004LL-05
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktea-0007wh-KI
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:58:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bkteP-0007ie-He; Fri, 16 Sep 2016 09:57:57 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3624472875;
	Fri, 16 Sep 2016 13:56:20 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHk2024127; Fri, 16 Sep 2016 09:56:18 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
Date: Fri, 16 Sep 2016 15:55:51 +0200
Message-Id: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 16 Sep 2016 13:56:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 00/26] trivial: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 13:58:19 -0000

This series is the result of coccinelle patch
scripts/coccinelle/exit.cocci
provided by the first patch of the series.

It replaces exit(0) by exit(EXIT_SUCCESS)
and exit(1) by exit(EXIT_FAILURE).

All other exit() are not modified as we don't want
to change the behavior.

In some cases, I've added manually a line break to comply
with the maximum line length.

Laurent Vivier (26):
  coccinelle: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  arm: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  cris: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  block: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  ppc: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  graphics: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  tests: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  replay: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  qemu-user: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  m68k: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  pci,virtio: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  sparc: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  sh4: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  x86: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  mips: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  s390: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  tcg: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  posix: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  alpha: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  common: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  misc machine: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  blockdev: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  core: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  error,trace: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  hw: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)
  net: use exit(EXIT_SUCCESS) and exit(EXIT_FAILURE)

 accel.c                                     |   2 +-
 arch_init.c                                 |   6 +-
 bootdevice.c                                |   2 +-
 bsd-user/main.c                             |  20 +--
 contrib/ivshmem-server/main.c               |  12 +-
 cpus.c                                      |  16 +-
 cputlb.c                                    |   2 +-
 device_tree.c                               |  18 +-
 exec.c                                      |   2 +-
 gdbstub.c                                   |   2 +-
 hw/9pfs/9p.c                                |   2 +-
 hw/alpha/dp264.c                            |   8 +-
 hw/arm/armv7m.c                             |   6 +-
 hw/arm/boot.c                               |  16 +-
 hw/arm/cubieboard.c                         |   8 +-
 hw/arm/digic_boards.c                       |   6 +-
 hw/arm/fsl-imx6.c                           |   2 +-
 hw/arm/gumstix.c                            |   8 +-
 hw/arm/highbank.c                           |   4 +-
 hw/arm/integratorcp.c                       |   2 +-
 hw/arm/mainstone.c                          |   4 +-
 hw/arm/musicpal.c                           |   4 +-
 hw/arm/omap1.c                              |   4 +-
 hw/arm/omap2.c                              |   4 +-
 hw/arm/omap_sx1.c                           |   2 +-
 hw/arm/palm.c                               |   2 +-
 hw/arm/pxa2xx.c                             |  10 +-
 hw/arm/raspi.c                              |   4 +-
 hw/arm/realview.c                           |   2 +-
 hw/arm/sabrelite.c                          |   4 +-
 hw/arm/strongarm.c                          |   4 +-
 hw/arm/sysbus-fdt.c                         |   2 +-
 hw/arm/versatilepb.c                        |   2 +-
 hw/arm/vexpress.c                           |  16 +-
 hw/arm/virt.c                               |  24 +--
 hw/arm/xlnx-ep108.c                         |   4 +-
 hw/arm/z2.c                                 |   4 +-
 hw/block/pflash_cfi01.c                     |   2 +-
 hw/block/tc58128.c                          |   2 +-
 hw/block/virtio-blk.c                       |   6 +-
 hw/char/exynos4210_uart.c                   |   4 +-
 hw/core/machine.c                           |   2 +-
 hw/core/platform-bus.c                      |   4 +-
 hw/core/qdev.c                              |   2 +-
 hw/cris/axis_dev88.c                        |   2 +-
 hw/cris/boot.c                              |   4 +-
 hw/display/pl110.c                          |   2 +-
 hw/display/pxa2xx_lcd.c                     |   2 +-
 hw/display/ssd0303.c                        |   3 +-
 hw/gpio/pl061.c                             |   3 +-
 hw/i2c/smbus.c                              |   3 +-
 hw/i386/intel_iommu.c                       |   2 +-
 hw/i386/multiboot.c                         |  10 +-
 hw/i386/pc.c                                |  24 +--
 hw/i386/pc_piix.c                           |   2 +-
 hw/i386/pc_sysfw.c                          |   6 +-
 hw/i386/x86-iommu.c                         |   2 +-
 hw/ide/core.c                               |   2 +-
 hw/intc/ioapic.c                            |   2 +-
 hw/intc/xics_kvm.c                          |   6 +-
 hw/lm32/lm32_boards.c                       |   8 +-
 hw/lm32/milkymist.c                         |   6 +-
 hw/m68k/an5206.c                            |   6 +-
 hw/m68k/dummy_m68k.c                        |   4 +-
 hw/m68k/mcf5208.c                           |   8 +-
 hw/mips/mips_fulong2e.c                     |  12 +-
 hw/mips/mips_jazz.c                         |  10 +-
 hw/mips/mips_malta.c                        |  20 +--
 hw/mips/mips_mipssim.c                      |  10 +-
 hw/mips/mips_r4k.c                          |  10 +-
 hw/moxie/moxiesim.c                         |   8 +-
 hw/net/stellaris_enet.c                     |   3 +-
 hw/net/virtio-net.c                         |  10 +-
 hw/nvram/eeprom93xx.c                       |   2 +-
 hw/nvram/fw_cfg.c                           |   2 +-
 hw/openrisc/openrisc_sim.c                  |   4 +-
 hw/pci-host/bonito.c                        |   2 +-
 hw/pci/pci.c                                |  12 +-
 hw/ppc/e500.c                               |  14 +-
 hw/ppc/mac_newworld.c                       |  12 +-
 hw/ppc/mac_oldworld.c                       |  16 +-
 hw/ppc/mpc8544ds.c                          |   2 +-
 hw/ppc/ppc.c                                |   4 +-
 hw/ppc/ppc405_boards.c                      |  16 +-
 hw/ppc/ppc440_bamboo.c                      |  10 +-
 hw/ppc/ppc4xx_devs.c                        |   2 +-
 hw/ppc/prep.c                               |  12 +-
 hw/ppc/spapr.c                              |  52 +++---
 hw/ppc/virtex_ml507.c                       |   4 +-
 hw/scsi/lsi53c895a.c                        |   7 +-
 hw/scsi/vhost-scsi.c                        |   4 +-
 hw/scsi/virtio-scsi-dataplane.c             |   2 +-
 hw/scsi/virtio-scsi.c                       |   6 +-
 hw/sd/omap_mmc.c                            |   4 +-
 hw/sd/ssi-sd.c                              |   3 +-
 hw/sh4/r2d.c                                |   6 +-
 hw/sh4/shix.c                               |   4 +-
 hw/smbios/smbios.c                          |  22 +--
 hw/sparc/leon3.c                            |  12 +-
 hw/sparc/sun4m.c                            |  22 +--
 hw/sparc64/sun4u.c                          |   8 +-
 hw/ssi/pl022.c                              |   3 +-
 hw/tricore/tricore_testboard.c              |   4 +-
 hw/unicore32/puv3.c                         |   6 +-
 hw/virtio/virtio.c                          |  28 +--
 hw/watchdog/watchdog.c                      |   2 +-
 hw/xenpv/xen_machine_pv.c                   |   8 +-
 kvm-all.c                                   |   8 +-
 linux-user/main.c                           |   4 +-
 linux-user/syscall.c                        |   2 +-
 net/net.c                                   |   4 +-
 numa.c                                      |  12 +-
 os-posix.c                                  |  34 ++--
 qemu-char.c                                 |   6 +-
 qemu-img.c                                  |   4 +-
 qemu-io.c                                   |  24 +--
 qemu-nbd.c                                  |   6 +-
 replay/replay-char.c                        |   6 +-
 replay/replay-events.c                      |   6 +-
 replay/replay-internal.c                    |   2 +-
 replay/replay-time.c                        |   2 +-
 replay/replay.c                             |  14 +-
 scripts/coccinelle/exit.cocci               |  12 ++
 slirp/misc.c                                |   2 +-
 target-arm/kvm.c                            |   2 +-
 target-arm/machine.c                        |   2 +-
 target-i386/kvm.c                           |   8 +-
 target-i386/machine.c                       |   2 +-
 target-ppc/kvm.c                            |   6 +-
 target-ppc/translate.c                      |   2 +-
 target-ppc/translate_init.c                 |  28 +--
 target-s390x/cpu.c                          |   2 +-
 target-s390x/kvm.c                          |  18 +-
 target-s390x/mmu_helper.c                   |   2 +-
 tcg/ppc/tcg-target.inc.c                    |   6 +-
 tcg/tcg.c                                   |   2 +-
 tests/ipmi-bt-test.c                        |   6 +-
 tests/libqtest.c                            |   8 +-
 tests/migration/stress.c                    |   4 +-
 tests/qht-bench.c                           |   2 +-
 tests/rcutorture.c                          |   4 +-
 tests/tcg/cris/check_gcctorture_pr28634-1.c |   2 +-
 tests/tcg/cris/check_gcctorture_pr28634.c   |   2 +-
 tests/tcg/cris/check_glibc_kernelversion.c  |   2 +-
 tests/tcg/cris/check_hello.c                |   2 +-
 tests/tcg/cris/check_lz.c                   |   2 +-
 tests/tcg/cris/check_mapbrk.c               |   6 +-
 tests/tcg/cris/check_mmap1.c                |   2 +-
 tests/tcg/cris/check_mmap2.c                |   2 +-
 tests/tcg/cris/check_mmap3.c                |   2 +-
 tests/tcg/cris/check_openpf5.c              |   2 +-
 tests/tcg/cris/check_stat1.c                |   2 +-
 tests/tcg/cris/check_stat2.c                |   2 +-
 tests/tcg/cris/check_stat3.c                |   2 +-
 tests/tcg/cris/check_stat4.c                |   2 +-
 tests/tcg/cris/check_time1.c                |   2 +-
 tests/tcg/cris/check_time2.c                |   2 +-
 tests/tcg/cris/sys.c                        |   2 +-
 tests/tcg/hello-i386.c                      |   2 +-
 tests/tcg/linux-test.c                      |   4 +-
 tests/tcg/runcom.c                          |  12 +-
 tests/tcg/test_path.c                       |   2 +-
 tests/test-aio.c                            |   2 +-
 tests/test-iov.c                            |   8 +-
 tests/test-thread-pool.c                    |   2 +-
 tests/vhost-user-bridge.c                   |  18 +-
 trace/control.c                             |  10 +-
 translate-all.c                             |   2 +-
 ui/console-gl.c                             |   2 +-
 ui/console.c                                |   2 +-
 ui/curses.c                                 |   4 +-
 ui/gtk.c                                    |   2 +-
 ui/sdl.c                                    |   8 +-
 ui/sdl2.c                                   |   2 +-
 ui/spice-core.c                             |  22 +--
 ui/vnc.c                                    |   4 +-
 util/error.c                                |   2 +-
 util/oslib-posix.c                          |   2 +-
 util/qemu-timer-common.c                    |   2 +-
 vl.c                                        | 270 ++++++++++++++--------------
 xen-common.c                                |   4 +-
 xen-hvm.c                                   |   2 +-
 182 files changed, 734 insertions(+), 715 deletions(-)
 create mode 100644 scripts/coccinelle/exit.cocci

-- 
2.5.5


