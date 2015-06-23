Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7Rtt-0005To-Fm
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 13:22:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z7Rtr-0005OY-DF
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:22:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z7Rtn-0001Y8-Dx
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:22:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38103)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z7Rtc-0001Uc-GG; Tue, 23 Jun 2015 13:22:04 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7033442051;
	Tue, 23 Jun 2015 20:22:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 62692951;
	Tue, 23 Jun 2015 20:22:03 +0300 (MSK)
Received: (nullmailer pid 14724 invoked by uid 1000);
	Tue, 23 Jun 2015 17:22:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jun 2015 20:22:00 +0300
Message-Id: <cover.1435079841.git.mjt@msgid.tls.msk.ru>
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
X-List-Received-Date: Tue, 23 Jun 2015 17:22:20 -0000

This is a repeat of previous pull request
(2015-06-22) but with 2 changes:

1) patch 21 util-qemu-sockets-improve-ai_flag-hints-for-ipv6-hos.patch
   has new change:

+#ifndef AI_V4MAPPED
+# define AI_V4MAPPED 0
+#endif

so that it wont fail on systems where AI_V4MAPPED is not defined.

2) patch 12 configure-rearrange-help-and-consolidate-enable-disa.patch
   rebased on top of 9dacf32d2cbd6 "qemu-ga: Building Windows MSI install=
ation",
   incorporating --enable-guest-agent-msi option.

Resending only the 2 changed patches, the rest is the same
as in previous pull request.  So expect only 12/21 and 21/21
patches in reply to this email.

Please consider pulling/applying.

Thanks,

/mjt

The following changes since commit 6966b2a07190004e18ede33ce50a65009b36f3=
a6:

  Merge remote-tracking branch 'remotes/kraxel/tags/pull-input-20150623-1=
' into staging (2015-06-23 13:32:50 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-06-23

for you to fetch changes up to 2bf6b5e90b4226d67c05fadbe105265b4c8e39ea:

  util/qemu-sockets: improve ai_flag hints for ipv6 hosts (2015-06-23 19:=
59:39 +0300)

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

