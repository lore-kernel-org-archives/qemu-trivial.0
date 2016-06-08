Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bARyK-0001Bx-Kk
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 21:07:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyF-00017k-61
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyD-0007Sr-7P
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:47 -0400
Received: from [59.151.112.132] (port=21216 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bARxz-0007Jd-Fk; Tue, 07 Jun 2016 21:07:33 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7473511"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jun 2016 09:07:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 28C0541C0B99;
	Wed,  8 Jun 2016 09:07:23 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 8 Jun 2016 09:07:22 +0800
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
Date: Wed, 8 Jun 2016 09:11:27 +0800
Message-ID: <1465348292-26750-6-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 28C0541C0B99.A14E8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v20 05/10] docs: block replication's
 description
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
X-List-Received-Date: Wed, 08 Jun 2016 01:07:51 -0000

From: Wen Congyang <wency@cn.fujitsu.com>

Signed-off-by: Wen Congyang <wency@cn.fujitsu.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
---
 docs/block-replication.txt | 239 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 239 insertions(+)
 create mode 100644 docs/block-replication.txt

diff --git a/docs/block-replication.txt b/docs/block-replication.txt
new file mode 100644
index 0000000..c5fc18b
--- /dev/null
+++ b/docs/block-replication.txt
@@ -0,0 +1,239 @@
+Block replication
+----------------------------------------
+Copyright Fujitsu, Corp. 2016
+Copyright (c) 2016 Intel Corporation
+Copyright (c) 2016 HUAWEI TECHNOLOGIES CO., LTD.
+
+This work is licensed under the terms of the GNU GPL, version 2 or later.
+See the COPYING file in the top-level directory.
+
+Block replication is used for continuous checkpoints. It is designed
+for COLO (COarse-grain LOck-stepping) where the Secondary VM is running.
+It can also be applied for FT/HA (Fault-tolerance/High Assurance) scenario,
+where the Secondary VM is not running.
+
+This document gives an overview of block replication's design.
+
+== Background ==
+High availability solutions such as micro checkpoint and COLO will do
+consecutive checkpoints. The VM state of the Primary and Secondary VM is
+identical right after a VM checkpoint, but becomes different as the VM
+executes till the next checkpoint. To support disk contents checkpoint,
+the modified disk contents in the Secondary VM must be buffered, and are
+only dropped at next checkpoint time. To reduce the network transportation
+effort during a vmstate checkpoint, the disk modification operations of
+the Primary disk are asynchronously forwarded to the Secondary node.
+
+== Workflow ==
+The following is the image of block replication workflow:
+
+        +----------------------+            +------------------------+
+        |Primary Write Requests|            |Secondary Write Requests|
+        +----------------------+            +------------------------+
+                  |                                       |
+                  |                                      (4)
+                  |                                       V
+                  |                              /-------------\
+                  |      Copy and Forward        |             |
+                  |---------(1)----------+       | Disk Buffer |
+                  |                      |       |             |
+                  |                     (3)      \-------------/
+                  |                 speculative      ^
+                  |                write through    (2)
+                  |                      |           |
+                  V                      V           |
+           +--------------+           +----------------+
+           | Primary Disk |           | Secondary Disk |
+           +--------------+           +----------------+
+
+    1) Primary write requests will be copied and forwarded to Secondary
+       QEMU.
+    2) Before Primary write requests are written to Secondary disk, the
+       original sector content will be read from Secondary disk and
+       buffered in the Disk buffer, but it will not overwrite the existing
+       sector content (it could be from either "Secondary Write Requests" or
+       previous COW of "Primary Write Requests") in the Disk buffer.
+    3) Primary write requests will be written to Secondary disk.
+    4) Secondary write requests will be buffered in the Disk buffer and it
+       will overwrite the existing sector content in the buffer.
+
+== Architecture ==
+We are going to implement block replication from many basic
+blocks that are already in QEMU.
+
+         virtio-blk       ||
+             ^            ||                            .----------
+             |            ||                            | Secondary
+        1 Quorum          ||                            '----------
+         /      \         ||
+        /        \        ||
+   Primary    2 filter
+     disk         ^                                                             virtio-blk
+                  |                                                                  ^
+                3 NBD  ------->  3 NBD                                               |
+                client    ||     server                                          2 filter
+                          ||        ^                                                ^
+--------.                 ||        |                                                |
+Primary |                 ||  Secondary disk <--------- hidden-disk 5 <--------- active-disk 4
+--------'                 ||        |          backing        ^       backing
+                          ||        |                         |
+                          ||        |                         |
+                          ||        '-------------------------'
+                          ||           drive-backup sync=none 6
+
+1) The disk on the primary is represented by a block device with two
+children, providing replication between a primary disk and the host that
+runs the secondary VM. The read pattern (fifo) for quorum can be extended
+to make the primary always read from the local disk instead of going through
+NBD.
+
+2) The new block filter (the name is replication) will control the block
+replication.
+
+3) The secondary disk receives writes from the primary VM through QEMU's
+embedded NBD server (speculative write-through).
+
+4) The disk on the secondary is represented by a custom block device
+(called active-disk). It should start as an empty disk, and the format
+should support bdrv_make_empty() and backing file.
+
+5) The hidden-disk is created automatically. It buffers the original content
+that is modified by the primary VM. It should also start as an empty disk,
+and the driver supports bdrv_make_empty() and backing file.
+
+6) The drive-backup job (sync=none) is run to allow hidden-disk to buffer
+any state that would otherwise be lost by the speculative write-through
+of the NBD server into the secondary disk. So before block replication,
+the primary disk and secondary disk should contain the same data.
+
+== Failure Handling ==
+There are 7 internal errors when block replication is running:
+1. I/O error on primary disk
+2. Forwarding primary write requests failed
+3. Backup failed
+4. I/O error on secondary disk
+5. I/O error on active disk
+6. Making active disk or hidden disk empty failed
+7. Doing failover failed
+In case 1 and 5, we just report the error to the disk layer. In case 2, 3,
+4 and 6, we just report block replication's error to FT/HA manager (which
+decides when to do a new checkpoint, when to do failover).
+In case 7, if active commit failed, we use replication failover failed state
+in Secondary's write operation (what decides which target to write).
+
+== New block driver interface ==
+We add three block driver interfaces to control block replication:
+a. replication_start_all()
+   Start block replication, called in migration/checkpoint thread.
+   We must call block_replication_start_all() in secondary QEMU before
+   calling block_replication_start_all() in primary QEMU. The caller
+   must hold the I/O mutex lock if it is in migration/checkpoint
+   thread.
+b. replication_do_checkpoint_all()
+   This interface is called after all VM state is transferred to
+   Secondary QEMU. The Disk buffer will be dropped in this interface.
+   The caller must hold the I/O mutex lock if it is in migration/checkpoint
+   thread.
+c. replication_get_error_all()
+   This interface is called to check if error happened in replication.
+   The caller must hold the I/O mutex lock if it is in migration/checkpoint
+   thread.
+d. replication_stop_all()
+   It is called on failover. We will flush the Disk buffer into
+   Secondary Disk and stop block replication. The vm should be stopped
+   before calling it if you use this API to shutdown the guest, or other
+   things except failover. The caller must hold the I/O mutex lock if it is
+   in migration/checkpoint thread.
+
+== Usage ==
+Primary:
+  -drive if=xxx,driver=quorum,read-pattern=fifo,id=colo1,vote-threshold=1,\
+         children.0.file.filename=1.raw,\
+         children.0.driver=raw
+
+  Run qmp command in primary qemu:
+    { 'execute': 'human-monitor-command',
+      'arguments': {
+          'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=xxxx,file.port=xxxx,file.export=colo1,node-name=nbd_client1'
+      }
+    }
+    { 'execute': 'x-blockdev-change',
+      'arguments': {
+          'parent': 'colo1',
+          'node': 'nbd_client1'
+      }
+    }
+  Note:
+  1. There should be only one NBD Client for each primary disk.
+  2. host is the secondary physical machine's hostname or IP
+  3. Each disk must have its own export name.
+  4. It is all a single argument to -drive and you should ignore the
+     leading whitespace.
+  5. The qmp command line must be run after running qmp command line in
+     secondary qemu.
+  6. After failover we need remove children.1 (replication driver).
+
+Secondary:
+  -drive if=none,driver=raw,file.filename=1.raw,id=colo1 \
+  -drive if=xxx,id=topxxx,driver=replication,mode=secondary,top-id=topxxx\
+         file.file.filename=active_disk.qcow2,\
+         file.driver=qcow2,\
+         file.backing.file.filename=hidden_disk.qcow2,\
+         file.backing.driver=qcow2,\
+         file.backing.backing=colo1
+
+  Then run qmp command in secondary qemu:
+    { 'execute': 'nbd-server-start',
+      'arguments': {
+          'addr': {
+              'type': 'inet',
+              'data': {
+                  'host': 'xxx',
+                  'port': 'xxx'
+              }
+          }
+      }
+    }
+    { 'execute': 'nbd-server-add',
+      'arguments': {
+          'device': 'colo1',
+          'writable': true
+      }
+    }
+
+  Note:
+  1. The export name in secondary QEMU command line is the secondary
+     disk's id.
+  2. The export name for the same disk must be the same
+  3. The qmp command nbd-server-start and nbd-server-add must be run
+     before running the qmp command migrate on primary QEMU
+  4. Active disk, hidden disk and nbd target's length should be the
+     same.
+  5. It is better to put active disk and hidden disk in ramdisk.
+  6. It is all a single argument to -drive, and you should ignore
+     the leading whitespace.
+
+After Failover:
+Primary:
+  The secondary host is down, so we should run the following qmp command
+  to remove the nbd child from the quorum:
+  { 'execute': 'x-blockdev-change',
+    'arguments': {
+        'parent': 'colo1',
+        'child': 'children.1'
+    }
+  }
+  { 'execute': 'human-monitor-command',
+    'arguments': {
+        'command-line': 'drive_del xxxx'
+    }
+  }
+  Note: there is no qmp command to remove the blockdev now
+
+Secondary:
+  The primary host is down, so we should do the following thing:
+  { 'execute': 'nbd-server-stop' }
+
+TODO:
+1. Continuous block replication
+2. Shared disk
-- 
1.9.3




