Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7Rwi-0000sL-5G
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 13:25:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z7Rwf-0000o1-9p
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:25:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z7Rwe-00037o-7w
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:25:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59889)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z7RwY-00032b-Km; Tue, 23 Jun 2015 13:25:06 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1088A42051;
	Tue, 23 Jun 2015 20:25:06 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id EE78C951;
	Tue, 23 Jun 2015 20:25:05 +0300 (MSK)
Received: (nullmailer pid 15741 invoked by uid 1000);
	Tue, 23 Jun 2015 17:25:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jun 2015 20:25:04 +0300
Message-Id: <cover.1435080226.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/21] Trivial patches for 2015-06-23
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
X-List-Received-Date: Tue, 23 Jun 2015 17:25:14 -0000

..and another, with a typo fix with rebasing of the configure --help
changes (missing space) :)

/mjt

The following changes since commit 6966b2a07190004e18ede33ce50a65009b36f3=
a6:

  Merge remote-tracking branch 'remotes/kraxel/tags/pull-input-20150623-1=
' into staging (2015-06-23 13:32:50 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-06-23

for you to fetch changes up to 3de3d698d942d1116152417f882c897b26b44e41:

  util/qemu-sockets: improve ai_flag hints for ipv6 hosts (2015-06-23 20:=
23:39 +0300)

----------------------------------------------------------------
trivial patches for 2015-06-23

----------------------------------------------------------------
Alberto Garcia (1):
      throttle: Fix typo in the documentation of block_set_io_throttle

Alex Benn=C3=A9e (1):
      configure: append --extra-ldflags to LDFLAGS

Dr. David Alan Gilbert (2):
      Grammar: 'as to'->'as for'
      Print error when failing to load PCI config data

Fam Zheng (2):
      Makefile: Fix "make cscope TAGS"
      Makefile: Add "make ctags"

Frediano Ziglio (1):
      hw/display/qxl-logger.c: Constify some variable

Gonglei (6):
      pci-assign: QOMify
      piix: piix3 QOMify
      piix4: QOMify
      wdt_i6300esb: QOMify
      xen_pt: QOMify
      vt82c686: QOMify

Markus Armbruster (2):
      qemu-options: Improve -global documentation
      qemu-options: Use @itemx where appropriate

Michael Tokarev (3):
      remove libdecnumber/dpd/decimal128Local.h
      libcacard: pkgconfig: tidy dependent libs
      configure: rearrange --help and consolidate enable/disable together

Shannon Zhao (2):
      hw/display/cg3.c: Fix memory leak
      hw/display/tcx.c: Fix memory leak

Wolfgang Bumiller (1):
      util/qemu-sockets: improve ai_flag hints for ipv6 hosts

 Makefile                           |  20 +++-
 configure                          | 201 ++++++++++++++-----------------=
------
 hw/display/cg3.c                   |   1 +
 hw/display/qxl-logger.c            |  16 +--
 hw/display/tcx.c                   |   1 +
 hw/i386/kvm/pci-assign.c           |  39 +++----
 hw/isa/piix4.c                     |   8 +-
 hw/isa/vt82c686.c                  |  47 ++++++---
 hw/pci-host/piix.c                 |  57 ++++++-----
 hw/pci/pci.c                       |   4 +
 hw/watchdog/wdt_i6300esb.c         |  14 ++-
 hw/xen/xen_pt.c                    |  10 +-
 hw/xen/xen_pt.h                    |   4 +
 libcacard/libcacard.pc.in          |   2 +-
 libdecnumber/dpd/decimal128Local.h |  42 --------
 qapi/block-core.json               |   2 +-
 qemu-options.hx                    |  57 +++++------
 qmp-commands.hx                    |   2 +-
 util/qemu-sockets.c                |   9 +-
 19 files changed, 251 insertions(+), 285 deletions(-)
 delete mode 100644 libdecnumber/dpd/decimal128Local.h

