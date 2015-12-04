Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4kJV-0006Ib-S6
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2015 01:57:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kJT-0006C8-2E
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 01:57:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kJR-0000KL-QR
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 01:57:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a4kJN-0000IH-Dn; Fri, 04 Dec 2015 01:57:45 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 36FAC40689;
	Fri,  4 Dec 2015 09:57:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 25A6CAAE;
	Fri,  4 Dec 2015 09:57:43 +0300 (MSK)
Received: (nullmailer pid 7963 invoked by uid 1000);
	Fri, 04 Dec 2015 06:57:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  4 Dec 2015 09:57:36 +0300
Message-Id: <fccd35a04640a728f979e6d72b2c7d02c05549f0.1449211229.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
References: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Rodrigo Rebello <rprebello@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 5/9] configure: use appropriate code fragment
	for -fstack-protector checks
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
X-List-Received-Date: Fri, 04 Dec 2015 06:57:52 -0000

From: Rodrigo Rebello <rprebello@gmail.com>

The check for stack-protector support consisted in compiling and linking
the test program below (output by function write_c_skeleton()) with the
compiler flag -fstack-protector-strong first and then with
-fstack-protector-all if the first one failed to work:

  int main(void) { return 0; }

This caused false positives when using certain toolchains in which the
compiler accepted -fstack-protector-strong but no support was provided
by the C library, since for this stack-protector variant the compiler
emits canary code only for functions that meet specific conditions
(local arrays, memory references to local variables, etc.) and the code
fragment under test included none of them (hence no stack protection
code generated, no link failure).

This fix changes the test program used for -fstack-protector checks to
include a function that meets conditions which cause the compiler to
generate canary code in all variants.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/configure b/configure
index 2e8a672..b9552fd 100755
--- a/configure
+++ b/configure
@@ -1491,6 +1491,16 @@ for flag in $gcc_flags; do
 done
 
 if test "$stack_protector" != "no"; then
+  cat > $TMPC << EOF
+int main(int argc, char *argv[])
+{
+    char arr[64], *p = arr, *c = argv[0];
+    while (*c) {
+        *p++ = *c++;
+    }
+    return 0;
+}
+EOF
   gcc_flags="-fstack-protector-strong -fstack-protector-all"
   sp_on=0
   for flag in $gcc_flags; do
-- 
2.1.4


