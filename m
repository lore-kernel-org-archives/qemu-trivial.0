Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XwPkd-0005VG-Ua
	for mharc-qemu-trivial@gnu.org; Thu, 04 Dec 2014 01:18:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XwPkU-0005Dv-83
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 01:18:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XwPkO-000475-1p
	for qemu-trivial@nongnu.org; Thu, 04 Dec 2014 01:18:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1XwPkB-00044r-2m; Thu, 04 Dec 2014 01:18:27 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB46INGS021398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 4 Dec 2014 01:18:23 -0500
Received: from ad.nay.redhat.com (dhcp-14-137.nay.redhat.com [10.66.14.137])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB46IKb3018411; Thu, 4 Dec 2014 01:18:21 -0500
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Dec 2014 14:18:16 +0800
Message-Id: <1417673896-14832-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH for-2.3] configure: Replace which(1) with
	"has"
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
X-List-Received-Date: Thu, 04 Dec 2014 06:18:53 -0000

Using "has" is more slick because which(1) is not always there.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 47048f0..cae588c 100755
--- a/configure
+++ b/configure
@@ -2727,7 +2727,7 @@ fi
 if test "$modules" = yes; then
     shacmd_probe="sha1sum sha1 shasum"
     for c in $shacmd_probe; do
-        if which $c >/dev/null 2>&1; then
+        if has $c; then
             shacmd="$c"
             break
         fi
-- 
1.9.3


