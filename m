Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4kRD-0006eq-Fd
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2015 02:05:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kR9-0006Us-6W
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 02:05:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kR8-0004Ap-CU
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 02:05:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43361)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a4kR2-00048n-SW; Fri, 04 Dec 2015 02:05:41 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id ECECC4063A;
	Fri,  4 Dec 2015 10:05:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 543D0AAD;
	Fri,  4 Dec 2015 09:57:43 +0300 (MSK)
Received: (nullmailer pid 7959 invoked by uid 1000);
	Fri, 04 Dec 2015 06:57:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  4 Dec 2015 09:57:34 +0300
Message-Id: <0ef74c7496fd3c526b2259f86326eca4b3a03b78.1449211229.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
References: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 3/9] configure: Diagnose broken linkers
	directly
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
X-List-Received-Date: Fri, 04 Dec 2015 07:05:48 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Currently if the user's compiler works for creating .o files but
their linker is broken such that compiling an executable from a
C file does not work, we will report a misleading error message
about the compiler not supporting __thread (since that happens
to be the first test we run which requires a working linker).
Explicitly check that compile_prog works as well as compile_object,
so that people whose toolchain setup is broken get a more helpful
error message.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 67801b0..2e8a672 100755
--- a/configure
+++ b/configure
@@ -1428,6 +1428,9 @@ if compile_object ; then
 else
     error_exit "\"$cc\" either does not exist or does not work"
 fi
+if ! compile_prog ; then
+    error_exit "\"$cc\" cannot build an executable (is your linker broken?)"
+fi
 
 # Check that the C++ compiler exists and works with the C compiler
 if has $cxx; then
-- 
2.1.4


