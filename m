Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V06iv-0005fq-2r
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2013 05:11:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V06it-0005cI-Ci
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 05:11:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V06is-00029f-4O
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 05:11:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V06il-00023q-5A; Fri, 19 Jul 2013 05:11:27 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EDDF241D7F;
	Fri, 19 Jul 2013 13:11:16 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 478AA1D8; Fri, 19 Jul 2013 13:11:15 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 19 Jul 2013 13:11:08 +0400
Message-Id: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 0/5] trivial patches for 2013-07-19
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
X-List-Received-Date: Fri, 19 Jul 2013 09:11:36 -0000

This is another trivial-patches pull request.  This time
we have just 5 patches accumulated in two (!) weeks period.
Please consider apply.

/mjt

The following changes since commit 24943978cbe79634a9a8b02a20efb25b29b3ab49:

  boot-order-test: Add tests for Sun4u (2013-07-18 13:27:47 -0500)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to be022d61f4938bb051e8af8e6cb470ec1602c488:

  doc: monitor multiplexing rewording (2013-07-19 12:52:03 +0400)

----------------------------------------------------------------
Cole Robinson (1):
      Fix command example in qemu.sasl

Ed Maste (1):
      block/m25p80: Update Micron entries

Michael Tokarev (2):
      slirp: remove mbuf(m_hdr,m_dat) indirection
      doc: monitor multiplexing rewording

Petar Jovanovic (1):
      linux-user: declare sys_futex to have 6 arguments

 hw/block/m25p80.c |   12 ++++++++----
 linux-user/main.c |    2 +-
 qemu-options.hx   |    4 ++--
 qemu.sasl         |    2 +-
 slirp/mbuf.h      |   51 ++++++++++++++++++---------------------------------
 slirp/tcp_subr.c  |   12 ++++++------
 6 files changed, 36 insertions(+), 47 deletions(-)


