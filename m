Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROnb7-0007eg-HT
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2011 04:40:33 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1ROnaw-00075I-UM
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 04:40:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1ROnav-00022T-IP
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 04:40:22 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:46902)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1ROnas-00020A-Dv; Fri, 11 Nov 2011 04:40:18 -0500
Received: from blackfin.pond.sub.org (p5B32B59E.dip.t-dialin.net
	[91.50.181.158])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 812E6A4111;
	Fri, 11 Nov 2011 10:40:10 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 9C7A96006D; Fri, 11 Nov 2011 10:40:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Nov 2011 10:40:04 +0100
Message-Id: <1321004409-3274-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/5] Plug a few trivial resource leaks
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
X-List-Received-Date: Fri, 11 Nov 2011 09:40:25 -0000

As usual, shit happens on error paths.

Markus Armbruster (5):
  qemu-char: Plug memory leak on qemu_chr_open_pty() error path
  ui: Plug memory leaks on parse_keyboard_layout() error path
  qemu-sockets: Plug fd leak on unix_connect_opts() error path
  posix-aio-compat: Plug memory leak on paio_init() error path
  os-posix: Plug fd leak in qemu_create_pidfile()

 os-posix.c         |    3 +++
 posix-aio-compat.c |    1 +
 qemu-char.c        |   19 ++++++++++---------
 qemu-sockets.c     |    1 +
 ui/keymaps.c       |   12 +++++++-----
 5 files changed, 22 insertions(+), 14 deletions(-)

-- 
1.7.6.4


