Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKvp6-0005Q1-By
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 15:48:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvoy-0005Cv-U1
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:48:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvou-0006j0-AG
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:47:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46497)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKvok-0006cC-Pf; Sat, 14 Sep 2013 15:47:42 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0FE4B4114E;
	Sat, 14 Sep 2013 23:47:42 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DFE104C3;
	Sat, 14 Sep 2013 23:47:41 +0400 (MSK)
Received: (nullmailer pid 7686 invoked by uid 1000);
	Sat, 14 Sep 2013 19:47:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sat, 14 Sep 2013 23:47:26 +0400
Message-Id: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 00/15] trivial patches for 2013-09-14
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
X-List-Received-Date: Sat, 14 Sep 2013 19:48:01 -0000

Just a bit late but here's the next trivial-patches pull request.

Thanks,

/mjt

The following changes since commit 2d1fe1873a984d1c2c89ffa3d12949cafc7185=
51:

  Merge remote-tracking branch 'pmaydell/tags/pull-target-arm-20130910' i=
nto staging (2013-09-11 14:46:52 -0500)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to f47873f7d5a67ec8c5411abec9786beb8f691a46:

  configure: Enable extra compiler warnings (2013-09-14 23:42:44 +0400)

----------------------------------------------------------------
Anthony PERARD (1):
      docs: Fix IO port number for CPU present bitmap.

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

Stefan Weil (7):
      *-user: Fix typo in comment (ulocking -> unlocking)
      translate-all: Fix formatting of dump output
      MAINTAINERS: Add missing entry to filelist for TCI target
      *-user: Improve documentation for lock_user function
      tci: Fix qemu-alpha on 32 bit hosts (wrong assertions)
      Makefile: Remove some more files when cleaning
      configure: Enable extra compiler warnings

Tobias Markus (1):
      target-i386: Fix segment cache dump

 MAINTAINERS                     |    1 +
 Makefile                        |    4 +++-
 bsd-user/qemu.h                 |    6 +++---
 configure                       |   14 +++++++++-----
 docs/specs/acpi_cpu_hotplug.txt |    2 +-
 hw/pci-host/q35.c               |    2 +-
 include/hw/pci-host/q35.h       |    2 +-
 libcacard/vscclient.c           |    3 +--
 linux-user/qemu.h               |    6 +++---
 target-i386/helper.c            |    4 +++-
 tcg/sparc/tcg-target.h          |    2 +-
 tci.c                           |   12 ------------
 trace-events                    |    3 +--
 translate-all.c                 |    5 +++--
 util/iov.c                      |   10 ++++------
 15 files changed, 35 insertions(+), 41 deletions(-)

