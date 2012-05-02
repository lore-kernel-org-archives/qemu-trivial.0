Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SPgAk-0004xn-Bh
	for mharc-qemu-trivial@gnu.org; Wed, 02 May 2012 16:29:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SPgAh-0004pr-Ts
	for qemu-trivial@nongnu.org; Wed, 02 May 2012 16:29:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SPgAf-0005AP-Ig
	for qemu-trivial@nongnu.org; Wed, 02 May 2012 16:29:10 -0400
Received: from cantor2.suse.de ([195.135.220.15]:48419 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SPgAc-0004zw-1y; Wed, 02 May 2012 16:29:06 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 3D1DC90182;
	Wed,  2 May 2012 22:29:04 +0200 (CEST)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Wed,  2 May 2012 22:28:58 +0200
Message-Id: <1335990538-20025-1-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH for-1.1] cpu: Update documentation and comment
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
X-List-Received-Date: Wed, 02 May 2012 20:29:13 -0000

State struct CPU had been renamed to CPUState, former CPUState to
CPUArchState.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 include/qemu/cpu.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/cpu.h b/include/qemu/cpu.h
index 4291279..78b65b3 100644
--- a/include/qemu/cpu.h
+++ b/include/qemu/cpu.h
@@ -39,7 +39,7 @@ typedef struct CPUState CPUState;
=20
 /**
  * CPUClass:
- * @reset: Callback to reset the #CPU to its initial state.
+ * @reset: Callback to reset the #CPUState to its initial state.
  *
  * Represents a CPU family or model.
  */
@@ -61,7 +61,7 @@ struct CPUState {
     Object parent_obj;
     /*< public >*/
=20
-    /* TODO Move common fields from CPUState here. */
+    /* TODO Move common fields from CPUArchState here. */
 };
=20
=20
--=20
1.7.7


