Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEfT5-00039z-Bz
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 09:44:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>) id 1YETUY-0003fn-A4
	for qemu-trivial@nongnu.org; Thu, 22 Jan 2015 20:56:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>) id 1YETUX-0003mY-4N
	for qemu-trivial@nongnu.org; Thu, 22 Jan 2015 20:56:58 -0500
Received: from mail-qc0-x236.google.com ([2607:f8b0:400d:c01::236]:39472)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>)
	id 1YETUV-0003lI-4m; Thu, 22 Jan 2015 20:56:55 -0500
Received: by mail-qc0-f182.google.com with SMTP id l6so4397503qcy.13;
	Thu, 22 Jan 2015 17:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qSJvZh+u0TKVwF5E+BLLyUCejzCXFu05xMhrukvxZ4s=;
	b=ET9PyNxI/b1BmUwz1XfEpglvMZGH3amXs9DC9A1KBH0aBY3zeQaoFWBSHSSK0Jao32
	7SWCpT15zlDDhVHFuSE6CVHCe9ocsBaQ6IZa0UYHP2LEVPljcShIzwdbnW51r0QFGPja
	AFRQETMJMgU7Lo2xMtO1PJORhDcijMv+BgDKXSX++q8l9/mghIrCYyuwoJ8Z9X0HKNIR
	vLkRiWOuwHwaEucT9mGZWpKKZZJaXUXlXlolYK/0JW2arSY8DAONRx/QqYtVcx/4s1Ao
	19Gp/X72ubljZwVLCnALnL/T+AiugkA587xN1dWfqmUT8CeF3IVHUbtWEnqVaEWlo8f5
	ZeyQ==
X-Received: by 10.224.69.200 with SMTP id a8mr9267926qaj.40.1421978214689;
	Thu, 22 Jan 2015 17:56:54 -0800 (PST)
Received: from localhost.localdomain (200-161-251-224.dsl.telesp.net.br.
	[200.161.251.224])
	by mx.google.com with ESMTPSA id t36sm175312qge.35.2015.01.22.17.56.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Jan 2015 17:56:54 -0800 (PST)
From: Julio Faracco <jcfaracco@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Jan 2015 23:53:41 -0200
Message-Id: <1421978021-3609-2-git-send-email-jcfaracco@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1421978021-3609-1-git-send-email-jcfaracco@gmail.com>
References: <1421978021-3609-1-git-send-email-jcfaracco@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::236
X-Mailman-Approved-At: Fri, 23 Jan 2015 09:44:14 -0500
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com,
	Julio Faracco <jcfaracco@gmail.com>
Subject: [Qemu-trivial] [PATCH 2/2] qcow2-snapshot: Fixing bug of creating
	snapshots with the same name.
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
X-List-Received-Date: Fri, 23 Jan 2015 01:56:59 -0000

This commit fixes the bug #1396497. You can create multiple snapshots with
the same name using 'qemu-img'. When you want to delete someone passing the
name, it will remove the first occurence of the snapshot with that name.
This commit fixes it.

Before:
$ qemu-img snapshot -c foo debian.qcow2
$ qemu-img snapshot -c foo debian.qcow2
$ qemu-img snapshot -c foo debian.qcow2
$ qemu-img snapshot -l debian.qcow2
ID        TAG                 VM SIZE                DATE       VM CLOCK
1         foo                    220M 2015-01-21 16:22:41   00:02:50.862
2         foo                    130M 2015-01-22 11:14:55   00:00:40.132
3         foo                     65M 2015-01-22 11:16:32   00:01:13.414

Now:
$ qemu-img snapshot -c foo debian.qcow2
$ qemu-img snapshot -c foo debian.qcow2
qemu-img: Could not create snapshot 'foo': -17 (File exists)
$ qemu-img snapshot -l debian.qcow2
ID        TAG                 VM SIZE                DATE       VM CLOCK
1         foo                    220M 2015-01-21 16:22:41   00:02:50.862

Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
---
 block/qcow2-snapshot.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index c7d4cfe..873ac49 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -356,8 +356,9 @@ int qcow2_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
         find_new_snapshot_id(bs, sn_info->id_str, sizeof(sn_info->id_str));
     }
 
-    /* Check that the ID is unique */
-    if (find_snapshot_by_id_or_name(bs, sn_info->id_str) >= 0) {
+    /* Check that the ID and Name is unique */
+    if (find_snapshot_by_id_or_name(bs, sn_info->id_str) >= 0 ||
+        find_snapshot_by_id_or_name(bs, sn_info->name) >= 0 ) {
         return -EEXIST;
     }
 
-- 
1.9.1


