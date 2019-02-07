Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grpTM-0002d3-OH
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 14:36:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1grpTK-0002b1-Nb
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 14:36:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1grpTI-0007gH-Gx
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 14:36:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1grpTB-0007ZX-Sl; Thu, 07 Feb 2019 14:36:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CBDF3C4EB2;
	Thu,  7 Feb 2019 19:36:18 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-41.rdu2.redhat.com
	[10.10.120.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E3FD62FA3;
	Thu,  7 Feb 2019 19:36:15 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Thu,  7 Feb 2019 14:36:05 -0500
Message-Id: <20190207193605.25676-5-crosa@redhat.com>
In-Reply-To: <20190207193605.25676-1-crosa@redhat.com>
References: <20190207193605.25676-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 07 Feb 2019 19:36:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 4/4] tests/migration/guestperf/engine.py:
 remove unused import
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
X-List-Received-Date: Thu, 07 Feb 2019 19:36:31 -0000

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/migration/guestperf/engine.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestp=
erf/engine.py
index 398e3f2706..1daf09c6f2 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -26,7 +26,6 @@ import time
=20
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', '..'=
, 'scripts'))
 import qemu
-import qmp.qmp
 from guestperf.progress import Progress, ProgressStats
 from guestperf.report import Report
 from guestperf.timings import TimingRecord, Timings
--=20
2.20.1


