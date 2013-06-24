Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur0Rq-0004yX-OY
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 02:40:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rg-0004XY-1R
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rc-0007HW-5e
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ur0RU-0006yC-2n; Mon, 24 Jun 2013 02:40:00 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O6dxnq011851
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 02:39:59 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5O6dwrD006014; Mon, 24 Jun 2013 02:39:58 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id 50AEB41A97; Mon, 24 Jun 2013 08:39:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2013 08:39:55 +0200
Message-Id: <1372055996-4072-13-git-send-email-kraxel@redhat.com>
In-Reply-To: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 12/13] qemu-char: report udb backend errors
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
X-List-Received-Date: Mon, 24 Jun 2013 06:40:16 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-char.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/qemu-char.c b/qemu-char.c
index 7d072a8..dcc91bb 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -2255,6 +2255,8 @@ static CharDriverState *qemu_chr_open_udp(QemuOpts *opts)
 
     fd = inet_dgram_opts(opts, &local_err);
     if (fd < 0) {
+        qerror_report_err(local_err);
+        error_free(local_err);
         return NULL;
     }
     return qemu_chr_open_udp_fd(fd);
-- 
1.7.9.7


