Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyHyH-0002TQ-Mt
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 06:57:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1YyHyE-0002M5-1v
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 06:56:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1YyHy8-0008PL-Sf
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 06:56:57 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:34562 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1YyHy8-0008Ov-MD; Fri, 29 May 2015 06:56:52 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaroharston)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1YyJIQ-0004gr-2D; Fri, 29 May 2015 14:21:54 +0200
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Date: Fri, 29 May 2015 11:56:51 +0100
Message-Id: <1432897012-1423-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: don't apply -O2 if extra-cflags
	sets -O
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
X-List-Received-Date: Fri, 29 May 2015 10:56:59 -0000

If your trying to debug and want to force -O0 then don't allow the
configure script to try and set -O2. You can use --enable-debug but that
enables a lot more stuff by default.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index b707429..be1f354 100755
--- a/configure
+++ b/configure
@@ -4240,7 +4240,10 @@ if test "$gcov" = "yes" ; then
   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
 elif test "$debug" = "no" ; then
-  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
+    if test "${EXTRA_CFLAGS#*-O}" = "$EXTRA_CFLAGS"; then
+        CFLAGS="-O2 $CFLAGS"
+    fi
+    CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
 fi
 
 ##########################################
-- 
2.4.1


