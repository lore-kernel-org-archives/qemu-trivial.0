Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZ1MI-00017A-Fw
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2012 10:28:02 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1TZ1MD-000146-At
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 10:28:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1TZ1MA-0000g2-8z
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 10:27:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59338)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1TZ1MA-0000fv-1L; Thu, 15 Nov 2012 10:27:54 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAFFRp8s027836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 15 Nov 2012 10:27:53 -0500
Received: from localhost (ovpn-112-20.ams2.redhat.com [10.36.112.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qAFEU55u032131; Thu, 15 Nov 2012 09:30:09 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 15 Nov 2012 15:29:53 +0100
Message-Id: <1352989793-7357-1-git-send-email-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] vmstate: drop orphan
	register_device_unmigratable() prototype
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
X-List-Received-Date: Thu, 15 Nov 2012 15:28:00 -0000

commit 38e0735eb76a1479917ef3501a208d4f70998494 ("ivshmem: use migration
blockers to prevent live migration in peer mode (v2)") removed the
definition of register_device_unmigratable() but forgot to remove the
declaration in the header file.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 vmstate.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/vmstate.h b/vmstate.h
index 623af0a..af10596 100644
--- a/vmstate.h
+++ b/vmstate.h
@@ -56,9 +56,6 @@ int register_savevm_live(DeviceState *dev,
                          void *opaque);
 
 void unregister_savevm(DeviceState *dev, const char *idstr, void *opaque);
-void register_device_unmigratable(DeviceState *dev, const char *idstr,
-                                                                void *opaque);
-
 
 typedef struct VMStateInfo VMStateInfo;
 typedef struct VMStateDescription VMStateDescription;
-- 
1.8.0


