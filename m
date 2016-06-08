Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bARyM-0001Do-5X
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 21:07:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyE-00016W-4b
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bARyC-0007Rm-Ii
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 21:07:46 -0400
Received: from [59.151.112.132] (port=52506 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bARxv-0007IT-Bi; Tue, 07 Jun 2016 21:07:29 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7473504"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jun 2016 09:07:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4075B41C0B99;
	Wed,  8 Jun 2016 09:07:17 +0800 (CST)
Received: from changlox.g08.fujitsu.local (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 8 Jun 2016 09:07:16 +0800
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
Date: Wed, 8 Jun 2016 09:11:22 +0800
Message-ID: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 4075B41C0B99.AFBB2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH v20 00/10] Block replication for continuous
 checkpoints
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
X-List-Received-Date: Wed, 08 Jun 2016 01:07:50 -0000

Block replication is a very important feature which is used for
continuous checkpoints(for example: COLO).

You can get the detailed information about block replication from here:
http://wiki.qemu.org/Features/BlockReplication

Usage:
Please refer to docs/block-replication.txt

You can get the patch here:
https://github.com/Pating/qemu/tree/changlox/block-replication-v20

You can get the patch with framework here:
https://github.com/Pating/qemu/tree/changlox/colo_framework_v19

TODO:
1. Continuous block replication. It will be started after basic functions
   are accepted.

Changs Log:
V20:
1. Rebase to the lastest code
2. Address comments from stefan
p8: 
1. error_setg() with an error message when check_top_bs() fails. 
2. remove bdrv_ref(s->hidden_disk->bs) since commit 5c438bc6
3. use bloc_job_cancel_sync() before active commit
p9: 
1. fix uninitialized 'pattern_buf'
2. introduce mkstemp(3) to fix unique filenames
3. use qemu_vfree() for qemu_blockalign() memory
4. add missing replication_start_all()
5. remove useless pattern for io_write()
V19:
1. Rebase to v2.6.0
2. Address comments from stefan
p3: a new patch that export interfaces for extra serialization
p8: 
1. call replication_stop() before freeing s->top_id
2. check top_bs
3. reopen file readonly in error return paths
4. enable extra serialization between read and COW
p9: try to hanlde SIGABRT
V18:
p6: add local_err in all replication callbacks to prevent "errp == NULL"
p7: add missing qemu_iovec_destroy(xxx)
V17:
1. Rebase to the lastest codes 
p2: refactor backup_do_checkpoint addressed comments from Jeff Cody
p4: fix bugs in "drive_add buddy xxx" hmp commands
p6: add "since: 2.7"
p7: fix bug in replication_close(), add missing "qapi/error.h", add test-replication 
p8: add "since: 2.7"
V16:
1. Rebase to the newest codes
2. Address comments from Stefan & hailiang
p3: we don't need this patch now
p4: add "top-id" parameters for secondary
p6: fix NULL pointer in replication callbacks, remove unnecessary typedefs, 
add doc comments that explain the semantics of Replication
p7: Refactor AioContext for thread-safe, remove unnecessary get_top_bs()
*Note*: I'm working on replication testcase now, will send out in V17
V15:
1. Rebase to the newest codes
2. Fix typos and coding style addresed Eric's comments
3. Address Stefan's comments
   1) Make backup_do_checkpoint public, drop the changes on BlockJobDriver
   2) Update the message and description for [PATCH 4/9]
   3) Make replication_(start/stop/do_checkpoint)_all as global interfaces
   4) Introduce AioContext lock to protect start/stop/do_checkpoint callbacks
   5) Use BdrvChild instead of holding on to BlockDriverState * pointers
4. Clear BDRV_O_INACTIVE for hidden disk's open_flags since commit 09e0c771  
5. Introduce replication_get_error_all to check replication status
6. Remove useless discard interface
V14:
1. Implement auto complete active commit
2. Implement active commit block job for replication.c
3. Address the comments from Stefan, add replication-specific API and data
   structure, also remove old block layer APIs
V13:
1. Rebase to the newest codes
2. Remove redundant marcos and semicolon in replication.c 
3. Fix typos in block-replication.txt
V12:
1. Rebase to the newest codes
2. Use backing reference to replcace 'allow-write-backing-file'
V11:
1. Reopen the backing file when starting blcok replication if it is not
   opened in R/W mode
2. Unblock BLOCK_OP_TYPE_BACKUP_SOURCE and BLOCK_OP_TYPE_BACKUP_TARGET
   when opening backing file
3. Block the top BDS so there is only one block job for the top BDS and
   its backing chain.
V10:
1. Use blockdev-remove-medium and blockdev-insert-medium to replace backing
   reference.
2. Address the comments from Eric Blake
V9:
1. Update the error messages
2. Rebase to the newest qemu
3. Split child add/delete support. These patches are sent in another patchset.
V8:
1. Address Alberto Garcia's comments
V7:
1. Implement adding/removing quorum child. Remove the option non-connect.
2. Simplify the backing refrence option according to Stefan Hajnoczi's suggestion
V6:
1. Rebase to the newest qemu.
V5:
1. Address the comments from Gong Lei
2. Speed the failover up. The secondary vm can take over very quickly even
   if there are too many I/O requests.
V4:
1. Introduce a new driver replication to avoid touch nbd and qcow2.
V3:
1: use error_setg() instead of error_set()
2. Add a new block job API
3. Active disk, hidden disk and nbd target uses the same AioContext
4. Add a testcase to test new hbitmap API
V2:
1. Redesign the secondary qemu(use image-fleecing)
2. Use Error objects to return error message
3. Address the comments from Max Reitz and Eric Blake

Changlong Xie (3):
  Backup: export interfaces for extra serialization
  Introduce new APIs to do replication operation
  tests: add unit test case for replication

Wen Congyang (7):
  unblock backup operations in backing file
  Backup: clear all bitmap when doing block checkpoint
  Link backup into block core
  docs: block replication's description
  auto complete active commit
  Implement new driver for block replication
  support replication driver in blockdev-add

 Makefile.objs                |   1 +
 block.c                      |  17 ++
 block/Makefile.objs          |   3 +-
 block/backup.c               |  59 +++-
 block/mirror.c               |  13 +-
 block/replication.c          | 657 +++++++++++++++++++++++++++++++++++++++++++
 blockdev.c                   |   2 +-
 docs/block-replication.txt   | 239 ++++++++++++++++
 include/block/block_backup.h |  17 ++
 include/block/block_int.h    |   3 +-
 qapi/block-core.json         |  33 ++-
 qemu-img.c                   |   2 +-
 replication.c                | 105 +++++++
 replication.h                | 176 ++++++++++++
 tests/.gitignore             |   1 +
 tests/Makefile               |   4 +
 tests/test-replication.c     | 555 ++++++++++++++++++++++++++++++++++++
 17 files changed, 1870 insertions(+), 17 deletions(-)
 create mode 100644 block/replication.c
 create mode 100644 docs/block-replication.txt
 create mode 100644 include/block/block_backup.h
 create mode 100644 replication.c
 create mode 100644 replication.h
 create mode 100644 tests/test-replication.c

-- 
1.9.3




