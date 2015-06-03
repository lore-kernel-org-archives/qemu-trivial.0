Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z04TT-0000vU-Ko
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 04:56:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Z04TR-0000ui-0E
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 04:56:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Z04TN-0001Ii-Qq
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 04:56:32 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:35633 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Z04TN-0001EO-LE; Wed, 03 Jun 2015 04:56:29 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaroharston)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Z05oq-0001VY-8u; Wed, 03 Jun 2015 12:22:44 +0200
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Date: Wed,  3 Jun 2015 09:56:37 +0100
Message-Id: <1433321798-13398-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.4.2
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
Subject: [Qemu-trivial] [PATCH] configure: postfix --extra-cflags to
	QEMU_CFLAGS
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
X-List-Received-Date: Wed, 03 Jun 2015 08:56:33 -0000

It makes sense that extra-cflags should be appended after the normal
CFLAGS so they don't get overridden by default behaviour. This way if
you specify something like:

  ./configure --extra-cflags="-O0"

You will see the requested behaviour.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index b707429..f13831a 100755
--- a/configure
+++ b/configure
@@ -353,7 +353,7 @@ for opt do
   ;;
   --cpu=*) cpu="$optarg"
   ;;
-  --extra-cflags=*) QEMU_CFLAGS="$optarg $QEMU_CFLAGS"
+  --extra-cflags=*) QEMU_CFLAGS="$QEMU_CFLAGS $optarg"
                     EXTRA_CFLAGS="$optarg"
   ;;
   --extra-ldflags=*) LDFLAGS="$optarg $LDFLAGS"
-- 
2.4.2


