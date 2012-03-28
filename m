Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCszz-0002zy-IH
	for mharc-qemu-trivial@gnu.org; Wed, 28 Mar 2012 09:33:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SCszs-0002yh-Fz
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 09:33:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SCszn-0001dc-NF
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 09:33:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SCszn-0001dM-Ff
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 09:33:03 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2SDWxvp020595
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 28 Mar 2012 09:32:59 -0400
Received: from garlic.tlv.redhat.com (spice-ovirt.tlv.redhat.com [10.35.4.71])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id q2SDWvHc009305; Wed, 28 Mar 2012 09:32:58 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 28 Mar 2012 15:32:56 +0200
Message-Id: <1332941577-24820-1-git-send-email-alevy@redhat.com>
In-Reply-To: <20120328131634.GY32389@garlic>
References: <20120328131634.GY32389@garlic>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: =?UTF-8?q?Llu=C3=ADs=20Vilanova?= <vilanova@ac.upc.edu>
Subject: [Qemu-trivial] [PATCH 1/2] tracetool: dtrace: handle in and next
	reserved words
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
X-List-Received-Date: Wed, 28 Mar 2012 13:33:14 -0000

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 scripts/tracetool |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/tracetool b/scripts/tracetool
index 65bd0a1..e7cebf3 100755
--- a/scripts/tracetool
+++ b/scripts/tracetool
@@ -494,9 +494,9 @@ EOF
     i=1
     for arg in $arglist
     do
-        # 'limit' is a reserved keyword
-        if [ "$arg" = "limit" ]; then
-          arg="_limit"
+        # 'limit', 'in' and 'next' are reserved keywords
+        if [ "$arg" = "limit" -o "$arg" = "in" -o "$arg" = "next" ]; then
+          arg="_$arg"
         fi
         cat <<EOF
   $arg = \$arg$i;
-- 
1.7.9.3


