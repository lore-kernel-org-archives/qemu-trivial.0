Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEfT5-00039a-6y
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 09:44:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>) id 1YETUV-0003dW-M7
	for qemu-trivial@nongnu.org; Thu, 22 Jan 2015 20:56:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>) id 1YETUU-0003lE-Va
	for qemu-trivial@nongnu.org; Thu, 22 Jan 2015 20:56:55 -0500
Received: from mail-qa0-x229.google.com ([2607:f8b0:400d:c00::229]:51405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>)
	id 1YETUP-0003kh-U4; Thu, 22 Jan 2015 20:56:49 -0500
Received: by mail-qa0-f41.google.com with SMTP id bm13so4033816qab.0;
	Thu, 22 Jan 2015 17:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fz/eyWL+vMms/2VcmyKf6L9AHQxZ73NVM59VlUlxi+c=;
	b=IoMKgsZDsAIBypVY297zK7DCw1TyYUmpqHplFYhttao0Z/61LhKC7EfhX9+d24fZQn
	T/SsIIA9z4V0shoa91ch8lTpRU1Zxk+QFWPLuyA/a515UBnsXpr77aDbjDSpqqIf+5uY
	DVHYIy4mIyFi3hL215sgKSDnXMr/ktSoxcAebmE/4KsFILAfbosnNzH3jG+VAd6vu+b5
	6szb2Ozvwwq/G3L94xpbDd5NS6fPv3ew15ZSWodbLT375KobMqM1kcqGfzqgrj35BTb6
	+TK5leixFZkqH8d5VVT2ANGCBcTTtUu9YDHpUE1LcQw6B7eCgBYWAUmzRh7g/jVn6yRP
	XAMA==
X-Received: by 10.224.43.10 with SMTP id u10mr9291202qae.20.1421978209205;
	Thu, 22 Jan 2015 17:56:49 -0800 (PST)
Received: from localhost.localdomain (200-161-251-224.dsl.telesp.net.br.
	[200.161.251.224])
	by mx.google.com with ESMTPSA id t36sm175312qge.35.2015.01.22.17.56.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Jan 2015 17:56:48 -0800 (PST)
From: Julio Faracco <jcfaracco@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Jan 2015 23:53:40 -0200
Message-Id: <1421978021-3609-1-git-send-email-jcfaracco@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::229
X-Mailman-Approved-At: Fri, 23 Jan 2015 09:44:14 -0500
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com,
	Julio Faracco <jcfaracco@gmail.com>
Subject: [Qemu-trivial] [PATCH 1/2] qcow2-snapshot: Change filter function
	to avoid NULL parameter when a snapshot will be created.
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
X-List-Received-Date: Fri, 23 Jan 2015 01:56:56 -0000

This is a trivial patch to change the filter 'find_snapshot_by_id_and_name'
to 'find_snapshot_by_id_or_name'. The field 'Name' is not required. So this
change avoid NULL parameters. And use the correct function to filter.

Signed-off-by: Julio Faracco <jcfaracco@gmail.com>
---
 block/qcow2-snapshot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 5b3903c..c7d4cfe 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -357,7 +357,7 @@ int qcow2_snapshot_create(BlockDriverState *bs, QEMUSnapshotInfo *sn_info)
     }
 
     /* Check that the ID is unique */
-    if (find_snapshot_by_id_and_name(bs, sn_info->id_str, NULL) >= 0) {
+    if (find_snapshot_by_id_or_name(bs, sn_info->id_str) >= 0) {
         return -EEXIST;
     }
 
-- 
1.9.1


