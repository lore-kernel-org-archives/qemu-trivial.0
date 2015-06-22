Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6ziZ-0008Aw-Vl
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:16:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6ziW-00085u-9K
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6ziV-0002ue-5V
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:16:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6ziQ-0002s0-Gp; Mon, 22 Jun 2015 07:16:38 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 07E9F41E41;
	Mon, 22 Jun 2015 14:16:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id EC4DFA50;
	Mon, 22 Jun 2015 14:16:29 +0300 (MSK)
Received: (nullmailer pid 9236 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:07 +0300
Message-Id: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/21] Trivial patches for 2015-06-22
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
X-List-Received-Date: Mon, 22 Jun 2015 11:16:46 -0000

There are a few random thing here and there.  I especially
want to note 2 of them:

 - QOMification series by Gonglei
 - rearrangement of ./configure --help output by me

Other than that, the stuff is really trivial.

Please consider applying/pulling.

/mjt

The following changes since commit ad7020a7e7b27d468ecc2aacb04ba4eb090170=
74:

  target-microblaze: Remove dead code (2015-06-21 17:20:16 +1000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-06-22

for you to fetch changes up to 43ce995c79c09595e6fbdcabecd1c8b43cf9e4a4:

  util/qemu-sockets: improve ai_flag hints for ipv6 hosts (2015-06-22 14:=
08:25 +0300)

----------------------------------------------------------------
trivial patches for 2015-06-22

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
 configure                          | 198 ++++++++++++++-----------------=
------
 hw/display/cg3.c                   |   1 +
 hw/display/qxl-logger.c            |  16 +--
 hw/display/tcx.c                   |   1 +
 hw/i386/kvm/pci-assign.c           |  39 ++++----
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
 util/qemu-sockets.c                |   6 +-
 19 files changed, 247 insertions(+), 283 deletions(-)
 delete mode 100644 libdecnumber/dpd/decimal128Local.h

