Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gR1Ol-0001Ne-7l
	for mharc-qemu-trivial@gnu.org; Sun, 25 Nov 2018 15:52:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1Oj-0001LZ-5U
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:52:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1Og-0006aY-7v
	for qemu-trivial@nongnu.org; Sun, 25 Nov 2018 15:52:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50348)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gR1Oc-0006W0-Q8; Sun, 25 Nov 2018 15:52:50 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BD5230832D3;
	Sun, 25 Nov 2018 20:52:50 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B6525C1B2;
	Sun, 25 Nov 2018 20:52:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun, 25 Nov 2018 21:49:54 +0100
Message-Id: <20181125205000.10324-20-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-1-philmd@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Sun, 25 Nov 2018 20:52:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-3.1 19/25] MAINTAINERS: Add a missing
 entry to the QMP section
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
X-List-Received-Date: Sun, 25 Nov 2018 20:52:58 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ac5d25491f..c73dde10a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1887,6 +1887,7 @@ S: Supported
 F: qmp.c
 F: monitor.c
 F: docs/devel/*qmp-*
+F: docs/interop/*qmp-*
 F: scripts/qmp/
 F: tests/qmp-test.c
 F: tests/qmp-cmd-test.c
--=20
2.17.2


