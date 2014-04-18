Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wb2iQ-0008TN-KN
	for mharc-qemu-trivial@gnu.org; Fri, 18 Apr 2014 02:56:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Wb2iI-0008Fo-EX
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 02:56:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Wb2iC-0004SO-AI
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 02:55:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53856)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1Wb2hz-0004OK-EW; Fri, 18 Apr 2014 02:55:35 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3I6tXfK022827
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 18 Apr 2014 02:55:33 -0400
Received: from T430.nay.redhat.com (dhcp-14-247.nay.redhat.com [10.66.14.247])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id s3I6tTUC011180; Fri, 18 Apr 2014 02:55:31 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Apr 2014 14:55:36 +0800
Message-Id: <1397804136-12919-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru
Subject: [Qemu-trivial] [PATCH v2] configure: Improve help behavior
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
X-List-Received-Date: Fri, 18 Apr 2014 06:56:00 -0000

Old:
There are two paths to show help and exit 1, one is with "-h" or
"--help", one is with invalid options.

New:
Show help and exit 0 for --help.
On invalid option, don't show the long help and bury the early "ERROR:"
line, just give a message pointing to --help.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 configure | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 69b9f56..b1401c6 100755
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
1.9.2


