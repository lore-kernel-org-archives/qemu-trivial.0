Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWOz-0004hD-0Y
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:06:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWOw-0004af-38
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:06:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWOr-0004nC-3S
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:06:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48164)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWOh-0004kJ-GF; Thu, 19 Mar 2015 05:05:47 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8D66D41E3E;
	Thu, 19 Mar 2015 12:05:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6478491C;
	Thu, 19 Mar 2015 12:05:44 +0300 (MSK)
Received: (nullmailer pid 320 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:18 +0300
Message-Id: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/24] Trivial patches for 2015-03-19
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
X-List-Received-Date: Thu, 19 Mar 2015 09:06:03 -0000

Here's another trivial-patches pull request, it comes very close to
the release because I was too busy last 2 weeks to do anything useful
with the trivial-patches queue, and because it accumulated quite a few
patches since that.

Here, there are many code defects fixes found by coverity and sparse,
mostly from Stefan Weil, and also from Gonglei and Shannon Zhao.  There
are a few other bits and pieces, all look quite harmless.  And a few
more interesting changes:

 - smbios: add max speed comdline option for type-17 (meory device) struc=
ture
   by Gabriel L. Somlo

 - configure: enable kvm on x32 by Michael Tokarev

 - error: Replace error_report() & error_free() with error_report_err()
   by zhanghailiang

These aren't completely trivial, but again, should not have much impact,
and has been in the queue for quite some time too.

Please consider applying.

I omited a few other patches sent to -trivial for now, partly to speed up
processing of other patches, partly because some patches better wait for
2.4, and partly because some patches, in my opinion, needs one or another
work.  I'll post comments about these as replies to individual patches
posted.

Thanks,

/mjt

The following changes since commit cd232acfa0d70002fed89e9293f04afda577a5=
13:

  Update version for v2.3.0-rc0 release (2015-03-17 18:58:33 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-03-19

for you to fetch changes up to 8ce1ee4618f4a557959f5a5731f6726b30416df5:

  qga/commands-posix: Fix resource leak (2015-03-19 11:39:18 +0300)

----------------------------------------------------------------
trivial patches for 2015-03-19

----------------------------------------------------------------
Gabriel L. Somlo (1):
      smbios: add max speed comdline option for type-17 (meory device) st=
ructure

Gonglei (1):
      arm: fix memory leak

John Snow (1):
      qtest/ahci: Fix a bit mask expression

Markus Armbruster (3):
      hmp: Fix definition of command quit
      qmp: Drop unused .user_print from command definitions
      hmp: Fix texinfo documentation

Michael Tokarev (2):
      cris: remove unused cris_cond15 declarations
      configure: enable kvm on x32

Paolo Bonzini (1):
      vl: fix resource leak with monitor_fdset_add_fd

Paulo Vital (1):
      pc-dimm: Add description for device list.

Shannon Zhao (1):
      qga/commands-posix: Fix resource leak

Stefan Weil (11):
      backends: Fix warning from Sparse
      9pfs: Fix warnings from Sparse
      omap: Fix warnings from Sparse
      arm/nseries: Fix warnings from Sparse
      target-mips: Fix warning from Sparse
      qom: Fix warning from Sparse
      Fix remaining warnings from Sparse (void return)
      block/qapi: Fix Sparse warning
      target-moxie: Fix warnings from Sparse (one-bit signed bitfield)
      elf-loader: Fix truncation warning from coverity
      elf-loader: Add missing error handling for call of lseek

Viswesh (1):
      Fix typos in comments

zhanghailiang (1):
      error: Replace error_report() & error_free() with error_report_err(=
)

 backends/tpm.c              |  2 +-
 block/qapi.c                |  2 +-
 configure                   |  4 ++-
 disas/cris.c                | 13 +--------
 fsdev/virtfs-proxy-helper.c |  2 +-
 hmp-commands.hx             | 42 +++++++++++------------------
 hw/9pfs/virtio-9p-handle.c  |  4 +--
 hw/9pfs/virtio-9p-local.c   |  4 +--
 hw/9pfs/virtio-9p-proxy.c   |  4 +--
 hw/9pfs/virtio-9p.c         |  3 ++-
 hw/arm/digic_boards.c       |  1 +
 hw/arm/highbank.c           |  1 +
 hw/arm/nseries.c            |  4 +--
 hw/arm/omap1.c              | 65 ++++++++++++++++++++++++++++++---------=
------
 hw/arm/omap2.c              | 12 ++++++---
 hw/arm/vexpress.c           |  3 ++-
 hw/arm/virt.c               |  5 ++--
 hw/char/omap_uart.c         |  3 ++-
 hw/core/loader.c            |  2 +-
 hw/display/omap_dss.c       | 15 +++++++----
 hw/display/vga.c            |  2 +-
 hw/dma/omap_dma.c           |  8 +++---
 hw/gpio/omap_gpio.c         |  3 ++-
 hw/i386/smbios.c            | 10 +++++--
 hw/intc/arm_gic.c           |  3 ++-
 hw/intc/etraxfs_pic.c       |  8 +++---
 hw/mem/pc-dimm.c            |  1 +
 hw/misc/omap_gpmc.c         |  3 ++-
 hw/misc/omap_l4.c           |  3 ++-
 hw/misc/omap_sdrc.c         |  3 ++-
 hw/misc/omap_tap.c          |  3 ++-
 hw/nvram/fw_cfg.c           |  2 +-
 hw/sd/omap_mmc.c            |  3 ++-
 hw/ssi/omap_spi.c           |  3 ++-
 hw/timer/a9gtimer.c         |  2 +-
 hw/timer/omap_gptimer.c     |  2 +-
 hw/tpm/tpm_tis.c            |  2 +-
 hw/usb/hcd-musb.c           | 20 +++++++-------
 include/hw/elf_ops.h        |  4 ++-
 include/qom/cpu.h           |  2 +-
 monitor.c                   |  8 +++---
 qemu-options.hx             |  4 +--
 qga/commands-posix.c        |  1 +
 qmp-commands.hx             |  4 ---
 qom/cpu.c                   |  2 +-
 savevm.c                    |  3 +--
 target-cris/opcode-cris.h   | 10 -------
 target-mips/dsp_helper.c    |  2 +-
 target-moxie/mmu.h          | 10 +++----
 target-tricore/translate.c  | 22 +++++++--------
 tests/ahci-test.c           |  2 +-
 vl.c                        |  6 +++--
 52 files changed, 191 insertions(+), 161 deletions(-)

