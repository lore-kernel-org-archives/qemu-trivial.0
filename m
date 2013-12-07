Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpMfa-00088O-AL
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 13:32:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VpMfT-0007w2-Pp
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 13:32:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VpMfO-0004tB-V3
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 13:31:55 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VpMfB-0004oa-EW; Sat, 07 Dec 2013 13:31:37 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 385C140CDB;
	Sat,  7 Dec 2013 22:31:36 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2006052D;
	Sat,  7 Dec 2013 22:31:36 +0400 (MSK)
Received: (nullmailer pid 10009 invoked by uid 1000);
	Sat, 07 Dec 2013 18:31:36 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat,  7 Dec 2013 22:31:33 +0400
Message-Id: <1386441094-9971-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL urgent] Trivial patches for 2013-12-07
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
X-List-Received-Date: Sat, 07 Dec 2013 18:32:01 -0000

We have a regression introduced by one of previous trivial patches,
here's a (one-line) fix for it.  Please consider applying/pulling
at earliest opportunity, since it fixes a build problem when
CONFIG_QXL is enabled.

Thanks,

/mjt

The following changes since commit d2aa90cda81ae3f860dd047ce5e37e0473452d54:

  Merge remote-tracking branch 'awilliam/tags/vfio-pci-for-qemu-20131206.0' into staging (2013-12-07 07:47:24 -0800)

are available in the git repository at:


  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to b1829cdebe2c5cc0b445f2959dbdb63a48118b12:

  qxl: Add missing trace.h (fix broken build) (2013-12-07 22:26:07 +0400)

----------------------------------------------------------------
Stefan Weil (1):
      qxl: Add missing trace.h (fix broken build)

 hw/display/qxl-render.c |    1 +
 1 file changed, 1 insertion(+)



