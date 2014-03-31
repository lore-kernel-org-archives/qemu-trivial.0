Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WUhY6-0006jg-Sr
	for mharc-qemu-trivial@gnu.org; Mon, 31 Mar 2014 15:07:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WUhY4-0006gi-Ay
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 15:07:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WUhY3-0007uo-He
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 15:07:08 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:47418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WUhJN-00026k-8Q; Mon, 31 Mar 2014 14:51:57 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WUhJL-0001ti-H1; Mon, 31 Mar 2014 19:51:55 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 31 Mar 2014 19:51:55 +0100
Message-Id: <1396291915-7269-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Fix indentation of help for
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
X-List-Received-Date: Mon, 31 Mar 2014 19:07:09 -0000

The help text for the --enable-debug-info and --disable-debug-info
command line options was misindented: delete the stray extra space
and bring it in to line with everything else.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index fb3bd05..6d20640 100755
--- a/configure
+++ b/configure
@@ -1212,8 +1212,8 @@ Advanced options (experts only):
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
1.9.0


