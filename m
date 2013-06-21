Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Upyk2-0006Ae-7N
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 06:38:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjo-0005k9-6R
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjj-0007nm-OO
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58191)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Upyjd-0007jG-7b; Fri, 21 Jun 2013 06:38:29 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5LAcSPk013948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Jun 2013 06:38:28 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5LAcRET026026; Fri, 21 Jun 2013 06:38:28 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id 1CF7B43279; Fri, 21 Jun 2013 12:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2013 12:38:24 +0200
Message-Id: <1371811105-730-13-git-send-email-kraxel@redhat.com>
In-Reply-To: <1371811105-730-1-git-send-email-kraxel@redhat.com>
References: <1371811105-730-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH 12/13] qemu-char: report udb backend errors
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
X-List-Received-Date: Fri, 21 Jun 2013 10:38:45 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-char.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/qemu-char.c b/qemu-char.c
index c83ff21..6b4daf3 100644
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


