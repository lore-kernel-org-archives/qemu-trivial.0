Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SL2qB-00042C-I0
	for mharc-qemu-trivial@gnu.org; Thu, 19 Apr 2012 21:40:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1SL2q8-0003qt-EQ
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2012 21:40:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1SL2q6-0001Mz-A6
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2012 21:40:48 -0400
Received: from ozlabs.org ([203.10.76.45]:33855)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1SL2pz-0001LX-Qi; Thu, 19 Apr 2012 21:40:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 6C23AB7029; Fri, 20 Apr 2012 11:40:33 +1000 (EST)
From: David Gibson <david@gibson.dropbear.id.au>
To: aliguori@us.ibm.com
Date: Fri, 20 Apr 2012 11:40:24 +1000
Message-Id: <1334886024-27969-1-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH] Add .gitignore for tests/
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
X-List-Received-Date: Fri, 20 Apr 2012 01:40:50 -0000

The new autotests in tests/ generate a number of files, both
executable and source, which are not caught by the existing .gitignore
files.  This patch adds a new .gitignore in tests/ which covers these.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 tests/.gitignore |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 tests/.gitignore

diff --git a/tests/.gitignore b/tests/.gitignore
new file mode 100644
index 0000000..4e43286
--- /dev/null
+++ b/tests/.gitignore
@@ -0,0 +1,13 @@
+check-qdict
+check-qfloat
+check-qint
+check-qjson
+check-qlist
+check-qstring
+test-qapi-types.[ch]
+test-qapi-visit.[ch]
+test-qmp-commands.h
+test-qmp-commands
+test-qmp-input-strict
+test-qmp-marshal.c
+rtc-test
\ No newline at end of file
-- 
1.7.9.5


