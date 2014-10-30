Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkEOr-0000AT-0c
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:46:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkENE-0005xD-7q
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:46:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XjrK2-00032s-Jk
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 11:07:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XjrJp-0002oL-Sa; Thu, 30 Oct 2014 11:07:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 26B7D46FBA;
	Thu, 30 Oct 2014 18:07:19 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E5D6E702;
	Thu, 30 Oct 2014 18:07:18 +0300 (MSK)
Received: (nullmailer pid 26085 invoked by uid 1000);
	Thu, 30 Oct 2014 15:07:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Thu, 30 Oct 2014 18:07:13 +0300
Message-Id: <cover.1414681502.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Gonglei <arei.gonglei@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH 0/4] cleanup -daemonize and pidfile creation
	a bit
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
X-List-Received-Date: Fri, 31 Oct 2014 15:46:03 -0000

The $subject theme is quite messy, with many things done in a cryptic
and twisty way without any need for that.  This trivial patch series
tries to clean up and improve it.  In particular, it aims to make
pidfile errors visible with -daemonize -- something which Gonglei
tried to fix in e5048d15ce6a and which we're revering because that
fix turned out to be incomplete and wrong.

The patches are simple but I split them into several to easy review.

Michael Tokarev (4):
  os-posix: use global daemon_pipe instead of cryptic fds[1]
  os-posix: replace goto again with a proper loop
  pidfile: stop making pidfile error a special case
  os-posix: reorder parent notification for -daemonize

 include/qemu-common.h |    1 -
 os-posix.c            |   62 ++++++++++++++++++-------------------------------
 os-win32.c            |    5 ----
 vl.c                  |    2 +-
 4 files changed, 23 insertions(+), 47 deletions(-)

-- 
1.7.10.4


