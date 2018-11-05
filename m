Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gJfKn-0000Mh-Qk
	for mharc-qemu-trivial@gnu.org; Mon, 05 Nov 2018 08:54:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gJfKh-0000IR-13
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2018 08:54:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gJfKd-0005CR-Bx
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2018 08:54:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gJfKU-0004oH-0e; Mon, 05 Nov 2018 08:54:11 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BB67312E9C7;
	Mon,  5 Nov 2018 13:54:07 +0000 (UTC)
Received: from localhost (ovpn-112-62.ams2.redhat.com [10.36.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28893611C9;
	Mon,  5 Nov 2018 13:54:05 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Mon,  5 Nov 2018 17:54:00 +0400
Message-Id: <20181105135400.18366-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 05 Nov 2018 13:54:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] misc: fix spelling
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
X-List-Received-Date: Mon, 05 Nov 2018 13:54:28 -0000

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index af7e9f09cc..4d2e2d9902 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4065,7 +4065,7 @@ arch_query_cpu_model_expansion(CpuModelExpansionTyp=
e type,
         x86_cpu_to_dict_full(xc, props);
     break;
     default:
-        error_setg(&err, "Unsupportted expansion type");
+        error_setg(&err, "Unsupported expansion type");
         goto out;
     }
=20
--=20
2.19.1.708.g4ede3d42df


