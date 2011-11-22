Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSo4a-0003dp-B1
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:59:32 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RSo4S-0003BA-Va
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:59:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RSo4P-00087K-0n
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:59:24 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:58516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RSo4J-000858-2V; Tue, 22 Nov 2011 05:59:15 -0500
Received: from blackfin.pond.sub.org (p5B32D94C.dip.t-dialin.net
	[91.50.217.76])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id D5C259FF79;
	Tue, 22 Nov 2011 11:59:08 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id BBD3C6006E; Tue, 22 Nov 2011 11:59:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 11:59:05 +0100
Message-Id: <1321959547-2602-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/2] Trivial console_putchar() fixes
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
X-List-Received-Date: Tue, 22 Nov 2011 10:59:31 -0000

Markus Armbruster (2):
  console: Clean up confusing indentation in console_putchar()
  console: Fix console_putchar() for CSI J

 console.c |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

-- 
1.7.6.4


