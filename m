Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPcFu-0000BF-N4
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 14:27:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1WPcFo-0008QZ-JR
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 14:27:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1WPcFj-0006FR-MJ
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 14:27:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1WPcFZ-0006DX-Jd; Mon, 17 Mar 2014 14:27:01 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2HIQvUS005485
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 17 Mar 2014 14:26:58 -0400
Received: from localhost ([10.3.113.8])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2HIQurH001963; Mon, 17 Mar 2014 14:26:57 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 17 Mar 2014 15:26:31 -0300
Message-Id: <1395080791-18640-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH v3] CODING_STYLE: Section about mixed
	declarations
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
X-List-Received-Date: Mon, 17 Mar 2014 18:27:21 -0000

We had an unwritten rule about declarations having to be at beginning of
blocks. Make it a written rule.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
Changes v3:
 * Wrap long lines

Changes v2:
 * s/be at beginning/be at the beginning/
---
 CODING_STYLE | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index dcbce28..4280945 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -84,3 +84,10 @@ and clarity it comes on a line by itself:
 Rationale: a consistent (except for functions...) bracing style reduces
 ambiguity and avoids needless churn when lines are added or removed.
 Furthermore, it is the QEMU coding style.
+
+5. Declarations
+
+Mixed declarations (interleaving statements and declarations within blocks)
+are not allowed; declarations should be at the beginning of blocks.  In other
+words, the code should not generate warnings if using GCC's
+-Wdeclaration-after-statement option.
-- 
1.8.5.3


