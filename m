Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hIxw7-00088w-9Z
	for mharc-qemu-trivial@gnu.org; Tue, 23 Apr 2019 12:06:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hIxw4-000869-Dy
	for qemu-trivial@nongnu.org; Tue, 23 Apr 2019 12:06:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hIxw2-0007cn-AR
	for qemu-trivial@nongnu.org; Tue, 23 Apr 2019 12:06:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50122)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hIxvy-0007Zu-7Y; Tue, 23 Apr 2019 12:06:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C0D88008A;
	Tue, 23 Apr 2019 16:06:13 +0000 (UTC)
Received: from thuth.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 578845C296;
	Tue, 23 Apr 2019 16:06:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Tue, 23 Apr 2019 18:06:08 +0200
Message-Id: <20190423160608.7519-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 23 Apr 2019 16:06:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] net: Print output of "-net nic,
 model=help" to stdout instead of stderr
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
X-List-Received-Date: Tue, 23 Apr 2019 16:06:21 -0000

We are printing all other help output to stdout already (e.g. "-help",
"-cpu help" and "-machine help" output). So the "-net nic,model=3Dhelp"
output should go to stdout instead of stderr, too. And while we're at
it, also print the NICs line by line, like we do it e.g. with the
"-cpu help" or "-M help" output, too.

Buglink: https://bugs.launchpad.net/qemu/+bug/1574327
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 net/net.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/net.c b/net/net.c
index f3a3c5444c..2cf5e76469 100644
--- a/net/net.c
+++ b/net/net.c
@@ -837,9 +837,10 @@ int qemu_show_nic_models(const char *arg, const char=
 *const *models)
         return 0;
     }
=20
-    fprintf(stderr, "qemu: Supported NIC models: ");
-    for (i =3D 0 ; models[i]; i++)
-        fprintf(stderr, "%s%c", models[i], models[i+1] ? ',' : '\n');
+    printf("Supported NIC models:\n");
+    for (i =3D 0 ; models[i]; i++) {
+        printf("%s\n", models[i]);
+    }
     return 1;
 }
=20
--=20
2.21.0


