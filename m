Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyjJl-0000D2-DZ
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 08:27:41 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1TyjJd-0008GX-RX
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 08:27:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1TyjJb-0006gB-Cy
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 08:27:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:27869)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1TyjJP-0006e3-7c; Fri, 25 Jan 2013 08:27:19 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0PDRIc6005649
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 25 Jan 2013 08:27:18 -0500
Received: from bart.redhat.com (vpn-225-136.phx2.redhat.com [10.3.225.136])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0PDRHuV009264; Fri, 25 Jan 2013 08:27:17 -0500
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 25 Jan 2013 14:27:11 +0100
Message-Id: <ef9bb01f7a2cd566bcdc10f19dc0881818754c4e.1359120428.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qmp-commands.hx: s/tray-open/tray_open/ to
	match qapi schema
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
X-List-Received-Date: Fri, 25 Jan 2013 13:27:39 -0000

Currently, we are using 'tray_open' in QMP and 'tray-open' in
HMP. However, the QMP documentation was mistakenly using the
HMP version.
---
 qmp-commands.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index cbf1280..870ee54 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -1585,7 +1585,7 @@ Each json-object contain the following:
          - Possible values: "unknown"
 - "removable": true if the device is removable, false otherwise (json-bool)
 - "locked": true if the device is locked, false otherwise (json-bool)
-- "tray-open": only present if removable, true if the device has a tray,
+- "tray_open": only present if removable, true if the device has a tray,
                and it is open (json-bool)
 - "inserted": only present if the device is inserted, it is a json-object
    containing the following:
-- 
1.8.0.2


