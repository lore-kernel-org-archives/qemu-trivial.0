Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wi5Fy-0000RR-Ij
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2014 13:03:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wi5Fr-0000II-Ct
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 13:03:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wi5Fm-0001RR-F1
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 13:03:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44699)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wi5Fc-0001Pn-2Y; Wed, 07 May 2014 13:03:24 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A00F940AB0;
	Wed,  7 May 2014 21:03:22 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 89B59674;
	Wed,  7 May 2014 21:03:22 +0400 (MSK)
Received: (nullmailer pid 22589 invoked by uid 1000);
	Wed, 07 May 2014 17:03:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  7 May 2014 21:03:22 +0400
Message-Id: <1399482202-22544-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/21] Trivial patches for 2014-05-07
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
X-List-Received-Date: Wed, 07 May 2014 17:03:44 -0000

Another pull request for trivial patches.  It is the same as previous
(2014-05-05) but without the problematic Makefile patch.

So I'm not resending all the individual patches, as they're the same.

Thanks,

/mjt

The following changes since commit 8d1dc5d188b84a2b2aeb9bd39fddb3d2c67be6=
0c:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20140507' into =
staging (2014-05-07 16:06:38 +0100)

are available in the git repository at:


  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-05-07

for you to fetch changes up to 8e25c274ae5830cf879fa5d2d7f98f4d6f5aecfa:

  libcacard: remove unnecessary EOL from debug prints (2014-05-07 21:00:4=
4 +0400)

----------------------------------------------------------------
trivial patches for 2014-05-07

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

Michael Tokarev (5):
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

 arch_init.c                |   12 ++++++++----
 configure                  |    2 +-
 coroutine-gthread.c        |    7 ++-----
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
 ui/console.c               |    2 +-
 util/osdep.c               |   21 +++++++++------------
 util/readline.c            |   11 ++++++++---
 30 files changed, 73 insertions(+), 74 deletions(-)

