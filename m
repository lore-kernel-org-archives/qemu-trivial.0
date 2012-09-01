Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7wjq-0004Jy-5u
	for mharc-qemu-trivial@gnu.org; Sat, 01 Sep 2012 19:04:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1T7wjn-0004EB-Jm
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 19:04:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1T7wjm-0005Up-RK
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 19:04:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1T7wjk-0005UY-Nt; Sat, 01 Sep 2012 19:04:20 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q81N4JPf007434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sat, 1 Sep 2012 19:04:19 -0400
Received: from garlic.redhat.com (vpn-9-61.rdu.redhat.com [10.11.9.61])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q81N4HDh023688; Sat, 1 Sep 2012 19:04:18 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun,  2 Sep 2012 02:04:16 +0300
Message-Id: <1346540656-2927-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] dtrace backend: add function to reserved
	words
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
X-List-Received-Date: Sat, 01 Sep 2012 23:04:24 -0000

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 scripts/tracetool/backend/dtrace.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracetool/backend/dtrace.py b/scripts/tracetool/backend/dtrace.py
index 9cab75c..6be7047 100644
--- a/scripts/tracetool/backend/dtrace.py
+++ b/scripts/tracetool/backend/dtrace.py
@@ -87,7 +87,7 @@ def stap(events):
         if len(e.args) > 0:
             for name in e.args.names():
                 # Append underscore to reserved keywords
-                if name in ('limit', 'in', 'next', 'self'):
+                if name in ('limit', 'in', 'next', 'self', 'function'):
                     name += '_'
                 out('  %s = $arg%d;' % (name, i))
                 i += 1
-- 
1.7.12


