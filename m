Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTGC3-0002FL-5c
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 15:46:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGBw-000213-Ea
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:46:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGBv-0001f2-Hn
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:46:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42361)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTGBc-0001Ze-Cx; Wed, 04 Mar 2015 15:46:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 52BFB40926;
	Wed,  4 Mar 2015 23:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CAA5F97E;
	Wed,  4 Mar 2015 20:07:11 +0300 (MSK)
Received: (nullmailer pid 17528 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:39 +0300
Message-Id: <35d2eb189745ba2078caeea4aa42460a329cc055.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 22/47] vhost: Remove superfluous '\n' around
	error_report()
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
X-List-Received-Date: Wed, 04 Mar 2015 20:46:53 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/virtio/vhost-backend.c | 2 +-
 net/vhost-user.c          | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index ff4f200..4d68a27 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -61,7 +61,7 @@ int vhost_set_backend_type(struct vhost_dev *dev, VhostBackendType backend_type)
         dev->vhost_ops = &user_ops;
         break;
     default:
-        error_report("Unknown vhost backend type\n");
+        error_report("Unknown vhost backend type");
         r = -1;
     }
 
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 24e050c..23babd6 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -122,12 +122,12 @@ static void net_vhost_user_event(void *opaque, int event)
     case CHR_EVENT_OPENED:
         vhost_user_start(s);
         net_vhost_link_down(s, false);
-        error_report("chardev \"%s\" went up\n", s->chr->label);
+        error_report("chardev \"%s\" went up", s->chr->label);
         break;
     case CHR_EVENT_CLOSED:
         net_vhost_link_down(s, true);
         vhost_user_stop(s);
-        error_report("chardev \"%s\" went down\n", s->chr->label);
+        error_report("chardev \"%s\" went down", s->chr->label);
         break;
     }
 }
-- 
2.1.4


