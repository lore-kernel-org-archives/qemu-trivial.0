Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SDN0X-0001Qx-4y
	for mharc-qemu-trivial@gnu.org; Thu, 29 Mar 2012 17:35:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:32916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SDN0T-0001Po-IV
	for qemu-trivial@nongnu.org; Thu, 29 Mar 2012 17:35:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SDN0S-0002uz-1w
	for qemu-trivial@nongnu.org; Thu, 29 Mar 2012 17:35:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1SDN0R-0002ue-P1
	for qemu-trivial@nongnu.org; Thu, 29 Mar 2012 17:35:43 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2TLZd11022775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 29 Mar 2012 17:35:39 -0400
Received: from garlic.redhat.com (vpn-201-133.tlv.redhat.com [10.35.201.133])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id q2TLZbXH025909; Thu, 29 Mar 2012 17:35:38 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 29 Mar 2012 23:35:36 +0200
Message-Id: <1333056937-14748-1-git-send-email-alevy@redhat.com>
In-Reply-To: <1332944776-4037-1-git-send-email-alevy@redhat.com>
References: <1332944776-4037-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v3 1/2] tracetool: dtrace: handle in and next
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
X-List-Received-Date: Thu, 29 Mar 2012 21:35:46 -0000

Signed-off-by: Alon Levy <alevy@redhat.com>
---

I think I need a qemu-trivial-review too ;)

v3:
 added self    (Lee Essen)
 use post '_'  (Stefan Hajnoczi)
 use case/esca (Eric Blake & Peter Maydell)

 scripts/tracetool |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/tracetool b/scripts/tracetool
index 65bd0a1..ab788f2 100755
--- a/scripts/tracetool
+++ b/scripts/tracetool
@@ -494,10 +494,12 @@ EOF
     i=1
     for arg in $arglist
     do
-        # 'limit' is a reserved keyword
-        if [ "$arg" = "limit" ]; then
-          arg="_limit"
-        fi
+        # postfix reserved words with '_'
+        case "$arg" in
+            limit|in|next|self)
+                arg="${arg}_"
+                ;;
+        esac
         cat <<EOF
   $arg = \$arg$i;
 EOF
-- 
1.7.9.3


