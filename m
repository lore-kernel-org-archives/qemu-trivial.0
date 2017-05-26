Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dECG5-0006f3-3q
	for mharc-qemu-trivial@gnu.org; Fri, 26 May 2017 06:14:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dECG3-0006e1-DT
	for qemu-trivial@nongnu.org; Fri, 26 May 2017 06:14:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dECG2-0005vb-Hr
	for qemu-trivial@nongnu.org; Fri, 26 May 2017 06:14:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dECFw-0005tW-1a; Fri, 26 May 2017 06:14:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA3F07AE9E;
	Fri, 26 May 2017 10:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BA3F07AE9E
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcandre.lureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BA3F07AE9E
Received: from localhost (ovpn-112-35.ams2.redhat.com [10.36.112.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9BF018236;
	Fri, 26 May 2017 10:13:42 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>
Date: Fri, 26 May 2017 14:13:37 +0400
Message-Id: <20170526101337.4096-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 26 May 2017 10:13:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu-ga: remove useless allocation
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
X-List-Received-Date: Fri, 26 May 2017 10:14:12 -0000

There is no need to duplicate a fixed string.

CC: qemu-trivial@nongnu.org
Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-posix.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 284ecc6d7e..d8e412275e 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2197,12 +2197,10 @@ static void transfer_memory_block(GuestMemoryBloc=
k *mem_blk, bool sys2memblk,
         }
     } else {
         if (mem_blk->online !=3D (strncmp(status, "online", 6) =3D=3D 0)=
) {
-            char *new_state =3D mem_blk->online ? g_strdup("online") :
-                                                g_strdup("offline");
+            const char *new_state =3D mem_blk->online ? "online" : "offl=
ine";
=20
             ga_write_sysfs_file(dirfd, "state", new_state, strlen(new_st=
ate),
                                 &local_err);
-            g_free(new_state);
             if (local_err) {
                 error_free(local_err);
                 result->response =3D
--=20
2.13.0.rc1.16.gd80b50c3f


