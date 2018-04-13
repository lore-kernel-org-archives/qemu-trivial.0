Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f71py-0002wF-Gv
	for mharc-qemu-trivial@gnu.org; Fri, 13 Apr 2018 12:46:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1f71pw-0002uY-11
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2018 12:46:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1f71pv-0000qy-9M
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2018 12:46:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40068 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1f71pq-0000pU-2y; Fri, 13 Apr 2018 12:46:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7873D814F0A8;
	Fri, 13 Apr 2018 16:45:57 +0000 (UTC)
Received: from localhost (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E5AB215CDC8;
	Fri, 13 Apr 2018 16:45:52 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Fri, 13 Apr 2018 18:45:45 +0200
Message-Id: <20180413164545.18409-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 13 Apr 2018 16:45:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 13 Apr 2018 16:45:57 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcandre.lureau@redhat.com'
	RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] acpi: fix a comment about aml_call0()
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
X-List-Received-Date: Fri, 13 Apr 2018 16:46:08 -0000

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/acpi/aml-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 3fa557cea1..1e43cd736d 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -627,7 +627,7 @@ Aml *aml_notify(Aml *arg1, Aml *arg2)
     return var;
 }
=20
-/* helper to call method with 1 argument */
+/* helper to call method without argument */
 Aml *aml_call0(const char *method)
 {
     Aml *var =3D aml_alloc();
--=20
2.17.0.rc1.36.gcedb63ea2f


