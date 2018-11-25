Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gR1P6-0001gX-KA
	for mharc-qemu-trivial@gnu.org; Sun, 25 Nov 2018 15:53:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1P4-0001e6-6k
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:53:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1P3-0006nK-Dx
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:53:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38682)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gR1Oz-0006lO-U9; Sun, 25 Nov 2018 15:53:14 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 101B530820C4;
	Sun, 25 Nov 2018 20:53:13 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 707D45C1B2;
	Sun, 25 Nov 2018 20:53:07 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>
Date: Sun, 25 Nov 2018 21:49:59 +0100
Message-Id: <20181125205000.10324-25-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-1-philmd@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Sun, 25 Nov 2018 20:53:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-3.1 24/25] MAINTAINERS: Use my work email
 to review Build and test automation patches
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
X-List-Received-Date: Sun, 25 Nov 2018 20:53:19 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ad82c0377c..c616861ca3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2388,7 +2388,7 @@ Build and test automation
 Build and test automation
 M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
 M: Fam Zheng <famz@redhat.com>
-R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
+R: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
 L: qemu-devel@nongnu.org
 S: Maintained
 F: .travis.yml
--=20
2.17.2


