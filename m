Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etFHk-0001QC-Mi
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 11:17:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1etFHh-0001Ng-K3
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 11:17:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1etFHg-0001LQ-OL
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 11:17:49 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36756 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1etFHc-0001JO-Nj; Tue, 06 Mar 2018 11:17:44 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30FB3EAEAA;
	Tue,  6 Mar 2018 16:17:44 +0000 (UTC)
Received: from localhost (ovpn-112-24.ams2.redhat.com [10.36.112.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4922C10B0F3B;
	Tue,  6 Mar 2018 16:17:37 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Tue,  6 Mar 2018 17:17:28 +0100
Message-Id: <20180306161728.20890-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 06 Mar 2018 16:17:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 06 Mar 2018 16:17:44 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'marcandre.lureau@redhat.com'
	RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] build-sys: make help could have 'modules'
 target
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
X-List-Received-Date: Tue, 06 Mar 2018 16:17:51 -0000

Available when configure --enable-modules.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 9a75c48ae0..5d9ef3b8fd 100644
--- a/Makefile
+++ b/Makefile
@@ -1046,6 +1046,9 @@ include $(SRC_PATH)/tests/vm/Makefile.include
 help:
 	@echo  'Generic targets:'
 	@echo  '  all             - Build all'
+ifdef CONFIG_MODULES
+	@echo  '  modules         - Build all modules'
+endif
 	@echo  '  dir/file.o      - Build specified target only'
 	@echo  '  install         - Install QEMU, documentation and tools'
 	@echo  '  ctags/TAGS      - Generate tags file for editors'
--=20
2.16.2.346.g9779355e34


