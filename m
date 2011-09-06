Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R0qbX-0006XF-HE
	for mharc-qemu-trivial@gnu.org; Tue, 06 Sep 2011 04:01:59 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1R0qbR-0006CF-Fw
	for qemu-trivial@nongnu.org; Tue, 06 Sep 2011 04:01:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1R0qbQ-0001MS-Mr
	for qemu-trivial@nongnu.org; Tue, 06 Sep 2011 04:01:53 -0400
Received: from oxygen.pond.sub.org ([78.46.104.156]:50133)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1R0qbE-0001Ft-C9; Tue, 06 Sep 2011 04:01:40 -0400
Received: from blackfin.pond.sub.org (p5B32C9A8.dip.t-dialin.net
	[91.50.201.168])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 564E8A247E;
	Tue,  6 Sep 2011 10:01:37 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 7602360066; Tue,  6 Sep 2011 10:01:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Sep 2011 10:01:36 +0200
Message-Id: <1315296096-8115-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] docs: Fix qdev-device-use.txt typo in
	-chardev serial, path=COM<NUM>
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
X-List-Received-Date: Tue, 06 Sep 2011 08:01:57 -0000


Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/qdev-device-use.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
index 057c322..136d271 100644
--- a/docs/qdev-device-use.txt
+++ b/docs/qdev-device-use.txt
@@ -208,7 +208,7 @@ LEGACY-CHARDEV translates to -chardev HOST-OPTS... as follows:
 
 * con: becomes -chardev console
 
-* COM<NUM> becomes -chardev serial,path=<NUM>
+* COM<NUM> becomes -chardev serial,path=COM<NUM>
 
 * file:FNAME becomes -chardev file,path=FNAME
 
-- 
1.7.6


