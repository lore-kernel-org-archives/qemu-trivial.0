Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vl22K-0008Db-T7
	for mharc-qemu-trivial@gnu.org; Mon, 25 Nov 2013 14:41:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vl22E-00082b-HP
	for qemu-trivial@nongnu.org; Mon, 25 Nov 2013 14:41:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vl229-00064n-E6
	for qemu-trivial@nongnu.org; Mon, 25 Nov 2013 14:41:30 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43271)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vl21z-0005xx-51; Mon, 25 Nov 2013 14:41:15 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3358343346;
	Mon, 25 Nov 2013 23:41:07 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 13F9F207;
	Mon, 25 Nov 2013 23:41:07 +0400 (MSK)
Received: (nullmailer pid 13224 invoked by uid 1000);
	Mon, 25 Nov 2013 19:41:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Mon, 25 Nov 2013 23:41:03 +0400
Message-Id: <1385408466-13183-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL For-1.7 0/3] Trivial patches for 2013-11-25
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
X-List-Received-Date: Mon, 25 Nov 2013 19:41:35 -0000

Here are a few remaining bits from the trivial patches queue.
Paolo already picked some so this time the queue is smaller than usual.

Please pull.

The following changes since commit c0caec178eadbbac4c672110c3914313091e05=
88:

  Merge remote-tracking branch 'mst/tags/for_anthony' into staging (2013-=
11-25 09:49:43 -0800)

are available in the git repository at:


  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to a63ac076d7fc4c99632ad25a9c658b25e4f6ce32:

  .gitignore: Ignore config.status (2013-11-25 23:33:21 +0400)

----------------------------------------------------------------
Fam Zheng (1):
      .gitignore: Ignore config.status

Stefan Weil (2):
      qobject: Fix compiler warning (missing gnu_printf format attribute)
      acpi-build: Fix compiler warning (missing gnu_printf format attribu=
te)

 .gitignore           |    1 +
 hw/i386/acpi-build.c |    5 +++--
 qobject/qerror.c     |    4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

