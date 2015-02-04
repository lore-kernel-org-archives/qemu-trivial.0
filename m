Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIxA8-0007bm-De
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 05:26:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxA5-0007VJ-Io
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxA4-0003Wm-PI
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YIx9z-0003Tw-VD; Wed, 04 Feb 2015 05:26:16 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t14AQAdj024907
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Feb 2015 05:26:10 -0500
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t14AQ8wi023802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Feb 2015 05:26:09 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id F379A3008ADE; Wed,  4 Feb 2015 11:26:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Feb 2015 11:26:03 +0100
Message-Id: <1423045567-29855-3-git-send-email-armbru@redhat.com>
In-Reply-To: <1423045567-29855-1-git-send-email-armbru@redhat.com>
References: <1423045567-29855-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, arei.gonglei@huawei.com, eblake@redhat.com,
	thuth@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH v2 2/6] rtl8139: g_malloc() can't fail,
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
X-List-Received-Date: Wed, 04 Feb 2015 10:26:22 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/net/rtl8139.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 6fa9e0a..b55e438 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -2075,20 +2075,6 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
                 "length to %d\n", txsize);
     }
 
-    if (!s->cplus_txbuffer)
-    {
-        /* out of memory */
-
-        DPRINTF("+++ C+ mode transmiter failed to reallocate %d bytes\n",
-            s->cplus_txbuffer_len);
-
-        /* update tally counter */
-        ++s->tally_counters.TxERR;
-        ++s->tally_counters.TxAbt;
-
-        return 0;
-    }
-
     /* append more data to the packet */
 
     DPRINTF("+++ C+ mode transmit reading %d bytes from host memory at "
-- 
1.9.3


