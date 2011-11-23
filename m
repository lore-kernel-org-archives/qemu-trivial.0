Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTGb9-0004Wy-5m
	for mharc-qemu-trivial@gnu.org; Wed, 23 Nov 2011 12:27:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RTGb3-0004Df-V0
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 12:26:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RTGb2-0008VX-SK
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 12:26:57 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:46820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RTGaz-0008UI-Uu; Wed, 23 Nov 2011 12:26:54 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RTGaq-0000Tt-Qd; Wed, 23 Nov 2011 17:26:44 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 23 Nov 2011 17:26:43 +0000
Message-Id: <1322069204-1824-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1322069204-1824-1-git-send-email-peter.maydell@linaro.org>
References: <1322069204-1824-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 1/2] configure: Include #define name in
	check_define compiler error
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
X-List-Received-Date: Wed, 23 Nov 2011 17:26:59 -0000

Include the name of the #define being tested for in the compiler
error produced when a check_define test is run and fails. This
appears only in the config.log, but it does make it a little easier
to debug problems by inspecting config.log.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index f033438..5a35b6d 100755
--- a/configure
+++ b/configure
@@ -249,7 +249,7 @@ source_path=`cd "$source_path"; pwd`
 check_define() {
 cat > $TMPC <<EOF
 #if !defined($1)
-#error Not defined
+#error $1 not defined
 #endif
 int main(void) { return 0; }
 EOF
-- 
1.7.1


