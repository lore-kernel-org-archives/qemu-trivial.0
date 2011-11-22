Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSoxb-0004yn-Ac
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 06:56:23 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RSoxY-0004tN-LK
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 06:56:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RSoxU-000213-JK
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 06:56:20 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:43729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RSoxR-00020Y-Vo; Tue, 22 Nov 2011 06:56:14 -0500
Received: from blackfin.pond.sub.org (p5B32D94C.dip.t-dialin.net
	[91.50.217.76])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id D64BE9FF79;
	Tue, 22 Nov 2011 12:56:11 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id DE5E06006E; Tue, 22 Nov 2011 12:56:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 12:56:10 +0100
Message-Id: <1321962970-2876-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org, Stefano.Stabellini@eu.citrix.com
Subject: [Qemu-trivial] [PATCH] console: Fix qemu_default_pixelformat() for
	24 bpp
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
X-List-Received-Date: Tue, 22 Nov 2011 11:56:21 -0000

Falls through to 32 bpp.  Harmless, because the only difference is the
alpha component, and we're not using that.  Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 console.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/console.c b/console.c
index ce0429d..223f8fd 100644
--- a/console.c
+++ b/console.c
@@ -1688,6 +1688,7 @@ PixelFormat qemu_default_pixelformat(int bpp)
             pf.rbits = 8;
             pf.gbits = 8;
             pf.bbits = 8;
+            break;
         case 32:
             pf.rmask = 0x00FF0000;
             pf.gmask = 0x0000FF00;
-- 
1.7.6.4


