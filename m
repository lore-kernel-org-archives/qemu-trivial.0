Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnSl-0002TI-3C
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 04:58:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnSi-0002Pd-7l
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:58:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnSg-0007s2-E5
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:58:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnSZ-0007gD-SW; Sat, 08 Oct 2016 04:58:24 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0911B40ED5;
	Sat,  8 Oct 2016 11:58:15 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2B080B2C;
	Sat,  8 Oct 2016 11:58:14 +0300 (MSK)
Received: (nullmailer pid 19253 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: David Anderson <dave@natulte.net>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:58:02 +0300
Message-Id: <a43edcf20a14aab81373fe64a6ed8cf84eb2a7f3.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 16/26] qapi: make the json schema files more
 regular.
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
X-List-Received-Date: Sat, 08 Oct 2016 08:58:33 -0000

From: David Anderson <dave@natulte.net>

This makes it easier to parse the schema file for tool generation:
each paragraph is either a non-docstring comment, or a docstring
immediately followed by a Python dict describing an API item.

Signed-off-by: David Anderson <dave@natulte.net>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi-schema.json     | 3 +--
 qapi/block-core.json | 5 -----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index c3dcf11..9e47b47 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -752,6 +752,7 @@
             'cpu-throttle-increment': 'int',
             'tls-creds': 'str',
             'tls-hostname': 'str'} }
+
 ##
 # @query-migrate-parameters
 #
@@ -4118,7 +4119,6 @@
 #
 # Since 1.6
 ##
-
 { 'struct': 'RxFilterInfo',
   'data': {
     'name':               'str',
@@ -4338,7 +4338,6 @@
 #
 # Since: 2.1
 ##
-
 { 'struct': 'Memdev',
   'data': {
     'size':       'size',
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9d797b8..4badb97 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -25,7 +25,6 @@
 # Since: 1.3
 #
 ##
-
 { 'struct': 'SnapshotInfo',
   'data': { 'id': 'str', 'name': 'str', 'vm-state-size': 'int',
             'date-sec': 'int', 'date-nsec': 'int',
@@ -81,7 +80,6 @@
 #
 # Since: 1.7
 ##
-
 { 'union': 'ImageInfoSpecific',
   'data': {
       'qcow2': 'ImageInfoSpecificQCow2',
@@ -129,7 +127,6 @@
 # Since: 1.3
 #
 ##
-
 { 'struct': 'ImageInfo',
   'data': {'filename': 'str', 'format': 'str', '*dirty-flag': 'bool',
            '*actual-size': 'int', 'virtual-size': 'int',
@@ -181,7 +178,6 @@
 # Since: 1.4
 #
 ##
-
 { 'struct': 'ImageCheck',
   'data': {'filename': 'str', 'format': 'str', 'check-errors': 'int',
            '*image-end-offset': 'int', '*corruptions': 'int', '*leaks': 'int',
@@ -518,7 +514,6 @@
 #
 # Since: 2.5
 ##
-
 { 'struct': 'BlockDeviceTimedStats',
   'data': { 'interval_length': 'int', 'min_rd_latency_ns': 'int',
             'max_rd_latency_ns': 'int', 'avg_rd_latency_ns': 'int',
-- 
2.1.4


