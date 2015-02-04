Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIxAI-0007uf-FV
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 05:26:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxAA-0007er-II
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxA4-0003Wt-R6
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YIxA0-0003UT-NH; Wed, 04 Feb 2015 05:26:16 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t14AQCCm019987
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Feb 2015 05:26:12 -0500
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t14AQAoW029360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Feb 2015 05:26:11 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 31CAC3008C29; Wed,  4 Feb 2015 11:26:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Feb 2015 11:26:06 +0100
Message-Id: <1423045567-29855-6-git-send-email-armbru@redhat.com>
In-Reply-To: <1423045567-29855-1-git-send-email-armbru@redhat.com>
References: <1423045567-29855-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, arei.gonglei@huawei.com, eblake@redhat.com,
	thuth@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH v2 5/6] vnc: g_realloc() can't fail,
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
Reviewed-by: Thomas Huth <thuth@linux.vnet.ibm.com>
---
 ui/vnc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index a742c90..02552ee 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -659,10 +659,6 @@ void buffer_reserve(Buffer *buffer, size_t len)
     if ((buffer->capacity - buffer->offset) < len) {
         buffer->capacity += (len + 1024);
         buffer->buffer = g_realloc(buffer->buffer, buffer->capacity);
-        if (buffer->buffer == NULL) {
-            fprintf(stderr, "vnc: out of memory\n");
-            exit(1);
-        }
     }
 }
 
-- 
1.9.3


