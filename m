Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAMht-0005b8-Rl
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jul 2015 14:26:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZAMhr-0005YO-JA
	for qemu-trivial@nongnu.org; Wed, 01 Jul 2015 14:26:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZAMhq-0001NS-PP
	for qemu-trivial@nongnu.org; Wed, 01 Jul 2015 14:25:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZAMhl-0001M0-CP; Wed, 01 Jul 2015 14:25:53 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id D865119CBE2;
	Wed,  1 Jul 2015 18:25:52 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-29.bos.redhat.com [10.18.17.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t61IPqom031255; Wed, 1 Jul 2015 14:25:52 -0400
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 Jul 2015 14:25:49 -0400
Message-Id: <1435775149-17285-1-git-send-email-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>, mjt@tls.msk.ru,
	lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] qmp-shell: add documentation
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
X-List-Received-Date: Wed, 01 Jul 2015 18:26:00 -0000

I should probably document the changes that were made.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 65280d2..fa39bf0 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -29,6 +29,41 @@
 # (QEMU) device_add driver=e1000 id=net1
 # {u'return': {}}
 # (QEMU)
+#
+# key=value pairs also support Python or JSON object literal subset notations,
+# without spaces. Dictionaries/objects {} are supported as are arrays [].
+#
+#    example-command arg-name1={'key':'value','obj'={'prop':"value"}}
+#
+# Both JSON and Python formatting should work, including both styles of
+# string literal quotes. Both paradigms of literal values should work,
+# including null/true/false for JSON and None/True/False for Python.
+#
+#
+# Transactions have the following multi-line format:
+#
+#    transaction(
+#    action-name1 [ arg-name1=arg1 ] ... [arg-nameN=argN ]
+#    ...
+#    action-nameN [ arg-name1=arg1 ] ... [arg-nameN=argN ]
+#    )
+#
+# One line transactions are also supported:
+#
+#    transaction( action-name1 ... )
+#
+# For example:
+#
+#     (QEMU) transaction(
+#     TRANS> block-dirty-bitmap-add node=drive0 name=bitmap1
+#     TRANS> block-dirty-bitmap-clear node=drive0 name=bitmap0
+#     TRANS> )
+#     {"return": {}}
+#     (QEMU)
+#
+# Use the -v and -p options to activate the verbose and pretty-print options,
+# which will echo back the properly formatted JSON-compliant QMP that is being
+# sent to QEMU, which is useful for debugging and documentation generation.
 
 import qmp
 import json
-- 
2.1.0


