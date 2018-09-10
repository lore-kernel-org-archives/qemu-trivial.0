Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fzHLm-0000Pl-Os
	for mharc-qemu-trivial@gnu.org; Mon, 10 Sep 2018 04:15:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fzHLh-0000JO-N9
	for qemu-trivial@nongnu.org; Mon, 10 Sep 2018 04:15:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fzHGf-00045c-Cc
	for qemu-trivial@nongnu.org; Mon, 10 Sep 2018 04:09:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56386 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fzHGV-0003y3-5s; Mon, 10 Sep 2018 04:09:48 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 920C9801145A;
	Mon, 10 Sep 2018 08:09:44 +0000 (UTC)
Received: from thuth.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E6E7215670B;
	Mon, 10 Sep 2018 08:09:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Date: Mon, 10 Sep 2018 10:09:39 +0200
Message-Id: <1536566979-6868-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 10 Sep 2018 08:09:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 10 Sep 2018 08:09:44 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] hw/qdev-core: Fix description of
 instance_init
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
X-List-Received-Date: Mon, 10 Sep 2018 08:15:13 -0000

The part of the documentation of DeviceClass that talks about instance_init
is partly wrong: instance_init() functions must not abort or exit, since
the function is also called during introspection of the device already.
So if a device calls exit() during its instance_init() function, QEMU
terminates unexpectedly if somebody tries to just have a look at the
interfaces from the device with "device_add xyz,help" or with the
"device-list-properties" QOM command. This should never happen.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/qdev-core.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index f1fd0f8..a24d0dd 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -51,8 +51,9 @@ struct VMStateDescription;
  * Devices are constructed in two stages,
  * 1) object instantiation via object_initialize() and
  * 2) device realization via #DeviceState:realized property.
- * The former may not fail (it might assert or exit), the latter may return
- * error information to the caller and must be re-entrant.
+ * The former may not fail (and must not abort or exit, since it is called
+ * during device introspection already), and the latter may return error
+ * information to the caller and must be re-entrant.
  * Trivial field initializations should go into #TypeInfo.instance_init.
  * Operations depending on @props static properties should go into @realize.
  * After successful realization, setting static properties will fail.
-- 
1.8.3.1


