Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqzS6-0002CP-Nd
	for mharc-qemu-trivial@gnu.org; Wed, 19 Nov 2014 02:13:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XqzRz-0001zO-3K
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 02:13:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XqzRs-0002mR-V2
	for qemu-trivial@nongnu.org; Wed, 19 Nov 2014 02:13:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1XqzRg-0002jl-E3; Wed, 19 Nov 2014 02:12:56 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAJ7Ctj1019668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 19 Nov 2014 02:12:55 -0500
Received: from fam-t430.nay.redhat.com (dhcp-14-161.nay.redhat.com
	[10.66.14.161])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAJ7CqFF004555; Wed, 19 Nov 2014 02:12:53 -0500
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Nov 2014 15:13:17 +0800
Message-Id: <1416381197-12191-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: Replace which(1) with "command -v"
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
X-List-Received-Date: Wed, 19 Nov 2014 07:13:21 -0000

Because which(1) is not always installed, whereas "command -v" is
the more native way to check for a command.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 47048f0..986a13d 100755
--- a/configure
+++ b/configure
@@ -2727,7 +2727,7 @@ fi
 if test "$modules" = yes; then
     shacmd_probe="sha1sum sha1 shasum"
     for c in $shacmd_probe; do
-        if which $c >/dev/null 2>&1; then
+        if command -v $c >/dev/null 2>&1; then
             shacmd="$c"
             break
         fi
-- 
1.9.3


