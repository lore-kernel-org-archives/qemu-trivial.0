Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNDl-00047z-5G
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:02:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47159)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNDc-0003sK-U2
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNDX-00018h-Vl
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:02:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNDM-00015i-Ez; Mon, 05 May 2014 14:02:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EDAE340708;
	Mon,  5 May 2014 22:02:05 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id AB0D0661;
	Mon,  5 May 2014 22:02:05 +0400 (MSK)
Received: (nullmailer pid 24207 invoked by uid 1000);
	Mon, 05 May 2014 18:02:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:41 +0400
Message-Id: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/22] Trivial patches for 2014-05-05
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
X-List-Received-Date: Mon, 05 May 2014 18:02:30 -0000

Here's another pull request for trival patches.
This time, it includes:

 - many cleanups from Stefan Weil, mostly adding `static' attrs
 - some more trivial patches from glib cleanups, by me and Stefan Hajnocz=
i
 - some more trivial changes for libcacard, from me and Alon Levy
 - small fixes from Chen Gang (debug) and Peter Maydell (tests)
 - little makefile cleanups and configure fix from me
 - documentation fixes from Fam Zheng
 - and some more random things

All are little things here and there, just how -trivial tree should reall=
y be.

Please consider pulling.

Thanks,

/mjt

The following changes since commit fdaad4715ae9e998fd0595bedfb16fdaf0c68c=
cc:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-201=
40501' into staging (2014-05-02 11:32:00 +0100)

are available in the git repository at:


  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-05-05

for you to fetch changes up to bbaa4cda7e0f6da97d46cb80ef83d2eb65b3eaf4:

  libcacard: remove unnecessary EOL from debug prints (2014-05-05 21:56:3=
6 +0400)

----------------------------------------------------------------
trivial patches for 2014-05-05

----------------------------------------------------------------
Alon Levy (1):
      libcacard: remove unnecessary EOL from debug prints

Chen Gang (1):
      arch_init: Be sure of only one exit entry with DPRINTF() for ram_lo=
ad()

Fam Zheng (1):
      docs/memory.txt: Fix document on MMIO operations

Hani Benhabiles (1):
      readline: Sort completions before printing them.

Jim Meyering (1):
      xen: remove unused global, xen_xcg

Michael Tokarev (6):
      Makefiles: convert some obj-specific CFLAGS to use new foo.o-cflags=
 syntax
      configure: remove bashism
      do not call g_thread_init() for glib >=3D 2.31
      libcacard: replace pstrcpy() with memcpy()
      qmp: report path ambiguity error
      readline: use g_strndup instead of open-coding it

Peter Maydell (1):
      tests/tcg: Fix compilation of test_path

Stefan Hajnoczi (1):
      glib: move g_poll() replacement into glib-compat.h

Stefan Weil (9):
      qga: Fix typo (plural) in comment
      hw/9pfs: Add missing 'static' attributes
      hw/mips: Add missing 'static' and 'const' attributes
      hw/s390x: Add missing 'static' attribute
      monitor: Add missing 'static' attribute
      ui: Add missing 'static' attribute
      qemu-timer: Add missing 'static' attribute
      hw: Add missing 'static' attributes
      hw/9pfs: Add include file for exported symbol

 Makefile                   |    6 ------
 Makefile.objs              |    2 ++
 arch_init.c                |   12 ++++++++----
 audio/Makefile.objs        |    2 +-
 backends/Makefile.objs     |    2 +-
 configure                  |    2 +-
 coroutine-gthread.c        |    7 ++-----
 disas/Makefile.objs        |    2 +-
 docs/memory.txt            |   10 +++++-----
 hw/9pfs/virtio-9p-local.c  |    1 +
 hw/9pfs/virtio-9p-synth.c  |    2 +-
 hw/core/qdev.c             |    4 ++--
 hw/mips/mips_fulong2e.c    |    2 +-
 hw/net/cadence_gem.c       |    2 +-
 hw/net/vmxnet3.c           |    6 +++---
 hw/net/xgmac.c             |    2 +-
 hw/ppc/spapr_iommu.c       |    2 +-
 hw/ppc/spapr_rtas.c        |    2 +-
 hw/s390x/event-facility.c  |    2 +-
 hw/scsi/scsi-bus.c         |    2 +-
 hw/xen/xen_backend.c       |    1 -
 include/exec/memory.h      |    2 +-
 include/glib-compat.h      |   12 ++++++++++++
 include/qemu-common.h      |   12 ------------
 libcacard/vcard_emul_nss.c |    3 ++-
 libcacard/vreader.c        |    4 ++--
 monitor.c                  |    2 +-
 qemu-timer.c               |    2 +-
 qga/main.c                 |    2 +-
 qmp.c                      |    6 +++++-
 tests/tcg/Makefile         |    2 --
 tests/tcg/test_path.c      |    7 -------
 ui/Makefile.objs           |    2 +-
 ui/console.c               |    2 +-
 util/osdep.c               |   21 +++++++++------------
 util/readline.c            |   11 ++++++++---
 36 files changed, 79 insertions(+), 84 deletions(-)

