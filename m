Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLXtM-0004Lg-Ms
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:31:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXtF-00047k-Fh
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:31:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXtA-0004Hy-8M
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:31:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLXsw-0004FE-4b; Sun, 24 Aug 2014 09:31:06 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 14640449BA;
	Sun, 24 Aug 2014 17:31:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B286D6B3;
	Sun, 24 Aug 2014 17:31:03 +0400 (MSK)
Received: (nullmailer pid 30070 invoked by uid 1000);
	Sun, 24 Aug 2014 13:31:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 24 Aug 2014 17:30:51 +0400
Message-Id: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/11] Trivial patches for 2014-08-24
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
X-List-Received-Date: Sun, 24 Aug 2014 13:31:31 -0000

This time, we've a bunch of trivial stuff all over, including a series fr=
om
zhanghailiang, some minor fixes from Stefan Weil and Peter Crosthwaite,
and also a bugfix for a rare device - vmxnet3 - reviewed by the author.

Please consider pulling/applying.

Thanks,

/mjt

The following changes since commit 33886ebeec0c0ff6253a49253fae0db44c9ed0=
f3:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into sta=
ging (2014-08-22 16:12:51 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-08-24

for you to fetch changes up to 40a87c6c9b11ef9c14e0301f76abf0eb2582f08e:

  vmxnet3: Pad short frames to minimum size (60 bytes) (2014-08-24 17:11:=
08 +0400)

----------------------------------------------------------------
trivial patches for 2014-08-24

----------------------------------------------------------------
Ben Draper (1):
      vmxnet3: Pad short frames to minimum size (60 bytes)

Liming Wang (1):
      configure: no need to mkdir QMP

Peter Crosthwaite (2):
      microblaze: ml605: Get rid of ddr_base variable
      dma: axidma: Variablise repeated s->streams[i] sub-expr

Stefan Weil (2):
      po: Fix Makefile rules for in-tree builds without configuration
      libdecnumber: Fix warnings from smatch (missing static, boolean ope=
rations)

zhanghailiang (5):
      util/path: Use the GLib memory allocation routines
      tcg: dump op count into qemu log
      tests/bios-tables-test: check the value returned by fopen()
      slirp/misc: Use the GLib memory allocation APIs
      linux-user: fix file descriptor leaks

 configure                           |    4 ----
 hw/dma/xilinx_axidma.c              |   10 ++++++----
 hw/microblaze/petalogix_ml605_mmu.c |    5 ++---
 hw/net/vmxnet3.c                    |   10 ++++++++++
 libdecnumber/decNumber.c            |   21 +++++++++++----------
 linux-user/syscall.c                |    1 +
 po/Makefile                         |    7 +++++--
 slirp/misc.c                        |   20 +++-----------------
 slirp/misc.h                        |    4 ----
 slirp/slirp_config.h                |    3 ---
 tcg/tcg.c                           |    6 ++----
 tests/bios-tables-test.c            |    5 +++++
 util/path.c                         |   10 +++++-----
 13 files changed, 50 insertions(+), 56 deletions(-)

