Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIxAH-0007ta-Ty
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 05:26:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxA8-0007dO-V9
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxA4-0003Wz-WF
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57004)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YIxA1-0003Up-IE; Wed, 04 Feb 2015 05:26:17 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t14AQC9D007601
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Feb 2015 05:26:12 -0500
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t14AQAak026652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Feb 2015 05:26:11 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3E531303D51E; Wed,  4 Feb 2015 11:26:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Feb 2015 11:26:07 +0100
Message-Id: <1423045567-29855-7-git-send-email-armbru@redhat.com>
In-Reply-To: <1423045567-29855-1-git-send-email-armbru@redhat.com>
References: <1423045567-29855-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, arei.gonglei@huawei.com, eblake@redhat.com,
	thuth@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH v2 6/6] translate-all: Use g_try_malloc() for
	dynamic translator buffer
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
X-List-Received-Date: Wed, 04 Feb 2015 10:26:29 -0000

The USE_MMAP code can fail, and the caller handles the failure
already.  Let the !USE_MMAP code fail as well, for consistency.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
---
 translate-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/translate-all.c b/translate-all.c
index 4a1b64f..9f47ce7 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -631,7 +631,7 @@ static inline void *alloc_code_gen_buffer(void)
 #else
 static inline void *alloc_code_gen_buffer(void)
 {
-    void *buf = g_malloc(tcg_ctx.code_gen_buffer_size);
+    void *buf = g_try_malloc(tcg_ctx.code_gen_buffer_size);
 
     if (buf == NULL) {
         return NULL;
-- 
1.9.3


