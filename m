Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTHHc-00020f-5F
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 16:56:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTHHY-0001u3-QP
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:56:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTHHX-0008PI-Pz
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 16:56:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46859)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTHHM-0008LD-Nk; Wed, 04 Mar 2015 16:56:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 639DC40961;
	Thu,  5 Mar 2015 00:56:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EEFAF956;
	Wed,  4 Mar 2015 20:07:08 +0300 (MSK)
Received: (nullmailer pid 17561 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:55 +0300
Message-Id: <79a3266b85f9dc7a1630f7604829bb353f8b73c7.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 38/47] vhost_net: Add missing 'static'
	attribute
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
X-List-Received-Date: Wed, 04 Mar 2015 21:56:45 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes a warning from smatch.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/vhost_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 4e3a061..ebfb6db 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -56,7 +56,7 @@ static const int kernel_feature_bits[] = {
 };
 
 /* Features supported by others. */
-const int user_feature_bits[] = {
+static const int user_feature_bits[] = {
     VIRTIO_F_NOTIFY_ON_EMPTY,
     VIRTIO_RING_F_INDIRECT_DESC,
     VIRTIO_RING_F_EVENT_IDX,
-- 
2.1.4


