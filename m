Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJiB4-0000yJ-PI
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 04:52:38 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RJiB1-0000mI-Du
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 04:52:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RJiB0-0002ea-Di
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 04:52:35 -0400
Received: from oxygen.pond.sub.org ([78.46.104.156]:47089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RJiAy-0002dh-GX; Fri, 28 Oct 2011 04:52:32 -0400
Received: from blackfin.pond.sub.org (p5B32C8B0.dip.t-dialin.net
	[91.50.200.176])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id D6523A3DE8;
	Fri, 28 Oct 2011 10:52:27 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 14ACD6006D; Fri, 28 Oct 2011 10:52:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Oct 2011 10:52:24 +0200
Message-Id: <1319791946-15602-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org, jvrao@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 0/2] Trivial portability fix: missing va_end()
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
X-List-Received-Date: Fri, 28 Oct 2011 08:52:36 -0000

Markus Armbruster (2):
  sysbus: Supply missing va_end()
  hw/9pfs: Supply missing va_end()

 hw/9pfs/virtio-9p.c |    4 ++++
 hw/sysbus.c         |    2 ++
 2 files changed, 6 insertions(+), 0 deletions(-)

-- 
1.7.6.4


