Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQTVk-0006FI-LF
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 23:23:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVb-0005on-Cv
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVa-0006YU-Im
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:39 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:11283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YQTVQ-0006Sz-6u; Tue, 24 Feb 2015 23:23:28 -0500
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCH13705; Wed, 25 Feb 2015 12:23:25 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml428-hub.china.huawei.com
	(10.82.67.183) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Feb 2015 12:23:15 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Feb 2015 12:22:37 +0800
Message-ID: <1424838157-5524-12-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
References: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.54ED4E3D.015A, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: eaa6c1be995068698477328884105e29
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v2 11/11] vhost: Remove superfluous '\n'
	around error_report()
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
X-List-Received-Date: Wed, 25 Feb 2015 04:23:41 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
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
1.7.12.4



