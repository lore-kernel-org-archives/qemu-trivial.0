Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTGbC-0004j8-6p
	for mharc-qemu-trivial@gnu.org; Wed, 23 Nov 2011 12:27:06 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RTGb6-0004NR-Gv
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 12:27:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RTGb5-0008W9-89
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 12:27:00 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:46820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RTGaz-0008UI-7J; Wed, 23 Nov 2011 12:26:53 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RTGaq-0000Tv-R9; Wed, 23 Nov 2011 17:26:44 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 23 Nov 2011 17:26:44 +0000
Message-Id: <1322069204-1824-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1322069204-1824-1-git-send-email-peter.maydell@linaro.org>
References: <1322069204-1824-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 2/2] configure: Print a banner comment at the
	top of config.log
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
X-List-Received-Date: Wed, 23 Nov 2011 17:27:01 -0000

Print a banner comment at the top of config.log identifying
when configure was run and the arguments used. This is occasionally
useful for debugging purposes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/configure b/configure
index 5a35b6d..2e23650 100755
--- a/configure
+++ b/configure
@@ -20,6 +20,11 @@ TMPE="${TMPDIR1}/qemu-conf-${RANDOM}-$$-${RANDOM}.exe"
 trap "rm -f $TMPC $TMPO $TMPE" EXIT INT QUIT TERM
 rm -f config.log
 
+# Print a helpful header at the top of config.log
+echo "# QEMU configure log $(date)" >> config.log
+echo "# produced by $0 $*" >> config.log
+echo "#" >> config.log
+
 compile_object() {
   echo $cc $QEMU_CFLAGS -c -o $TMPO $TMPC >> config.log
   $cc $QEMU_CFLAGS -c -o $TMPO $TMPC >> config.log 2>&1
-- 
1.7.1


