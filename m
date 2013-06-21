Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uq13J-0001JV-9I
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 09:06:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Uq13C-0001C4-T6
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 09:06:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Uq0yK-0006Vm-GO
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 09:01:51 -0400
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:58034 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Uq0y5-0006Jk-J1; Fri, 21 Jun 2013 09:01:33 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Uq0y3-00076v-BP; Fri, 21 Jun 2013 14:01:31 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2013 14:01:31 +0100
Message-Id: <1371819691-27308-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Add signed*signed check to
	[u]int128_t test
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
X-List-Received-Date: Fri, 21 Jun 2013 13:06:55 -0000

clang 3.8 with -fsanitize=undefined will fail to link code containing an
int128_t * int128_t multiply (http://llvm.org/bugs/show_bug.cgi?id=16404)
so add this to our configure test for whether [u]int128_t are usable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |    1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index ad32f87..6465e05 100755
--- a/configure
+++ b/configure
@@ -3329,6 +3329,7 @@ __uint128_t b;
 int main (void) {
   a = a + b;
   b = a * b;
+  a = a * a;
   return 0;
 }
 EOF
-- 
1.7.9.5


