Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoU6w-00073J-5J
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 03:44:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UoU6u-00071U-Q9
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:44:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UoU6t-0005RY-ST
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:44:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32919)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UoU6r-0005Qk-Ca; Mon, 17 Jun 2013 03:44:17 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 08E51418F9;
	Mon, 17 Jun 2013 11:44:16 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 31D5051B; Mon, 17 Jun 2013 11:44:15 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Mon, 17 Jun 2013 11:44:08 +0400
Message-Id: <1371455050-9523-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial/urgent 0/2] trivial-patches
	out-of-order pull request for 2013-06-17
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
X-List-Received-Date: Mon, 17 Jun 2013 07:44:21 -0000

There were two bugs introduced in last changes which went through
trivial patches queue last week.  I already sent you two versions
of a fix for one issue (compile breakage with --disable-sdl), and
there's another one, serial crash.  Sending as a pull request too,
these should be applied ASAP as people are hitting the same issues
again and again.

Thanks,

/mjt

The following changes since commit 90a2541b763b31d2b551b07e24aae3de5266d31b:

  target-i386: fix over 80 chars warnings (2013-06-15 17:50:38 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to f6d0923f8bc859d6bd9fac09d8df8c6db8a7b299:

  fixed a copy&paste error in serial.c (2013-06-17 11:38:55 +0400)

----------------------------------------------------------------
Michael Tokarev (1):
      vl: always define no_frame

Vladimir Senkov (1):
      fixed a copy&paste error in serial.c

 hw/char/serial.c |    2 +-
 vl.c             |    2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

