Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN42X-0005Ox-Nx
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 12:58:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN42S-0005Gb-M9
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 12:58:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN42N-0000Ic-W8
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 12:58:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33108)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN42B-0000EE-9V; Fri, 20 Sep 2013 12:58:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B975D419BE;
	Fri, 20 Sep 2013 20:58:20 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 93C6020A;
	Fri, 20 Sep 2013 20:58:20 +0400 (MSK)
Received: (nullmailer pid 32159 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:57:59 +0400
Message-Id: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 00/17] Trivial patches for 2013-09-20
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
X-List-Received-Date: Fri, 20 Sep 2013 16:58:45 -0000

Here is another trivial-patches pull request, which includes patches
from previous week (with fixes for build failures -- one patch fixed
and one removed) plus a few more patches accumulated during this week.

Please pull.

Thanks,

/mjt

The following changes since commit 6c2679fc19560699679200fb42ab4659bcbe7f=
79:

  Merge remote-tracking branch 'kiszka/queues/slirp' into staging (2013-0=
9-17 10:01:24 -0500)

are available in the git repository at:


  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to 7a1c0d200f3ca5be48f7034c6ed5458e490f8816:

  tests/.gitignore: ignore test-throttle (2013-09-20 20:15:33 +0400)

----------------------------------------------------------------
Anthony PERARD (1):
      docs: Fix IO port number for CPU present bitmap.

Fam Zheng (1):
      tests/.gitignore: ignore test-throttle

Markus Armbruster (1):
      trace-events: Clean up with scripts/cleanup-trace-events.pl again

Michael Tokarev (2):
      vscclient: remove unnecessary use of uninitialized variable
      iov: avoid "orig_len may be used unitialized" warning

Michal Privoznik (1):
      configure: Undefine _FORTIFY_SOURCE prior using it

Richard Henderson (1):
      tcg-sparc: Fix parenthesis warning

Richard W.M. Jones (1):
      q35: Fix typo in constant DEFUALT -> DEFAULT.

Stefan Weil (8):
      *-user: Fix typo in comment (ulocking -> unlocking)
      translate-all: Fix formatting of dump output
      MAINTAINERS: Add missing entry to filelist for TCI target
      *-user: Improve documentation for lock_user function
      tci: Fix qemu-alpha on 32 bit hosts (wrong assertions)
      Makefile: Remove some more files when cleaning
      kvm: Fix compiler warning (clang)
      exec: Fix broken build for MinGW (regression)

Tobias Markus (1):
      target-i386: Fix segment cache dump

 MAINTAINERS                     |    1 +
 Makefile                        |    4 +++-
 bsd-user/qemu.h                 |    6 +++---
 configure                       |    2 +-
 docs/specs/acpi_cpu_hotplug.txt |    2 +-
 exec.c                          |    2 ++
 hw/i386/kvm/clock.c             |    2 +-
 hw/pci-host/q35.c               |    2 +-
 include/hw/pci-host/q35.h       |    2 +-
 libcacard/vscclient.c           |    3 +--
 linux-user/qemu.h               |    6 +++---
 target-i386/helper.c            |    4 +++-
 tcg/sparc/tcg-target.h          |    2 +-
 tci.c                           |   12 ------------
 tests/.gitignore                |    1 +
 trace-events                    |    3 +--
 translate-all.c                 |    5 +++--
 util/iov.c                      |   10 ++++------
 18 files changed, 31 insertions(+), 38 deletions(-)

