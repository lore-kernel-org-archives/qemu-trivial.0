Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsdFC-0001AL-H4
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 14:18:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdF7-0000z9-Dy
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:17:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdF5-00058R-CA
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:17:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32784)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UsdEz-000553-Hl; Fri, 28 Jun 2013 14:17:49 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D1BF742B0C;
	Fri, 28 Jun 2013 22:17:46 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id DD4A156B; Fri, 28 Jun 2013 22:17:45 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 28 Jun 2013 22:17:31 +0400
Message-Id: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 00/14] Trivial patches for 2013-06-28
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
X-List-Received-Date: Fri, 28 Jun 2013 18:17:59 -0000

Hello.  There's a next week trivial-patches pull request.
Most of the changes this time come from Gerd, with his
single series of bugfixes for sockets and char code, plus
one trivial patch from me.

Please pull.

Thanks,

/mjt

The following changes since commit 36125631e79d53ffb9365740f43f386e2171d116:

  Merge remote-tracking branch 'kwolf/for-anthony' into staging (2013-06-28 10:37:34 -0500)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to a8ad4159ed7d8a442a9c049a6fd0d47aa330c2aa:

  doc: we use seabios, not bochs bios (2013-06-28 22:10:34 +0400)

----------------------------------------------------------------
Gerd Hoffmann (13):
      qemu-socket: zero-initialize SocketAddress
      qemu-socket: drop pointless allocation
      qemu-socket: catch monitor_get_fd failures
      qemu-char: check optional fields using has_*
      qemu-char: use more specific error_setg_* variants
      qemu-char: print notification to stderr
      qemu-char: fix documentation for telnet+wait socket flags
      qemu-char: don't leak opts on error
      qemu-char: use ChardevBackendKind in CharDriver
      qemu-char: minor mux chardev fixes
      qemu-char: add -chardev mux support
      qemu-char: report udp backend errors
      qemu-socket: don't leak opts on error

Michael Tokarev (1):
      doc: we use seabios, not bochs bios

 include/sysemu/char.h |    2 +-
 qapi-schema.json      |    7 ++++---
 qemu-char.c           |   45 ++++++++++++++++++++++++++++++++-------------
 qemu-doc.texi         |    2 +-
 util/qemu-sockets.c   |    9 ++++-----
 5 files changed, 42 insertions(+), 23 deletions(-)

