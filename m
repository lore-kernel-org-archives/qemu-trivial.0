Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fPsEx-0000wo-9k
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jun 2018 12:21:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fPsEu-0000uf-KS
	for qemu-trivial@nongnu.org; Mon, 04 Jun 2018 12:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fPsEt-00074r-Sx
	for qemu-trivial@nongnu.org; Mon, 04 Jun 2018 12:21:48 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:42670)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fPsEr-00072i-OU; Mon, 04 Jun 2018 12:21:45 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fPsEn-0007BA-PJ; Mon, 04 Jun 2018 17:21:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>,
	qemu-trivial@nongnu.org
Date: Mon,  4 Jun 2018 17:21:40 +0100
Message-Id: <20180604162140.20688-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] CODING_STYLE: Define our preferred form for
 multiline comments
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
X-List-Received-Date: Mon, 04 Jun 2018 16:21:49 -0000

The codebase has a bit of a mix of
 /* multiline comments
  * like this
  */
and
 /* multiline comments like this
    in the GNU Coding Standards style */

State a preference for the former.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I admit that to some extent I'm imposing my aesthetic
preferences here; pretty sure we have a lot more style
1 comments than style 2, though.
---
 CODING_STYLE | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 12ba58ee293..fb1d1f1cd62 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -124,6 +124,19 @@ We use traditional C-style /* */ comments and avoid // comments.
 Rationale: The // form is valid in C99, so this is purely a matter of
 consistency of style. The checkpatch script will warn you about this.
 
+Multiline comments blocks should have a row of stars on the left
+and the terminating */ on its own line:
+    /* like
+     * this
+     */
+Putting the initial /* on its own line is accepted, but not required.
+(Some of the existing comments in the codebase use the GNU Coding
+Standards form which does not have stars on the left; avoid this
+when writing new comments.)
+
+Rationale: Consistency, and ease of visually picking out a multiline
+comment from the surrounding code.
+
 8. trace-events style
 
 8.1 0x prefix
-- 
2.17.1


