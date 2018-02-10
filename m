Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekQ0M-0002lF-Qr
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 02:55:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ0I-0002fv-Ha
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:55:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ0H-0000iR-8c
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:55:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46521)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekQ0B-0000dB-EV; Sat, 10 Feb 2018 02:55:15 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EBB2A40C4E;
	Sat, 10 Feb 2018 10:55:13 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0CC4B758;
	Sat, 10 Feb 2018 10:55:15 +0300 (MSK)
Received: (nullmailer pid 22784 invoked by uid 1000);
	Sat, 10 Feb 2018 07:55:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Sat, 10 Feb 2018 10:54:55 +0300
Message-Id: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/17] Trivial patches for 2018-02-10
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
X-List-Received-Date: Sat, 10 Feb 2018 07:55:23 -0000

Here's a next pull request for the trivial-patches tree.
After a very long delay.

Hopefully I still remember how to apply patches :)

The following changes since commit c7b02d7d032d6022060e4b393827c963c93ce6=
3f:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-travis-speedup-=
090218-1' into staging (2018-02-09 16:12:34 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to d40d74a645feea0ad01482da2358804f6574dce0:

  tests/qapi: use ARRAY_SIZE macro (2018-02-10 10:45:14 +0300)

----------------------------------------------------------------
trivial patches for 2018-02-10

----------------------------------------------------------------
Alexey Kardashevskiy (2):
      machine: Polish -machine xxx,help
      configure: Allow capstone=3Dgit only if git update is not disabled

Andreas Gustafsson (1):
      oslib-posix: check for posix_memalign in configure script

Cole Robinson (1):
      scripts/make-release: Don't archive .git files

Daniel P. Berrang=C3=A9 (1):
      mailmap: set preferred spelling for Daniel Berrang=C3=A9

Eric Blake (2):
      Drop unneeded system header includes
      maint: Mention web site maintenance in README

Laurent Vivier (1):
      build: fix typo in error message

Michael Tokarev (2):
      qapi-schema.json: spelling (independant comparation)
      scripts/argparse.py: spelling (independant)

Philippe Mathieu-Daud=C3=A9 (5):
      qga: use ARRAY_SIZE macro
      async: use ARRAY_SIZE macro
      tests/hbitmap: use ARRAY_SIZE macro
      tests/qapi: use QEMU_IS_ALIGNED macro
      tests/qapi: use ARRAY_SIZE macro

Thomas Huth (2):
      qemu-options.hx: Remove confusing spaces in parameter listings
      MAINTAINERS: Add qemu-binfmt-conf.sh script

 .mailmap                            |  4 ++++
 MAINTAINERS                         |  1 +
 README                              |  4 ++++
 configure                           | 21 +++++++++++++++-
 hw/core/machine.c                   |  2 +-
 qapi-schema.json                    |  4 ++--
 qemu-options.hx                     | 48 ++++++++++++++++++-------------=
------
 qga/commands-posix.c                |  2 +-
 scripts/argparse.py                 |  2 +-
 scripts/git-submodule.sh            |  2 +-
 scripts/make-release                |  5 ++--
 target/i386/hax-windows.h           |  2 --
 target/i386/hvf/x86_mmu.c           |  1 -
 tests/test-hbitmap.c                |  6 ++---
 tests/test-qobject-output-visitor.c |  2 +-
 tests/test-string-output-visitor.c  |  2 +-
 util/aio-posix.c                    |  2 +-
 util/oslib-posix.c                  |  2 +-
 18 files changed, 68 insertions(+), 44 deletions(-)

