Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a1F0i-00065y-Tb
	for mharc-qemu-trivial@gnu.org; Tue, 24 Nov 2015 09:56:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a1F0c-0005wt-3e
	for qemu-trivial@nongnu.org; Tue, 24 Nov 2015 09:55:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a1F0X-0003DH-9K
	for qemu-trivial@nongnu.org; Tue, 24 Nov 2015 09:55:54 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:37431)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a1F0X-0003DB-3r
	for qemu-trivial@nongnu.org; Tue, 24 Nov 2015 09:55:49 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a1F0U-0002kz-Jl; Tue, 24 Nov 2015 14:55:46 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 24 Nov 2015 14:55:46 +0000
Message-Id: <1448376946-10572-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Diagnose broken linkers directly
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
X-List-Received-Date: Tue, 24 Nov 2015 14:55:59 -0000

Currently if the user's compiler works for creating .o files but
their linker is broken such that compiling an executable from a
C file does not work, we will report a misleading error message
about the compiler not supporting __thread (since that happens
to be the first test we run which requires a working linker).
Explicitly check that compile_prog works as well as compile_object,
so that people whose toolchain setup is broken get a more helpful
error message.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 71d6cbc..21a8536 100755
--- a/configure
+++ b/configure
@@ -1426,6 +1426,9 @@ if compile_object ; then
 else
     error_exit "\"$cc\" either does not exist or does not work"
 fi
+if ! compile_prog ; then
+    error_exit "\"$cc\" cannot build an executable (is your linker broken?)"
+fi
 
 # Check that the C++ compiler exists and works with the C compiler
 if has $cxx; then
-- 
1.9.1


