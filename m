Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bwFU0-0006Az-Eq
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2016 17:30:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bwFTy-00067V-6X
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2016 17:30:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bwFTx-0004K0-MX
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2016 17:30:06 -0400
Received: from relay4-d.mail.gandi.net ([2001:4b98:c:538::196]:41005)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1bwFTv-0004Fx-Sq; Mon, 17 Oct 2016 17:30:03 -0400
Received: from red.redhat.com (unknown
	[IPv6:2602:30a:c7d0:7100:7657:7b6:d81b:9143])
	(Authenticated sender: eric@blake.one)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPA id 2CB2D172098;
	Mon, 17 Oct 2016 23:29:59 +0200 (CEST)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: dave@natulte.net, quintela@redhat.com, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Mon, 17 Oct 2016 16:29:54 -0500
Message-Id: <1476739794-19536-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:4b98:c:538::196
Subject: [Qemu-trivial] [PATCH] trivial: Restore blank line in qapi-schema
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2016 21:30:07 -0000

Commit de63ab6 accidentally undid part of commit a43edcf,
because the two patches were written in parallel, and the
blank line was not noticed as a casualty of merge conflicts.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qapi-schema.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qapi-schema.json b/qapi-schema.json
index ded1179..6da520c 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -737,6 +737,7 @@
             '*tls-hostname': 'str',
             '*max-bandwidth': 'int',
             '*downtime-limit': 'int'} }
+
 ##
 # @query-migrate-parameters
 #
-- 
2.7.4


