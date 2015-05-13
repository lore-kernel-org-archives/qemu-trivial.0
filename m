Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YsWv2-0000QJ-Pj
	for mharc-qemu-trivial@gnu.org; Wed, 13 May 2015 09:41:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <M.Cerveny@computer.org>) id 1YsVZc-0002pC-MZ
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 08:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <M.Cerveny@computer.org>) id 1YsVZa-0003Yu-Mu
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 08:15:40 -0400
Received: from gw.c-home.cz ([89.24.150.100]:55225 helo=dmz.c-home.cz)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <M.Cerveny@computer.org>)
	id 1YsVZa-0003YF-3k; Wed, 13 May 2015 08:15:38 -0400
Received: from xen.c-home.cz (xen.c-home.cz [192.168.1.102])
	by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id t4DCFEuw018810;
	Wed, 13 May 2015 14:15:36 +0200 (CEST)
From: Martin Cerveny <M.Cerveny@computer.org>
To: qemu-devel@nongnu.org
Date: Wed, 13 May 2015 14:14:54 +0200
Message-Id: <1431519294-8873-3-git-send-email-M.Cerveny@computer.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
References: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
X-detected-operating-system: by eggs.gnu.org: Solaris 10
X-Received-From: 89.24.150.100
X-Mailman-Approved-At: Wed, 13 May 2015 09:41:51 -0400
Cc: qemu-trivial@nongnu.org, Martin Cerveny <M.Cerveny@computer.org>
Subject: [Qemu-trivial] [PATCH 2/2] scripts: qom-tree: add support of path
	as argument
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
X-List-Received-Date: Wed, 13 May 2015 12:15:42 -0000

Add processing of optional argument path as "tree base".

Signed-off-by: Martin Cerveny <M.Cerveny@computer.org>
---
 scripts/qmp/qom-tree |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/qmp/qom-tree b/scripts/qmp/qom-tree
index 07f8a9d..c3e3738 100755
--- a/scripts/qmp/qom-tree
+++ b/scripts/qmp/qom-tree
@@ -75,6 +75,11 @@ def list_node(path):
     print ''
     for item in items:
         if item['type'].startswith('child<'):
-            list_node(path + '/' + item['name'])
+            list_node((path if (path != '/') else '')  + '/' + item['name'])
 
-list_node('/machine')
+if len(args) == 0:
+    path = '/'
+else:
+    path = args[0]
+
+list_node(path)
-- 
1.7.4.1


