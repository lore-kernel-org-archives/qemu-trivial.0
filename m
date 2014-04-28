Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeduG-0000IC-Un
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedu8-0008Qc-3o
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:15:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedu2-0002Ml-Ah
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:15:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wedtp-0002Kp-As; Mon, 28 Apr 2014 01:14:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 864124303B;
	Mon, 28 Apr 2014 09:14:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3D7372B7;
	Mon, 28 Apr 2014 09:08:26 +0400 (MSK)
Received: (nullmailer pid 19135 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:07:50 +0400
Message-Id: <1398661684-19059-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>
Subject: [Qemu-trivial] [PULL 04/18] configure: Improve help behavior
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
X-List-Received-Date: Mon, 28 Apr 2014 05:15:06 -0000

From: Fam Zheng <famz@redhat.com>

Old:
There are two paths to show help and exit 1, one is with "-h" or
"--help", one is with invalid options.

New:
Show help and exit 0 for --help.
On invalid option, don't show the long help and bury the early "ERROR:"
line, just give a message pointing to --help.

Signed-off-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index b08afc3..2fbec59 100755
--- a/configure
+++ b/configure
@@ -1087,7 +1087,10 @@ for opt do
   ;;
   --enable-quorum) quorum="yes"
   ;;
-  *) echo "ERROR: unknown option $opt"; show_help="yes"
+  *)
+      echo "ERROR: unknown option $opt"
+      echo "Try '$0 --help' for more information"
+      exit 1
   ;;
   esac
 done
@@ -1353,7 +1356,7 @@ Advanced options (experts only):
 
 NOTE: The object files are built at the place where configure is launched
 EOF
-exit 1
+exit 0
 fi
 
 # Now we have handled --enable-tcg-interpreter and know we're not just
-- 
1.7.10.4


