Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOZXg-000092-LW
	for mharc-qemu-trivial@gnu.org; Wed, 17 Oct 2012 15:44:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1TOZXe-0008UN-Aj
	for qemu-trivial@nongnu.org; Wed, 17 Oct 2012 15:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1TOZXd-000475-J0
	for qemu-trivial@nongnu.org; Wed, 17 Oct 2012 15:44:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58328)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1TOZXa-00046X-2w; Wed, 17 Oct 2012 15:44:30 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9HJiTtE024334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 17 Oct 2012 15:44:29 -0400
Received: from doriath.home (ovpn-113-93.phx2.redhat.com [10.3.113.93])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9HJiRU7006813; Wed, 17 Oct 2012 15:44:28 -0400
Date: Wed, 17 Oct 2012 16:45:25 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: qemu-devel <qemu-devel@nongnu.org>
Message-ID: <20121017164525.0e9b2941@doriath.home>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Subject: [Qemu-trivial] [PATCH] block: bdrv_create(): don't leak
	cco.filename on error
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
X-List-Received-Date: Wed, 17 Oct 2012 19:44:35 -0000


Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>
---
 block.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 5e8184f..63bf768 100644
--- a/block.c
+++ b/block.c
@@ -379,7 +379,8 @@ int bdrv_create(BlockDriver *drv, const char* filename,
     };
 
     if (!drv->bdrv_create) {
-        return -ENOTSUP;
+        ret = -ENOTSUP;
+        goto out;
     }
 
     if (qemu_in_coroutine()) {
@@ -394,8 +395,9 @@ int bdrv_create(BlockDriver *drv, const char* filename,
     }
 
     ret = cco.ret;
-    g_free(cco.filename);
 
+out:
+    g_free(cco.filename);
     return ret;
 }
 
-- 
1.7.12.315.g682ce8b


