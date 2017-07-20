Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYENI-0000Rk-Qy
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 12:32:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dYENG-0000Pc-9a
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 12:32:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dYENF-0007hK-Ck
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 12:32:26 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dYEND-0007fo-7o; Thu, 20 Jul 2017 12:32:23 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dYENC-0007eq-AU; Thu, 20 Jul 2017 17:32:22 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org,
	Kamil Rytarowski <kamil@netbsd.org>
Date: Thu, 20 Jul 2017 17:32:21 +0100
Message-Id: <1500568341-8389-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH for-2.10] util/oslib-posix.c: Avoid warning
 on NetBSD
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
X-List-Received-Date: Thu, 20 Jul 2017 16:32:27 -0000

On NetBSD the compiler warns:
util/oslib-posix.c: In function 'sigaction_invoke':
util/oslib-posix.c:589:5: warning: missing braces around initializer [-Wmissing-braces]
     siginfo_t si = { 0 };
     ^
util/oslib-posix.c:589:5: warning: (near initialization for 'si.si_pad') [-Wmissing-braces]

because on this platform siginfo_t is defined as
  typedef union siginfo {
          char    si_pad[128];    /* Total size; for future expansion */
          struct _ksiginfo _info;
  } siginfo_t;

Avoid this warning by initializing the struct with {} instead;
this is a GCC extension but we use it all over the codebase already.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 util/oslib-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index b2dea48..cacf0ef 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -586,7 +586,7 @@ void qemu_free_stack(void *stack, size_t sz)
 void sigaction_invoke(struct sigaction *action,
                       struct qemu_signalfd_siginfo *info)
 {
-    siginfo_t si = { 0 };
+    siginfo_t si = {};
     si.si_signo = info->ssi_signo;
     si.si_errno = info->ssi_errno;
     si.si_code = info->ssi_code;
-- 
2.7.4


