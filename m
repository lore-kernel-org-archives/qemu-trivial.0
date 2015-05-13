Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YsWv3-0000RL-6Z
	for mharc-qemu-trivial@gnu.org; Wed, 13 May 2015 09:41:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <M.Cerveny@computer.org>) id 1YsVZc-0002pE-Ng
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 08:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <M.Cerveny@computer.org>) id 1YsVZZ-0003XV-5a
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 08:15:40 -0400
Received: from gw.c-home.cz ([89.24.150.100]:55221 helo=dmz.c-home.cz)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <M.Cerveny@computer.org>)
	id 1YsVZX-0003VE-V8; Wed, 13 May 2015 08:15:36 -0400
Received: from xen.c-home.cz (xen.c-home.cz [192.168.1.102])
	by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id t4DCFEuv018810;
	Wed, 13 May 2015 14:15:34 +0200 (CEST)
From: Martin Cerveny <M.Cerveny@computer.org>
To: qemu-devel@nongnu.org
Date: Wed, 13 May 2015 14:14:53 +0200
Message-Id: <1431519294-8873-2-git-send-email-M.Cerveny@computer.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
References: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
X-detected-operating-system: by eggs.gnu.org: Solaris 10
X-Received-From: 89.24.150.100
X-Mailman-Approved-At: Wed, 13 May 2015 09:41:51 -0400
Cc: qemu-trivial@nongnu.org, Martin Cerveny <M.Cerveny@computer.org>
Subject: [Qemu-trivial] [PATCH 1/2] scripts: qom-*: add network syntax
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

Add network syntax parsing (ip address, port) to qom-* scripts.

Signed-off-by: Martin Cerveny <M.Cerveny@computer.org>
---
 scripts/qmp/qom-fuse |   13 ++++++++++++-
 scripts/qmp/qom-get  |   12 +++++++++++-
 scripts/qmp/qom-list |   12 +++++++++++-
 scripts/qmp/qom-set  |   12 +++++++++++-
 scripts/qmp/qom-tree |   12 +++++++++++-
 5 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index 5c6754a..d49f36d 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -134,5 +134,16 @@ class QOMFS(Fuse):
 if __name__ == '__main__':
     import sys, os
 
-    fs = QOMFS(QEMUMonitorProtocol(os.environ['QMP_SOCKET']))
+    socket_path = os.environ['QMP_SOCKET']
+    connection = socket_path.split(':')
+    if len(connection) == 2:
+        try:
+            port = int(connection[1])
+        except ValueError:
+            raise QMPBadPort
+        connection = ( connection[0], port )
+    else:
+        connection = socket_path
+
+    fs = QOMFS(QEMUMonitorProtocol(connection))
     fs.main(sys.argv)
diff --git a/scripts/qmp/qom-get b/scripts/qmp/qom-get
index 0172c69..f12eb52 100755
--- a/scripts/qmp/qom-get
+++ b/scripts/qmp/qom-get
@@ -56,7 +56,17 @@ if len(args) > 0:
 else:
     usage_error("not enough arguments")
 
-srv = QEMUMonitorProtocol(socket_path)
+connection = socket_path.split(':')
+if len(connection) == 2:
+    try:
+         port = int(connection[1])
+    except ValueError:
+         raise QMPBadPort
+    connection = ( connection[0], port )
+else:
+    connection = socket_path
+
+srv = QEMUMonitorProtocol(connection)
 srv.connect()
 
 rsp = srv.command('qom-get', path=path, property=prop)
diff --git a/scripts/qmp/qom-list b/scripts/qmp/qom-list
index 1e7cc6c..fadcce4 100755
--- a/scripts/qmp/qom-list
+++ b/scripts/qmp/qom-list
@@ -48,7 +48,17 @@ if not socket_path:
     else:
         usage_error("no QMP socket path or address given");
 
-srv = QEMUMonitorProtocol(socket_path)
+connection = socket_path.split(':')
+if len(connection) == 2:
+    try:
+         port = int(connection[1])
+    except ValueError:
+         raise QMPBadPort
+    connection = ( connection[0], port )
+else:
+    connection = socket_path
+
+srv = QEMUMonitorProtocol(connection)
 srv.connect()
 
 if len(args) == 0:
diff --git a/scripts/qmp/qom-set b/scripts/qmp/qom-set
index 54ecfec..b05fae3 100755
--- a/scripts/qmp/qom-set
+++ b/scripts/qmp/qom-set
@@ -58,7 +58,17 @@ if len(args) > 1:
 else:
     usage_error("not enough arguments")
 
-srv = QEMUMonitorProtocol(socket_path)
+connection = socket_path.split(':')
+if len(connection) == 2:
+    try:
+         port = int(connection[1])
+    except ValueError:
+         raise QMPBadPort
+    connection = ( connection[0], port )
+else:
+    connection = socket_path
+
+srv = QEMUMonitorProtocol(connection)
 srv.connect()
 
 print srv.command('qom-set', path=path, property=prop, value=sys.argv[2])
diff --git a/scripts/qmp/qom-tree b/scripts/qmp/qom-tree
index aea11d4..07f8a9d 100755
--- a/scripts/qmp/qom-tree
+++ b/scripts/qmp/qom-tree
@@ -50,7 +50,17 @@ if not socket_path:
     else:
         usage_error("no QMP socket path or address given");
 
-srv = QEMUMonitorProtocol(socket_path)
+connection = socket_path.split(':')
+if len(connection) == 2:
+    try:
+         port = int(connection[1])
+    except ValueError:
+         raise QMPBadPort
+    connection = ( connection[0], port )
+else:
+    connection = socket_path
+
+srv = QEMUMonitorProtocol(connection)
 srv.connect()
 
 def list_node(path):
-- 
1.7.4.1


