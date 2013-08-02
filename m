Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5GEX-00017c-Ec
	for mharc-qemu-trivial@gnu.org; Fri, 02 Aug 2013 10:21:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5GEQ-0000uD-UD
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:21:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5GEL-0007I0-Pi
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:21:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34034)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V5GEB-0007FA-IL; Fri, 02 Aug 2013 10:21:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E6C4340422;
	Fri,  2 Aug 2013 18:21:08 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 85CC14A2;
	Fri,  2 Aug 2013 18:21:08 +0400 (MSK)
Received: (nullmailer pid 7219 invoked by uid 1000);
	Fri, 02 Aug 2013 14:21:07 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri,  2 Aug 2013 18:20:44 +0400
Message-Id: <1375453248-7178-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 0/4] trivial patches for 2013-08-02
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
X-List-Received-Date: Fri, 02 Aug 2013 14:21:32 -0000

The following changes since commit 2ddc463725d0fa24e0910fba77fef2777fa94a=
74:

  Merge remote-tracking branch 'afaerber/tags/qom-cpu-for-anthony' into s=
taging (2013-08-01 17:09:35 -0500)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to 8e50724313895a87057cc243ad805f2eb21feb9f:

  vmdk: fix comment for vmdk_co_write_zeroes (2013-08-02 18:07:04 +0400)

----------------------------------------------------------------
Fam Zheng (1):
      vmdk: fix comment for vmdk_co_write_zeroes

Michael S. Tsirkin (1):
      memory.c: drop kvm.h dependency

Michael Tokarev (1):
      qemu-ga: build it even if !system

Richard W.M. Jones (1):
      block/iscsi.c: Fix printf format error.

 block/iscsi.c |    4 +++-
 block/vmdk.c  |    8 ++++++--
 configure     |   11 ++++++++---
 memory.c      |    1 -
 4 files changed, 17 insertions(+), 7 deletions(-)


