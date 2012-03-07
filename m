Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5Fo1-0004xy-D4
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 07:17:21 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1S5Fnv-0004em-BW
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 07:17:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1S5Fnp-0004QK-5L
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 07:17:14 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:50373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1S5FnJ-0004Lt-LU; Wed, 07 Mar 2012 07:16:37 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1S5FnB-00045w-3Y; Wed, 07 Mar 2012 12:16:29 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  7 Mar 2012 12:16:29 +0000
Message-Id: <1331122589-15717-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: Quote the configure args printed
	in config.log
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
X-List-Received-Date: Wed, 07 Mar 2012 12:17:20 -0000

Use the same mechanism we use for printing the configure command
line to config-host.mak to print it to config.log. This fixes a
bug where the config.log version didn't quote arguments with spaces.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
If I'd noticed when I was adding the banner to config.log that we already
printed this in config-host.mak I'd have done it this way to start with...

 configure |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index a5eb832..1b63436 100755
--- a/configure
+++ b/configure
@@ -22,7 +22,9 @@ rm -f config.log
 
 # Print a helpful header at the top of config.log
 echo "# QEMU configure log $(date)" >> config.log
-echo "# produced by $0 $*" >> config.log
+printf "# Configured with:" >> config.log
+printf " '%s'" "$0" "$@" >> config.log
+echo >> config.log
 echo "#" >> config.log
 
 compile_object() {
-- 
1.7.1


