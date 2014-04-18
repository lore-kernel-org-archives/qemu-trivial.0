Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wb2VN-0001Gk-8e
	for mharc-qemu-trivial@gnu.org; Fri, 18 Apr 2014 02:42:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wb2VG-00015O-QQ
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 02:42:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wb2VB-0000eX-SV
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 02:42:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59028)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wb2V1-0000cd-5C; Fri, 18 Apr 2014 02:42:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2414341CE8;
	Fri, 18 Apr 2014 10:42:10 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 094EA204;
	Fri, 18 Apr 2014 10:42:10 +0400 (MSK)
Received: (nullmailer pid 241867 invoked by uid 1000);
	Fri, 18 Apr 2014 06:42:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 18 Apr 2014 10:42:08 +0400
Message-Id: <1397803329-241829-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL] Trivial patches for 2014-04-18
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
X-List-Received-Date: Fri, 18 Apr 2014 06:42:31 -0000

This is the same pull request as has been sent initially for 2.0
and which we didn't apply.  Except that this time, I fixed one more
"allows to" case which I overlooked in qemu-options.hx.

I'm not re-sending whole series again, as at has been sent previously,
will only re-send the changed patch as a reply to this message.

Please consider pulling.

The following changes since commit 2d03b49c3f225994c4b0b46146437d8c887d6774:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20140417-1' into staging (2014-04-17 21:37:26 +0100)

are available in the git repository at:


  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-04-18

for you to fetch changes up to b36dc67b95dedcece8757ec23bf42625a7ccda34:

  Fix grammar in comment (2014-04-18 10:33:36 +0400)

----------------------------------------------------------------
trivial patches for 2014-04-18

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
 qemu-options.hx          |    7 +-
 qga/commands-posix.c     |    2 +-
 qga/qapi-schema.json     |   14 ++--
 scripts/coverity-model.c |  183 ++++++++++++++++++++++++++++++++++++++++++++++
 vl.c                     |    2 +-
 xbzrle.c                 |    8 +-
 12 files changed, 212 insertions(+), 25 deletions(-)
 create mode 100644 scripts/coverity-model.c

