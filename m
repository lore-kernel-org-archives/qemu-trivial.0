Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJEG-0001CD-Vz
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:15:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJE9-00012e-KX
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:15:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJE4-0005cv-OE
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:15:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJDn-0005aW-J5; Fri, 15 Aug 2014 11:15:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0033E42F58;
	Fri, 15 Aug 2014 19:15:14 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E112C6E0;
	Fri, 15 Aug 2014 19:15:13 +0400 (MSK)
Received: (nullmailer pid 17914 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:14:57 +0400
Message-Id: <1408115711-17836-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 06/20] CODING_STYLE: Section about conditional
	statement
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
X-List-Received-Date: Fri, 15 Aug 2014 15:15:42 -0000

From: Gonglei <arei.gonglei@huawei.com>

Yoda conditions lack readability, and QEMU has a
strict compiler configuration for checking a common
mistake like "if (dev = NULL)". Make it a written rule.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 CODING_STYLE |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 4280945..d46cfa5 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -91,3 +91,17 @@ Mixed declarations (interleaving statements and declarations within blocks)
 are not allowed; declarations should be at the beginning of blocks.  In other
 words, the code should not generate warnings if using GCC's
 -Wdeclaration-after-statement option.
+
+6. Conditional statements
+
+When comparing a variable for (in)equality with a constant, list the
+constant on the right, as in:
+
+if (a == 1) {
+    /* Reads like: "If a equals 1" */
+    do_something();
+}
+
+Rationale: Yoda conditions (as in 'if (1 == a)') are awkward to read.
+Besides, good compilers already warn users when '==' is mis-typed as '=',
+even when the constant is on the right.
-- 
1.7.10.4


