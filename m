Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZi8K-0003E4-Ec
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2017 12:58:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cZi8I-0003CU-2D
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 12:58:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cZi8H-00075w-Bw
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 12:58:50 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48391)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cZi8F-00074o-IO; Fri, 03 Feb 2017 12:58:47 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cZi8B-0002gr-7R; Fri, 03 Feb 2017 17:58:43 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  3 Feb 2017 17:58:42 +0000
Message-Id: <1486144722-6021-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] CODING_STYLE: Mention preferred comment form
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
X-List-Received-Date: Fri, 03 Feb 2017 17:58:51 -0000

Our defacto coding style strongly prefers /* */ style comments
over the single-line // style, and checkpatch enforces this,
but we don't actually document this. Mention it in CODING_STYLE.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 CODING_STYLE | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index f53180b..2fa0c0b 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -116,3 +116,10 @@ if (a == 1) {
 Rationale: Yoda conditions (as in 'if (1 == a)') are awkward to read.
 Besides, good compilers already warn users when '==' is mis-typed as '=',
 even when the constant is on the right.
+
+7. Comment style
+
+We use traditional C-style /* */ comments and avoid // comments.
+
+Rationale: The // form is valid in C99, so this is purely a matter of
+consistency of style. The checkpatch script will warn you about this.
-- 
2.7.4


