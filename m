Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk569-0005wA-3c
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:59:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk565-0005pl-JN
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:59:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk563-0004cD-3B
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:59:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk55y-0004WQ-26; Wed, 14 Sep 2016 03:59:02 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 148E44183E;
	Wed, 14 Sep 2016 10:58:58 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 939A9AAB;
	Wed, 14 Sep 2016 10:58:57 +0300 (MSK)
Received: (nullmailer pid 17310 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Wed, 14 Sep 2016 10:58:26 +0300
Message-Id: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/27] Trivial patches for 2016-09-14
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
X-List-Received-Date: Wed, 14 Sep 2016 07:59:11 -0000

This is a backlog of all trivial patches accumulated since Jul this year.
Not a huge amount for more than a month.

Please consider applying.

Thanks,

/mjt

The following changes since commit 507e4ddc3abf67391bcbc9624fd60b969c159b=
78:

  Merge remote-tracking branch 'remotes/mjt/tags/trivial-patches-fetch' i=
nto staging (2016-09-13 17:55:35 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to f3f1ef84774aef77d344b196dea2a09b244b87a1:

  mptsas: change .realize function name (2016-09-14 10:56:40 +0300)

----------------------------------------------------------------
trivial patches for 2016-09-14

----------------------------------------------------------------
Cao jin (4):
      timer: update comments
      cpus: rename local variable to meaningful one
      cpus: update comments
      mptsas: change .realize function name

Colin Lord (1):
      help: Update help to remove misleading display information

Eduardo Habkost (1):
      win32: don't run subprocess tests on Mingw32 platform

Ladi Prosek (1):
      Remove unused function declarations

Laurent Vivier (6):
      coccinelle: add a script to remove useless casts
      linux-user,s390x: remove useless cast
      s390x: remove useless cast
      tricore: remove useless cast
      fw_cfg: remove useless casts
      sheepdog: remove useless casts

Markus Armbruster (1):
      MAINTAINERS: Fix up F: entry bit rot

Md Haris Iqbal (1):
      linux-user/qemu.h: change malloc to g_malloc, free to g_free

Reda Sallahi (1):
      sh4: fix broken link to documentation

Stefano Dong (=E8=91=A3=E5=85=B4=E6=B0=B4) (1):
      ivshmem: Delete duplicate debug message

Thomas Huth (9):
      Remove remainders of HPPA backend
      tcg: Remove duplicate header includes
      ui/console: Fix non-working backspace key in monitor of gtk UI
      MAINTAINERS: Add include/hw/unicore32/ to UniCore32 section
      MAINTAINERS: Add include/hw/tricore/ to TriCore section
      MAINTAINERS: Add include/hw/sh4/ to SH4 section
      MAINTAINERS: Add include/sysemu/cpus.h
      MAINTAINERS: Fix wildcard for scsi headers
      MAINTAINERS: Add some header files to the PC chipset section

Tom=C3=A1=C5=A1 Golembiovsk=C3=BD (1):
      curl: Operate on zero-length file

 MAINTAINERS                       |   26 +-
 block/curl.c                      |   25 +-
 block/qcow2.h                     |    1 -
 block/sheepdog.c                  |    4 +-
 configure                         |    7 +-
 cpus.c                            |   13 +-
 disas.c                           |    2 -
 disas/Makefile.objs               |    1 -
 disas/hppa.c                      | 2832 -------------------------------=
------
 disas/sh4.c                       |    6 -
 hw/misc/ivshmem.c                 |    1 -
 hw/nvram/fw_cfg.c                 |    4 +-
 hw/ppc/ppc405.h                   |    6 -
 hw/s390x/sclp.c                   |    2 +-
 hw/s390x/virtio-ccw.h             |    1 -
 hw/scsi/mptsas.c                  |    4 +-
 hw/sh4/shix.c                     |    2 +-
 hw/tricore/tricore_testboard.c    |    2 +-
 include/block/block.h             |    6 -
 include/block/block_int.h         |    9 -
 include/hw/arm/pxa.h              |    1 -
 include/hw/bt.h                   |    2 -
 include/hw/i386/pc.h              |    2 -
 include/hw/pci-host/spapr.h       |    2 -
 include/hw/pci/pci_bridge.h       |    1 -
 include/hw/pci/pcie_port.h        |    1 -
 include/hw/ppc/ppc4xx.h           |    6 -
 include/hw/ppc/spapr.h            |    3 -
 include/hw/ppc/spapr_vio.h        |    4 -
 include/hw/scsi/scsi.h            |    1 -
 include/hw/virtio/virtio-bus.h    |    3 -
 include/migration/migration.h     |    2 -
 include/net/net.h                 |    2 -
 include/qemu/bitmap.h             |    4 -
 include/qemu/timer.h              |   19 +-
 include/qemu/uri.h                |    2 -
 include/sysemu/kvm.h              |    2 -
 include/ui/console.h              |    2 -
 include/ui/input.h                |    2 -
 include/ui/spice-display.h        |    2 -
 linux-user/qemu.h                 |    4 +-
 linux-user/signal.c               |    2 +-
 linux-user/syscall_defs.h         |    4 +-
 qemu-options.hx                   |   38 +-
 qemu-tech.texi                    |    3 +-
 scripts/coccinelle/typecast.cocci |    7 +
 target-alpha/cpu.h                |    1 -
 target-m68k/cpu.h                 |    1 -
 target-ppc/cpu.h                  |    2 -
 target-ppc/mmu-hash64.h           |    1 -
 target-s390x/cpu.h                |    2 -
 target-sh4/README.sh4             |    2 +-
 tcg/tcg.c                         |    2 -
 tcg/tcg.h                         |    2 -
 tcg/tci/README                    |    2 +-
 ui/console.c                      |    1 +
 56 files changed, 93 insertions(+), 2998 deletions(-)
 delete mode 100644 disas/hppa.c
 create mode 100644 scripts/coccinelle/typecast.cocci

