Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwFLN-0007P6-KL
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2015 15:16:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZwFLL-0007LV-FE
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 15:16:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZwFLK-0005Ld-Jy
	for qemu-trivial@nongnu.org; Tue, 10 Nov 2015 15:16:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37925)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZwFLI-0005L8-Bb; Tue, 10 Nov 2015 15:16:36 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id E3E5D71;
	Tue, 10 Nov 2015 20:16:35 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-6-38.ams2.redhat.com [10.36.6.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAAKGBos029221; Tue, 10 Nov 2015 15:16:35 -0500
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 10 Nov 2015 21:16:11 +0100
Message-Id: <1447186571-27672-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1447186571-27672-1-git-send-email-thuth@redhat.com>
References: <1447186571-27672-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 4/4] hw/core/qdev: Remove superfluous return
	statement
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
X-List-Received-Date: Tue, 10 Nov 2015 20:16:40 -0000

The "return;" statement at the end of device_set_realized()
does not make much sense, so let's remove it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/qdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 4ab04aa..d712a0b 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1129,7 +1129,6 @@ post_realize_fail:
 
 fail:
     error_propagate(errp, local_err);
-    return;
 }
 
 static bool device_get_hotpluggable(Object *obj, Error **errp)
-- 
1.8.3.1


