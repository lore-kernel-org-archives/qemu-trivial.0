Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnSo-0002XD-7y
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 04:58:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnSi-0002Pn-Eo
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:58:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnSg-0007rx-C7
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:58:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnSZ-0007gG-SZ; Sat, 08 Oct 2016 04:58:24 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BD26B40EB7;
	Sat,  8 Oct 2016 11:58:14 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id EE7CFB26;
	Sat,  8 Oct 2016 11:58:13 +0300 (MSK)
Received: (nullmailer pid 19220 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Sat,  8 Oct 2016 11:57:46 +0300
Message-Id: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/26] Trivial patches for 2016-10-08
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
X-List-Received-Date: Sat, 08 Oct 2016 08:58:37 -0000

Hi.

Here's another trivial tree pull request.  Really trivial stuff
all over, and many changes to MAINTAINERS file from Thomas Huth.

Please consider applying.

Thanks,

/mjt

The following changes since commit 48f592118ab42f83a1a7561c4bfd2b72a100f2=
41:

  bsd-user: fix FreeBSD build after d148d90e (2016-10-07 15:17:53 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to 52cfcb464255b4da5115408e2a6ce3327bbcb9df:

  net/filter-mirror: Fix mirror initial check typo (2016-10-08 11:25:29 +=
0300)

----------------------------------------------------------------
trivial patches for 2016-10-08

----------------------------------------------------------------
Chen Fan (1):
      virtio: rename the bar index field name in VirtIOPCIProxy

Daniel P. Berrange (1):
      char: fix missing return in error path for chardev TLS init

David Anderson (1):
      qapi: make the json schema files more regular.

Eric Blake (1):
      tests: Ignore test executables

Felix Janda (1):
      linux-user: include <poll.h> instead of <sys/poll.h>

Greg Ungerer (1):
      m68k: change default system clock for m5208evb

Jonathan Neusch=C3=A4fer (1):
      CODING_STYLE: Fix a typo ("have" vs. "has")

Li Qiang (1):
      usb: ehci: fix memory leak in ehci_process_itd

Lin Ma (1):
      maint: Add module_block.h to .gitignore

Marc-Andr=C3=A9 Lureau (2):
      exec: remove unused compacted argument
      build-sys: fix find-in-path

Paolo Bonzini (1):
      bt-hci-csr: drop unused argument

Stefan Hajnoczi (1):
      qemu-options.hx: fix -chardev ringbuf typos

Thomas Huth (11):
      MAINTAINERS: Add files to the Moxie section.
      MAINTAINERS: Add some more files to the HMP section
      MAINTAINERS: Add include/hw/audio/ to audio section
      MAINTAINERS: Add some SPARC machine related files
      MAINTAINERS: Add some more files to the virtio section
      MAINTAINERS: Add header files to CRIS section
      MAINTAINERS: Add some more rocker related files
      MAINTAINERS: Add some more pattern to recognize all win32 related f=
iles
      MAINTAINERS: Add usermode related config files
      MAINTAINERS: Add some more MIPS related files
      MAINTAINERS: Some updates related to the SH4 machines

Wei Yang (1):
      bitmap: refine and move BITMAP_{FIRST/LAST}_WORD_MASK

Zhang Chen (1):
      net/filter-mirror: Fix mirror initial check typo

 .gitignore              |  1 +
 CODING_STYLE            |  2 +-
 MAINTAINERS             | 38 +++++++++++++++++++++++++++++++++-----
 exec.c                  |  8 +++-----
 hw/arm/nseries.c        |  3 +--
 hw/bt/hci-csr.c         |  2 +-
 hw/display/virtio-vga.c |  4 ++--
 hw/m68k/mcf5208.c       |  2 +-
 hw/usb/hcd-ehci.c       |  1 +
 hw/virtio/virtio-pci.c  | 20 ++++++++++----------
 hw/virtio/virtio-pci.h  |  8 ++++----
 include/hw/bt.h         |  2 +-
 include/qemu/bitmap.h   |  7 ++-----
 linux-user/syscall.c    |  2 +-
 net/filter-mirror.c     |  4 ++--
 qapi-schema.json        |  3 +--
 qapi/block-core.json    |  5 -----
 qemu-char.c             |  1 +
 qemu-options.hx         |  2 +-
 rules.mak               |  2 +-
 tests/.gitignore        |  2 ++
 util/bitmap.c           |  2 --
 22 files changed, 70 insertions(+), 51 deletions(-)

