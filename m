Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6G49-0004gl-Aw
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 03:55:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1W6G42-0004V4-Jy
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 03:55:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1W6G3w-0007IZ-QY
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 03:55:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1W6G3l-0007HO-Bk; Thu, 23 Jan 2014 03:54:49 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0N8skb1020118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 23 Jan 2014 03:54:46 -0500
Received: from amosk.info.com (vpn1-113-28.nay.redhat.com [10.66.113.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0N8sg5w008358; Thu, 23 Jan 2014 03:54:43 -0500
From: Amos Kong <akong@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 23 Jan 2014 16:54:37 +0800
Message-Id: <1390467277-16499-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH] qapi: cleanup redundant variable
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
X-List-Received-Date: Thu, 23 Jan 2014 08:55:12 -0000

No need to re-append an expr list, it's ok to return schema.exprs

Signed-off-by: Amos Kong <akong@redhat.com>
---
 scripts/qapi.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/qapi.py b/scripts/qapi.py
index 7b92689..718f1ad 100644
--- a/scripts/qapi.py
+++ b/scripts/qapi.py
@@ -175,8 +175,6 @@ def parse_schema(fp):
         print >>sys.stderr, e
         exit(1)
 
-    exprs = []
-
     for expr in schema.exprs:
         if expr.has_key('enum'):
             add_enum(expr['enum'])
@@ -185,9 +183,8 @@ def parse_schema(fp):
             add_enum('%sKind' % expr['union'])
         elif expr.has_key('type'):
             add_struct(expr)
-        exprs.append(expr)
 
-    return exprs
+    return schema.exprs
 
 def parse_args(typeinfo):
     if isinstance(typeinfo, basestring):
-- 
1.8.4.2


