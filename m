Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gcyFD-0007Rg-MU
	for mharc-qemu-trivial@gnu.org; Fri, 28 Dec 2018 14:56:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1gcyF9-0007Dk-83
	for qemu-trivial@nongnu.org; Fri, 28 Dec 2018 14:56:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1gcy44-0003gP-Sp
	for qemu-trivial@nongnu.org; Fri, 28 Dec 2018 14:45:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36060)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wainersm@redhat.com>)
	id 1gcy3v-0003G8-Ta; Fri, 28 Dec 2018 14:44:52 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B438CC0C78;
	Fri, 28 Dec 2018 19:44:48 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
	(virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A25760C45;
	Fri, 28 Dec 2018 19:44:47 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	eblake@redhat.com,
	armbru@redhat.com
Date: Fri, 28 Dec 2018 14:44:42 -0500
Message-Id: <20181228194442.3506-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 28 Dec 2018 19:44:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qmp: Add examples to qom list, get,
 and set commands
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Dec 2018 19:56:30 -0000

Added examples for the qom-list, qom-get, and qom-set
commands in qapi misc JSON file.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 qapi/misc.json | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/qapi/misc.json b/qapi/misc.json
index 24d20a880a..426274ecf8 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -1380,6 +1380,16 @@
 #          object.
 #
 # Since: 1.2
+#
+# Example:
+#
+# -> { "execute": "qom-list",
+#      "arguments": { "path": "/chardevs" } }
+# <- { "return": [ { "name": "type", "type": "string" },
+#                  { "name": "parallel0", "type": "child<chardev-vc>" },
+#                  { "name": "serial0", "type": "child<chardev-vc>" },
+#                  { "name": "mon0", "type": "child<chardev-stdio>" } ] =
}
+#
 ##
 { 'command': 'qom-list',
   'data': { 'path': 'str' },
@@ -1417,6 +1427,23 @@
 #          returned as #int.
 #
 # Since: 1.2
+#
+# Example:
+#
+# 1. Use absolute path
+#
+# -> { "execute": "qom-get",
+#      "arguments": { "path": "/machine/unattached/device[0]",
+#                     "property": "hotplugged" } }
+# <- { "return": false }
+#
+# 2. Use partial path
+#
+# -> { "execute": "qom-get",
+#      "arguments": { "path": "unattached/sysbus",
+#                     "property": "type" } }
+# <- { "return": "System" }
+#
 ##
 { 'command': 'qom-get',
   'data': { 'path': 'str', 'property': 'str' },
@@ -1436,6 +1463,15 @@
 #         for a description of type mapping.
 #
 # Since: 1.2
+#
+# Example:
+#
+# -> { "execute": "qom-set",
+#      "arguments": { "path": "/machine",
+#                     "property": "graphics",
+#                     "value": false } }
+# <- { "return": {} }
+#
 ##
 { 'command': 'qom-set',
   'data': { 'path': 'str', 'property': 'str', 'value': 'any' },
--=20
2.19.2


