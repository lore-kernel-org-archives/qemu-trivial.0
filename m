Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIxAI-0007ty-8k
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 05:26:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxAE-0007mW-Av
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxAD-0003Zv-I6
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YIx9z-0003To-NO; Wed, 04 Feb 2015 05:26:15 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t14AQApE002643
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Feb 2015 05:26:10 -0500
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t14AQ8Nx023800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Feb 2015 05:26:09 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1971E303E243; Wed,  4 Feb 2015 11:26:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Feb 2015 11:26:05 +0100
Message-Id: <1423045567-29855-5-git-send-email-armbru@redhat.com>
In-Reply-To: <1423045567-29855-1-git-send-email-armbru@redhat.com>
References: <1423045567-29855-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, arei.gonglei@huawei.com, eblake@redhat.com,
	thuth@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH v2 4/6] rdma: g_malloc0() can't fail,
	bury dead error handling
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
X-List-Received-Date: Wed, 04 Feb 2015 10:26:31 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
---
 migration/rdma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index b32dbdf..306570d 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1147,9 +1147,6 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
     /* allocate memory to store chunk MRs */
     if (!block->pmr) {
         block->pmr = g_malloc0(block->nb_chunks * sizeof(struct ibv_mr *));
-        if (!block->pmr) {
-            return -1;
-        }
     }
 
     /*
-- 
1.9.3


