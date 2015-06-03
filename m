Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08Pv-0008Lr-RC
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:09:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Pt-0008GK-0v
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:09:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Pn-00052t-2K
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:09:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08Pd-0004uA-EF; Wed, 03 Jun 2015 09:08:53 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4741C40787;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3597BA4F;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: (nullmailer pid 27411 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:20 +0300
Message-Id: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/30] Trivial patches for 2015-06-03
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
X-List-Received-Date: Wed, 03 Jun 2015 13:09:10 -0000

Here's another trivial-patches pull request.

There are many patches in there this time, mostly due to
work by Shannon Zhao, who has been busy chasing memory
leaks all over the place.  I haven't applied _all_ of
his patches yes, there's one series pending with more
complex patches around qemu_allocate_irqs(), these
needs some more review.

There's also a fix for CVE-2015-4037 (predictable
directory name in slirp smb code).

Please consider applying/pulling.

Thanks,

/mjt

The following changes since commit 42d58e7c6760cb9c55627c28ae538e27dcf2f1=
44:

  Merge remote-tracking branch 'remotes/sstabellini/tags/xen-15-06-02-tag=
' into staging (2015-06-02 16:47:31 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-06-03

for you to fetch changes up to de3852877f1e452321352fdb7e678f079876a41b:

  configure: postfix --extra-cflags to QEMU_CFLAGS (2015-06-03 16:04:39 +=
0300)

----------------------------------------------------------------
trivial patches for 2015-06-03

----------------------------------------------------------------
Alex Benn=C3=A9e (1):
      configure: postfix --extra-cflags to QEMU_CFLAGS

Chen Hanxiao (1):
      docs/writing-qmp-commands: fix a typo

Dr. David Alan Gilbert (1):
      Add -incoming help text

Fam Zheng (1):
      iscsi: Remove pointless runtime check of macro value

Michael Tokarev (1):
      slirp: use less predictable directory name in /tmp for smb config (=
CVE-2015-4037)

Paolo Bonzini (1):
      translate-all: delete prototype for non-existent function

Peter Crosthwaite (2):
      microblaze: cpu: Delete MMAP_SHIFT definition
      device-tree: Make a common-obj

Peter Krempa (1):
      util: socket: Add missing localaddr and localport option for DGRAM =
socket

Sai Pavan Boddu (1):
      cadence_gem: Fix Rx buffer size field mask

Shannon Zhao (20):
      hw/i386/pc_piix: Fix memory leak
      hw/ide/pci: Fix memory leak
      hw/i386/acpi-build: decref after use
      vl: fix memory leak spotted by valgrind
      hw/alpha/dp264.c: Fix memory leak spotted by valgrind
      hw/ppc/e500.c: Fix memory leak
      hw/arm/omap_sx1.c: Fix memory leak spotted by valgrind
      hw/intc/exynos4210_gic.c: Fix memory leak by adjusting order
      hw/i386/pc: Fix misusing qemu_allocate_irqs for single irq
      hw/isa/lpc_ich9.c: Fix misusing qemu_allocate_irqs for single irq
      hw/isa/i82378.c: Fix misusing qemu_allocate_irqs for single irq
      hw/timer/arm_timer.c: Fix misusing qemu_allocate_irqs for single ir=
q
      hw/sparc/sun4m.c: Fix misusing qemu_allocate_irqs for single irq
      hw/ppc/prep.c: Fix misusing qemu_allocate_irqs for single irq
      hw/lm32/lm32_boards.c: Fix misusing qemu_allocate_irqs for single i=
rq
      hw/lm32/milkymist.c: Fix misusing qemu_allocate_irqs for single irq
      hw/unicore32/puv3.c: Fix misusing qemu_allocate_irqs for single irq
      hw/alpha/typhoon.c: Fix misusing qemu_allocate_irqs for single irq
      hw/arm/nseries.c: Fix misusing qemu_allocate_irqs for single irq
      hw/display/tc6393xb.c: Fix misusing qemu_allocate_irqs for single i=
rq

 Makefile.objs                 |  2 ++
 Makefile.target               |  1 -
 block/iscsi.c                 |  7 -------
 configure                     |  2 +-
 device_tree.c                 |  1 -
 docs/writing-qmp-commands.txt |  2 +-
 hw/alpha/dp264.c              |  7 ++++---
 hw/alpha/typhoon.c            |  8 ++++----
 hw/arm/nseries.c              |  5 ++---
 hw/arm/omap_sx1.c             |  2 +-
 hw/display/tc6393xb.c         |  2 +-
 hw/i386/acpi-build.c          |  1 +
 hw/i386/pc.c                  |  4 ++--
 hw/i386/pc_piix.c             | 11 +++++------
 hw/i386/pc_q35.c              |  4 +---
 hw/ide/pci.c                  |  5 +----
 hw/intc/exynos4210_gic.c      |  7 +++----
 hw/isa/i82378.c               |  7 ++-----
 hw/isa/lpc_ich9.c             |  5 +----
 hw/lm32/lm32_boards.c         | 10 ++++------
 hw/lm32/milkymist.c           |  5 ++---
 hw/net/cadence_gem.c          |  2 +-
 hw/ppc/e500.c                 |  1 +
 hw/ppc/prep.c                 |  5 ++---
 hw/sparc/sun4m.c              |  6 ++----
 hw/timer/arm_timer.c          |  6 ++----
 hw/unicore32/puv3.c           |  8 ++++----
 include/hw/i386/pc.h          |  2 +-
 net/slirp.c                   |  7 +++----
 qemu-options.hx               |  9 ++++++++-
 target-microblaze/cpu.h       |  1 -
 translate-all.h               |  1 -
 util/qemu-sockets.c           |  6 ++++++
 vl.c                          |  5 +++--
 34 files changed, 71 insertions(+), 86 deletions(-)

