Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXQ6B-0008RI-Jl
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 03:05:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQ5n-0007n6-QE
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:05:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQ5i-0001ke-Sc
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:05:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56749)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXQ5N-0001Lw-4w; Tue, 08 Apr 2014 03:04:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A154940E28;
	Tue,  8 Apr 2014 11:04:12 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8E6C9661;
	Tue,  8 Apr 2014 11:04:12 +0400 (MSK)
Received: (nullmailer pid 10561 invoked by uid 1000);
	Tue, 08 Apr 2014 07:04:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  8 Apr 2014 11:04:00 +0400
Message-Id: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL for-2.0 00/11] Trivial patches for 2014-04-08
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
X-List-Received-Date: Tue, 08 Apr 2014 07:05:30 -0000

This is the last-minute trivial-patches tree.  We're very close to
release now, and here are mostly doc/comment/identation fixes which
are safe even at this stage of the release process.  There's also
addition of the coverity model which does not affect code in any way.

And there's a series of 3 patches by Peter Maydell which adds casts
to uint* in a few places.  Those are also quite simple and safe, even
with quite some disagreement about whenever this is necessary to
start with -- I mean the int128 change, the other changes are good.
At least this way we make it consistent with other parts of the code.

Please consider pulling/applying.

Thanks,

/mjt

The following changes since commit 466e6e9d13d56bbb6da1d2396d7d6347df483af0:

  target-i386: reorder fields in cpu/msr_hyperv_hypercall subsection (2014-04-05 10:49:05 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-04-08

for you to fetch changes up to cd791dd1090680dba795940fe5ef80699102ae0b:

  Fix grammar in comment (2014-04-08 10:56:10 +0400)

----------------------------------------------------------------
trivial patches for 2014-04-08

----------------------------------------------------------------
Amos Kong (1):
      qga: trivial fix for unclear documentation of guest-set-time

Chen Gang (1):
      vl: Report accelerator not supported for target more nicely

Hani Benhabiles (1):
      net: Report error when device / hub combo is not found.

Michael Tokarev (1):
      doc: grammify "allows to"

Paolo Bonzini (1):
      scripts: add sample model file for Coverity Scan

Peter Maydell (4):
      configure: Fix indentation of help for --enable/disable-debug-info
      hw/ide/ahci.c: Avoid shift left into sign bit
      int128.h: Avoid undefined behaviours involving signed arithmetic
      xbzrle.c: Avoid undefined behaviour with signed arithmetic

Stefan Weil (2):
      configure: Remove redundant message for -Werror
      Fix grammar in comment

 configure                |    5 +-
 hw/i2c/smbus_eeprom.c    |    2 +-
 hw/ide/ahci.c            |    4 +-
 include/qemu/int128.h    |    4 +-
 net/net.c                |    4 +-
 qemu-doc.texi            |    2 +-
 qemu-options.hx          |    5 +-
 qga/commands-posix.c     |    2 +-
 qga/qapi-schema.json     |   14 ++--
 scripts/coverity-model.c |  183 ++++++++++++++++++++++++++++++++++++++++++++++
 vl.c                     |    2 +-
 xbzrle.c                 |    8 +-
 12 files changed, 211 insertions(+), 24 deletions(-)
 create mode 100644 scripts/coverity-model.c

