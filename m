Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXQEt-000283-Es
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 03:14:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQEl-0001sc-Ha
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:14:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQEh-0004Q2-6d
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:14:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXQEW-0004Mf-Nu; Tue, 08 Apr 2014 03:14:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 05AC540E33;
	Tue,  8 Apr 2014 11:14:12 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6F4056AE;
	Tue,  8 Apr 2014 11:04:13 +0400 (MSK)
Received: (nullmailer pid 10569 invoked by uid 1000);
	Tue, 08 Apr 2014 07:04:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  8 Apr 2014 11:04:03 +0400
Message-Id: <1396940651-10513-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 03/11] configure: Fix indentation of help for
	--enable/disable-debug-info
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
X-List-Received-Date: Tue, 08 Apr 2014 07:14:32 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The help text for the --enable-debug-info and --disable-debug-info
command line options was misindented: delete the stray extra space
and bring it in to line with everything else.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index eb0e7bb..31fd3ad 100755
--- a/configure
+++ b/configure
@@ -1217,8 +1217,8 @@ Advanced options (experts only):
   --enable-modules         enable modules support
   --enable-debug-tcg       enable TCG debugging
   --disable-debug-tcg      disable TCG debugging (default)
-  --enable-debug-info       enable debugging information (default)
-  --disable-debug-info      disable debugging information
+  --enable-debug-info      enable debugging information (default)
+  --disable-debug-info     disable debugging information
   --enable-debug           enable common debug build options
   --enable-sparse          enable sparse checker
   --disable-sparse         disable sparse checker (default)
-- 
1.7.10.4


