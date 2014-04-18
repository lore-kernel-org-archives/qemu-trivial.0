Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wb2Fb-0008R5-7D
	for mharc-qemu-trivial@gnu.org; Fri, 18 Apr 2014 02:26:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Wb2FU-0007yh-3d
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 02:26:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Wb2FN-0004A1-VI
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 02:26:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1Wb2FB-00049R-82; Fri, 18 Apr 2014 02:25:49 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3I6Plwu009311
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 18 Apr 2014 02:25:48 -0400
Received: from T430.nay.redhat.com (dhcp-14-247.nay.redhat.com [10.66.14.247])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id s3I6Pjic028533; Fri, 18 Apr 2014 02:25:45 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Apr 2014 14:25:52 +0800
Message-Id: <1397802352-27814-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru
Subject: [Qemu-trivial] [PATCH] configure: Exit with code 0 with --help
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
X-List-Received-Date: Fri, 18 Apr 2014 06:26:14 -0000

There are two paths to show help and exit, one is with "-h" or "--help",
one is with invalid options.

Only "exit 1" with the latter case.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 configure | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 69b9f56..b195efe 100755
--- a/configure
+++ b/configure
@@ -1087,7 +1087,10 @@ for opt do
   ;;
   --enable-quorum) quorum="yes"
   ;;
-  *) echo "ERROR: unknown option $opt"; show_help="yes"
+  *)
+      echo "ERROR: unknown option $opt"
+      show_help="yes"
+      exit_code=1
   ;;
   esac
 done
@@ -1353,7 +1356,7 @@ Advanced options (experts only):
 
 NOTE: The object files are built at the place where configure is launched
 EOF
-exit 1
+exit $exit_code
 fi
 
 # Now we have handled --enable-tcg-interpreter and know we're not just
-- 
1.9.2


