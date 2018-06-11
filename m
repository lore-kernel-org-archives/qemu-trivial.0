Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSNdV-0000TK-IO
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 10:17:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fSNdL-0000RL-Ke
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 10:17:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fSNdK-0006Nq-MD
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 10:17:23 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:42662)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fSNdI-0006Kd-Az; Mon, 11 Jun 2018 10:17:20 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fSNdF-00078H-BM; Mon, 11 Jun 2018 15:17:17 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Date: Mon, 11 Jun 2018 15:17:16 +0100
Message-Id: <20180611141716.3813-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH v2] CODING_STYLE: Define our preferred form
 for multiline comments
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
X-List-Received-Date: Mon, 11 Jun 2018 14:17:24 -0000

The codebase has a bit of a mix of different multiline
comment styles. State a preference for the Linux kernel
style:
    /*
     * Star on the left for each line.
     * Leading slash-star and trailing star-slash
     * each go on a line of their own.
     */

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is not my personal favourite, but seemed to be the
closest we had to consensus in the mail thread for v1;
I can live with it in order to avoid getting patches which
use the styles I like even less :-)
---
 CODING_STYLE | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 12ba58ee293..2d84f5f26d1 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -124,6 +124,23 @@ We use traditional C-style /* */ comments and avoid // comments.
 Rationale: The // form is valid in C99, so this is purely a matter of
 consistency of style. The checkpatch script will warn you about this.
 
+Multiline comments blocks should have a row of stars on the left,
+and the initial /* and terminating */ both on their own lines:
+    /*
+     * like
+     * this
+     */
+This is the same format required by the Linux kernel coding style.
+
+(Some of the existing comments in the codebase use the GNU Coding
+Standards form which does not have stars on the left, or other
+variations; avoid these when writing new comments, but don't worry
+about converting to the preferred form unless you're editing that
+comment anyway.)
+
+Rationale: Consistency, and ease of visually picking out a multiline
+comment from the surrounding code.
+
 8. trace-events style
 
 8.1 0x prefix
-- 
2.17.1


