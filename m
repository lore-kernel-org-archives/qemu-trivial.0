Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLb5W-0004C8-Bz
	for mharc-qemu-trivial@gnu.org; Wed, 11 Feb 2015 12:28:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YLb5Q-0004Ap-LU
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 12:28:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YLb5M-0007iI-L2
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 12:28:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YLb5M-0007iA-DF; Wed, 11 Feb 2015 12:28:24 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1BHSMjg027015
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 11 Feb 2015 12:28:23 -0500
Received: from nilsson.home.kraxel.org (ovpn-116-79.ams2.redhat.com
	[10.36.116.79])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1BGoGLJ016796; Wed, 11 Feb 2015 11:50:17 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 58ABB81C07; Wed, 11 Feb 2015 17:50:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Feb 2015 17:50:10 +0100
Message-Id: <1423673410-15100-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gerd Hoffmann <kraxel@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH v2] spice: fix memory leak
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
X-List-Received-Date: Wed, 11 Feb 2015 17:28:32 -0000

Found by coverity.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 monitor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/monitor.c b/monitor.c
index c3cc060..2c37953 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1101,6 +1101,7 @@ static int client_migrate_info(Monitor *mon, const QDict *qdict,
     if (strcmp(protocol, "spice") == 0) {
         if (!qemu_using_spice(&err)) {
             qerror_report_err(err);
+            error_free(err);
             return -1;
         }
 
-- 
1.8.3.1


