Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4C5D-0000xm-MM
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:33:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4C59-0000ri-T5
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4C58-00021V-TB
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:33:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4C53-0001w1-Qw; Mon, 16 Oct 2017 16:33:46 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B74BC40D0A;
	Mon, 16 Oct 2017 23:33:42 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DBB07AF8;
	Mon, 16 Oct 2017 23:33:42 +0300 (MSK)
Received: (nullmailer pid 12308 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 23:33:27 +0300
Message-Id: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/14] Trivial patches for 2017-10-16
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
X-List-Received-Date: Mon, 16 Oct 2017 20:33:52 -0000

Here's a set of trivial changes accumulated so far.
Not including large series by Philippe Mathieu-Daud=C3=A9.

The following changes since commit c5bbcaa4b7c0f8a322bebe9ec563560178a68b=
55:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2017-10-16 17:29:16 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to 6b4f250bfc529bdf73a10ca6873a460175e666cc:

  Add myself as maintainer for TPM code (2017-10-16 23:17:44 +0300)

----------------------------------------------------------------
trivial patches for 2017-10-16

----------------------------------------------------------------
Anthony PERARD (1):
      ui/gtk: Fix deprecation of vte_terminal_copy_clipboard

Carlo Marcelo Arenas Bel=C3=B3n (2):
      linux-user: remove duplicate break in syscall
      gitignore: ignore check-qlit test

Eduardo Otubo (1):
      filter-mirror: segfault when specifying non existent device

Emilio G. Cota (1):
      futex: add missing header guards

Fam Zheng (3):
      MAINTAINERS: Clean up SCSI device section
      MAINTAINERS: Fix Sun4v file
      MAINTAINERS: Track default-configs/pci.mak

Marco A L Barbosa (1):
      linux-user: Add some random ioctls

Markus Armbruster (1):
      os-posix: Drop misleading comment

Michael Tokarev (1):
      qemu-doc.texi: remove trailing whitespace

Peter Maydell (1):
      include/hw/or-irq.h: Drop unused in_irqs field

Stefan Berger (1):
      Add myself as maintainer for TPM code

Stefan Weil (1):
      io: Add missing GCC_FMT_ATTR (fix -Werror=3Dsuggest-attribute=3Dfor=
mat)

 MAINTAINERS               | 13 +++++--------
 include/hw/or-irq.h       |  1 -
 include/qemu/futex.h      |  5 +++++
 io/channel-websock.c      |  7 ++++---
 linux-user/ioctls.h       |  5 +++++
 linux-user/syscall.c      |  2 +-
 linux-user/syscall_defs.h |  7 +++++++
 net/filter-mirror.c       |  6 ++++++
 os-posix.c                |  1 -
 qemu-doc.texi             |  2 +-
 tests/.gitignore          |  1 +
 ui/gtk.c                  |  5 +++++
 12 files changed, 40 insertions(+), 15 deletions(-)

