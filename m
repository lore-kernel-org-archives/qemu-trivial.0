Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTal0-0007Rk-Rd
	for mharc-qemu-trivial@gnu.org; Fri, 28 Mar 2014 13:39:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WTakp-0007C1-Kp
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 13:39:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WTakg-0005yF-FK
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 13:39:43 -0400
Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d]:42858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>)
	id 1WTakO-0005vF-0z; Fri, 28 Mar 2014 13:39:16 -0400
Received: by mail-pd0-f173.google.com with SMTP id z10so5136535pdj.4
	for <multiple recipients>; Fri, 28 Mar 2014 10:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CQ4RjM32kMXh4UTeGd1wQB/NUzVDc46gt/rOVpLxf8c=;
	b=neqd2zdvcEkTTMNtWlp++2zA3zbrVDVODb7uASZ6tFA5M0Umn3GhzM5G+vm7I4NLMP
	UdD2LGQHDunOfbSWz63y4+AuRb95KBnb5ZVl6ApNIaH8EAaNpje3GWtiNc4TcUROdlRO
	W+a1NqtvqesuKpheNIrcU8dH92s4MgKDaDRsBA56IOLYV9c26EVNjdPNP67LU6ZqGQp3
	PkO0BuV0oJdzRIUzDAPSlHkdDO0/OwVDRi2nRHsSVZ13ZCRDI3QHLo3fFAKOLsRILN6V
	GHnCOFBi+PPRKr4NnN4LC0FCT0kr/33XQ2UhcR+TIcPeUBAE5RPucZoViDnhnJszY4qq
	DfqQ==
X-Received: by 10.68.222.105 with SMTP id ql9mr2658937pbc.4.1396028354486;
	Fri, 28 Mar 2014 10:39:14 -0700 (PDT)
Received: from prasad-desktop ([117.195.6.156])
	by mx.google.com with ESMTPSA id
	bz4sm25736749pbb.12.2014.03.28.10.39.10 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Mar 2014 10:39:13 -0700 (PDT)
Received: by prasad-desktop (Postfix, from userid 1000)
	id 7619AA00873; Fri, 28 Mar 2014 23:09:06 +0530 (IST)
From: Prasad Joshi <prasadjoshi.linux@gmail.com>
To: prasadjoshi.linux@gmail.com
Date: Fri, 28 Mar 2014 23:08:58 +0530
Message-Id: <1396028338-3810-1-git-send-email-prasadjoshi.linux@gmail.com>
X-Mailer: git-send-email 1.8.1.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22d
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] qcow2: fix two memory leaks in qcow2_open
	error code path
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
X-List-Received-Date: Fri, 28 Mar 2014 17:39:52 -0000

Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
---
 block/qcow2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index b9dc960..10eccf9 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -506,6 +506,7 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
                                    s->incompatible_features &
                                    ~QCOW2_INCOMPAT_MASK);
         ret = -ENOTSUP;
+        g_free(feature_table);
         goto fail;
     }
 
@@ -745,6 +746,9 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
     if (s->l2_table_cache) {
         qcow2_cache_destroy(bs, s->l2_table_cache);
     }
+    if (s->refcount_block_cache) {
+        qcow2_cache_destroy(bs, s->refcount_block_cache);
+    }
     g_free(s->cluster_cache);
     qemu_vfree(s->cluster_data);
     return ret;
-- 
1.8.1.2


