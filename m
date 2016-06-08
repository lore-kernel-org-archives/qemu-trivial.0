Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bARyT-0001M9-Mw
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 21:08:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyN-0001Ek-TY
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyL-0007bb-Rt
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:54 -0400
Received: from [59.151.112.132] (port=52506 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bARy7-0007IT-4k; Tue, 07 Jun 2016 21:07:40 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7473522"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jun 2016 09:07:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 58A0C41C0B99;
	Wed,  8 Jun 2016 09:07:29 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 8 Jun 2016 09:07:28 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
To: qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Jeff Cody
	<jcody@redhat.com>
CC: qemu block <qemu-block@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
	Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert"
	<dgilbert@redhat.com>, Dong Eddie <eddie.dong@intel.com>, Jiang Yunhong
	<yunhong.jiang@intel.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, 
	Gonglei <arei.gonglei@huawei.com>, Wen Congyang <wency@cn.fujitsu.com>, 
	Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Date: Wed, 8 Jun 2016 09:11:32 +0800
Message-ID: <1465348292-26750-11-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 58A0C41C0B99.A14C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v20 10/10] support replication driver in
 blockdev-add
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
X-List-Received-Date: Wed, 08 Jun 2016 01:08:00 -0000

From: Wen Congyang <wency@cn.fujitsu.com>

Signed-off-by: Wen Congyang <wency@cn.fujitsu.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/block-core.json | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index e56cdf4..b9f9839 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -248,6 +248,7 @@
 #       2.3: 'host_floppy' deprecated
 #       2.5: 'host_floppy' dropped
 #       2.6: 'luks' added
+#       2.7: 'replication' added
 #
 # @backing_file: #optional the name of the backing file (for copy-on-write)
 #
@@ -1632,6 +1633,7 @@
 # Drivers that are supported in block device operations.
 #
 # @host_device, @host_cdrom: Since 2.1
+# @replication: Since 2.7
 #
 # Since: 2.0
 ##
@@ -1639,8 +1641,8 @@
   'data': [ 'archipelago', 'blkdebug', 'blkverify', 'bochs', 'cloop',
             'dmg', 'file', 'ftp', 'ftps', 'host_cdrom', 'host_device',
             'http', 'https', 'luks', 'null-aio', 'null-co', 'parallels',
-            'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'tftp', 'vdi', 'vhdx',
-            'vmdk', 'vpc', 'vvfat' ] }
+            'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'replication', 'tftp',
+            'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
 
 ##
 # @BlockdevOptionsFile
@@ -2045,6 +2047,19 @@
 { 'enum' : 'ReplicationMode', 'data' : [ 'primary', 'secondary' ] }
 
 ##
+# @BlockdevOptionsReplication
+#
+# Driver specific block device options for replication
+#
+# @mode: the replication mode
+#
+# Since: 2.7
+##
+{ 'struct': 'BlockdevOptionsReplication',
+  'base': 'BlockdevOptionsGenericFormat',
+  'data': { 'mode': 'ReplicationMode'  } }
+
+##
 # @BlockdevOptions
 #
 # Options for creating a block device.  Many options are available for all
@@ -2125,6 +2140,7 @@
       'quorum':     'BlockdevOptionsQuorum',
       'raw':        'BlockdevOptionsGenericFormat',
 # TODO rbd: Wait for structured options
+      'replication':'BlockdevOptionsReplication',
 # TODO sheepdog: Wait for structured options
 # TODO ssh: Should take InetSocketAddress for 'host'?
       'tftp':       'BlockdevOptionsFile',
-- 
1.9.3




