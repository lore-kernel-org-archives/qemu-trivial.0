Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAaxA-0004cq-03
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 06:43:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bAax7-0004ak-AR
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 06:43:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bAax6-0006cw-G7
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 06:43:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26592)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bAawx-0006VZ-4u; Wed, 08 Jun 2016 06:43:03 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3A3063E18;
	Wed,  8 Jun 2016 10:43:02 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (vpn1-6-33.ams2.redhat.com
	[10.36.6.33])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u58Ah0s2031643; Wed, 8 Jun 2016 06:43:01 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>
Date: Wed,  8 Jun 2016 11:42:56 +0100
Message-Id: <1465382576-25552-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 08 Jun 2016 10:43:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] ui: fix regression in printing VNC host/port
 on startup
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
X-List-Received-Date: Wed, 08 Jun 2016 10:43:14 -0000

If VNC is chosen as the compile time default display backend,
QEMU will print the host/port it listens on at startup.
Previously this would look like

  VNC server running on '::1:5900'

but in 04d2529da27db512dcbd5e99d0e26d333f16efcc the ':' was
accidentally replaced with a ';'. This the ':' back.

Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 ui/vnc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index c862fdc..75ae2a7 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3225,7 +3225,7 @@ char *vnc_display_local_addr(const char *id)
         qapi_free_SocketAddress(addr);
         return NULL;
     }
-    ret = g_strdup_printf("%s;%s", addr->u.inet.data->host,
+    ret = g_strdup_printf("%s:%s", addr->u.inet.data->host,
                           addr->u.inet.data->port);
     qapi_free_SocketAddress(addr);
 
-- 
2.5.5


