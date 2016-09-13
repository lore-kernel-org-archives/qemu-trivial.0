Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqFP-0000L4-VK
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:07:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqFL-0000Hi-CJ
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:07:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqFH-0003uq-87
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:07:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53205)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqF7-0003JH-Gm; Tue, 13 Sep 2016 12:07:29 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 624E2416D8;
	Tue, 13 Sep 2016 19:07:19 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 30245AFB;
	Tue, 13 Sep 2016 19:07:18 +0300 (MSK)
Received: (nullmailer pid 31823 invoked by uid 1000);
	Tue, 13 Sep 2016 16:04:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Tue, 13 Sep 2016 19:04:39 +0300
Message-Id: <cover.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/16] Trivial patches for 2016-09-13
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
X-List-Received-Date: Tue, 13 Sep 2016 16:07:47 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello.  After quite some delay, I'm sening pull request for
the trivial-patches tree for patches which has been in the
tree since before version 2.7.  I planned to send the pull
request before, but had no good internet access during whole
August (while being at vacation).

Please note this pull request tag is signed with my new gpg
subkey (while main gpg key is the same): old key has been
revoked due to some risk of it being compromised.

Also I had to reinstall my machine from scratch, and redo
all the scripts, so this pull request might look a bit
different from all previous ones.  In particular, I now
use single (signed) fixed tag instead of tagging each pull
request with its own date-based tag.

Thanks,

/mjt

The following changes since commit fa9701240951093907076db0943f96972a396e=
f5:

  Merge remote-tracking branch 'remotes/kraxel/tags/pull-vga-20160913-1' =
into staging (2016-09-13 13:56:35 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to eb83c2030aa037b4c6037bfa3cbe181343dc6a8b:

  hw/net/e1000e: Fix compiler warning (2016-09-13 18:12:34 +0300)

- ----------------------------------------------------------------
trivial patches for 2016-09-13

- ----------------------------------------------------------------
Alberto Garcia (1):
      docs: Fix description of the leaky bucket algorithm in throttle.txt

Bruce Rogers (1):
      pic: fix typo in error message: KVM_GET_IRQCHIP -> KVM_SET_IRQCHIP

Cao jin (3):
      timer.h: fix typo
      timer.h: fix inconsistency between comment and function prototype
      timer/cpus: fix some typos and update some comments

Changlong Xie (1):
      hw/net/e1000e: Fix compiler warning

Eric Blake (1):
      maint: Ignore generated version file

Laurent Vivier (2):
      linux-user, trivial: display "0x%x" instead of "0x%d"
      trace-event: display "%d" instead of "0x%d"

Michael Tokarev (3):
      hw/bt/hci: spelling fix: endianness
      hw/dma/omap: spelling fix: endianness
      arm: spelling fix: mismatch

Paolo Bonzini (2):
      vl: remove unnecessary duplicate call to tpm_cleanup
      target-m68k: fix get_mac_extf helper

Samuel Thibault (1):
      Document that curses usually needs -k option too

Thomas Huth (1):
      sparc: Use g_memdup() instead of g_new0() + memcpy()

 .gitignore           |  2 ++
 cpus.c               |  6 +++---
 docs/throttle.txt    |  5 ++++-
 hw/bt/hci.c          |  2 +-
 hw/dma/omap_dma.c    |  2 +-
 hw/i386/kvm/i8259.c  |  2 +-
 hw/i386/trace-events |  2 +-
 hw/net/e1000e_core.c |  2 +-
 include/qemu/timer.h | 25 +++++++++++++++----------
 linux-user/main.c    |  2 +-
 qemu-options.hx      |  2 +-
 target-arm/helper.c  |  2 +-
 target-m68k/helper.c |  2 +-
 target-sparc/cpu.c   |  3 +--
 vl.c                 |  3 ---
 15 files changed, 34 insertions(+), 28 deletions(-)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEbBAEBCAAGBQJX2CL7AAoJEHAbT2saaT5Z8SMH+L3PiFazAtvDnHYKcB4z3Urm
zj3L+K3NabcJx3KuOWZv8bIgwKY9ZdmrH3+obRv0v2KoKoIDhNDS8D3MzQzTT3h+
avAkELoaGojyRDKAUZ+2L8Zaze4TksTI7nWvETzA5ZuzEWpMsEYJ0OACA4RwHrDW
61JW/0sRo7SHHB4ZmDQ2+ispBbmFCGFrsua63eup/xq62EDj/1dTZNigtLql4IiF
hOqveCgac7ZDJXrglsRu2t/4e6tmO0r4fNleOKICArJQnALvbWmiWNT/5NeFnwUK
u52tyI1OgX7aBWQV+DyrmMIC/m5dTGtiPBCzCgSxV1SStVxccqZ/HFqUDDLq2g=3D=3D
=3D/N+i
-----END PGP SIGNATURE-----

