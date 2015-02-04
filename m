Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIxAQ-0008AO-Hn
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 05:26:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxAO-000884-WC
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxAO-0003eo-4b
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51707)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YIxAM-0003cx-08; Wed, 04 Feb 2015 05:26:38 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t14AQAxE004125
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Feb 2015 05:26:10 -0500
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t14AQ8LF026634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Feb 2015 05:26:09 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E5541303E240; Wed,  4 Feb 2015 11:26:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Feb 2015 11:26:02 +0100
Message-Id: <1423045567-29855-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1423045567-29855-1-git-send-email-armbru@redhat.com>
References: <1423045567-29855-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, arei.gonglei@huawei.com, eblake@redhat.com,
	thuth@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH v2 1/6] onenand: g_malloc() can't fail,
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
X-List-Received-Date: Wed, 04 Feb 2015 10:26:41 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/block/onenand.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 348630d..1b2c893 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -346,15 +346,9 @@ static inline int onenand_prog_spare(OneNANDState *s, int sec, int secn,
 static inline int onenand_erase(OneNANDState *s, int sec, int num)
 {
     uint8_t *blankbuf, *tmpbuf;
+
     blankbuf = g_malloc(512);
-    if (!blankbuf) {
-        return 1;
-    }
     tmpbuf = g_malloc(512);
-    if (!tmpbuf) {
-        g_free(blankbuf);
-        return 1;
-    }
     memset(blankbuf, 0xff, 512);
     for (; num > 0; num--, sec++) {
         if (s->blk_cur) {
-- 
1.9.3


