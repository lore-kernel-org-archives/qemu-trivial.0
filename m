Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TJqt9-00037n-2G
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2012 15:15:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1TJqsm-00023K-Cz
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2012 15:14:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1TJqsl-0003oC-66
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2012 15:14:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1TJqsd-0003iM-PN; Thu, 04 Oct 2012 15:14:43 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q94JEf6d029978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 4 Oct 2012 15:14:41 -0400
Received: from blackpad.lan.raisama.net (vpn1-7-183.gru2.redhat.com
	[10.97.7.183])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q94JEekO026528; Thu, 4 Oct 2012 15:14:41 -0400
Received: by blackpad.lan.raisama.net (Postfix, from userid 500)
	id D6D29203603; Thu,  4 Oct 2012 16:15:41 -0300 (BRT)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Oct 2012 16:15:21 -0300
Message-Id: <1349378133-25644-2-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1349378133-25644-1-git-send-email-ehabkost@redhat.com>
References: <1349378133-25644-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Anthony Liguori <anthony@codemonkey.ws>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [RFC 01/13] qdev: kill bogus comment
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
X-List-Received-Date: Thu, 04 Oct 2012 19:14:55 -0000

When the DeviceInfo code was removed, the comment describing
qdev_subclass_init() was left in the code by mistake. Remove it.

Cc: qemu-trivial@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/qdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/qdev.c b/hw/qdev.c
index b5a52ac..a7270a5 100644
--- a/hw/qdev.c
+++ b/hw/qdev.c
@@ -34,7 +34,6 @@ int qdev_hotplug = 0;
 static bool qdev_hot_added = false;
 static bool qdev_hot_removed = false;
 
-/* Register a new device type.  */
 const VMStateDescription *qdev_get_vmsd(DeviceState *dev)
 {
     DeviceClass *dc = DEVICE_GET_CLASS(dev);
-- 
1.7.11.4


