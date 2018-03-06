Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etCsR-0002Ns-K7
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 08:43:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1etCsM-0002JJ-UR
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:43:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1etCsM-0006mW-45
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:43:30 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36122 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1etCsE-0006c0-9S; Tue, 06 Mar 2018 08:43:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B00AF4023155;
	Tue,  6 Mar 2018 13:43:21 +0000 (UTC)
Received: from t460.redhat.com (unknown [10.33.36.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E329D10B0F33;
	Tue,  6 Mar 2018 13:43:18 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Date: Tue,  6 Mar 2018 13:43:17 +0000
Message-Id: <20180306134317.836-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 06 Mar 2018 13:43:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 06 Mar 2018 13:43:21 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH v2] misc: don't use hwaddr as a type in trace
 events
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
X-List-Received-Date: Tue, 06 Mar 2018 13:43:34 -0000

Use types that are defined by QEMU in trace events caused build failures
for the UST trace backend:

  In file included from trace-ust-all.c:13:0:
  trace-ust-all.h:11844:206: error: unknown type name =E2=80=98hwaddr=E2=80=
=99

It only knows about C built-in types, and any types that are pulled in
from includs of qemu-common.h and lttng/tracepoint.h. This does not
include the 'hwaddr' type, so replace it with a uint64_t which is what
exec/hwaddr.h defines 'hwaddr' as. This fixes the build failure
introduced by

  commit 9eb8040c2d2b38e1a40bb6129b1b668fa178fcab
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Fri Mar 2 10:45:39 2018 +0000

    hw/misc/tz-ppc: Model TrustZone peripheral protection controller

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 hw/misc/trace-events | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index eb5ffcc0a8..562d9ed005 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -92,8 +92,8 @@ tz_ppc_cfg_sec_resp(int level) "TZ PPC: cfg_sec_resp =3D=
 %d"
 tz_ppc_irq_enable(int level) "TZ PPC: int_enable =3D %d"
 tz_ppc_irq_clear(int level) "TZ PPC: int_clear =3D %d"
 tz_ppc_update_irq(int level) "TZ PPC: setting irq line to %d"
-tz_ppc_read_blocked(int n, hwaddr offset, bool secure, bool user) "TZ PP=
C: port %d offset 0x%" HWADDR_PRIx " read (secure %d user %d) blocked"
-tz_ppc_write_blocked(int n, hwaddr offset, bool secure, bool user) "TZ P=
PC: port %d offset 0x%" HWADDR_PRIx " write (secure %d user %d) blocked"
+tz_ppc_read_blocked(int n, uint64_t offset, bool secure, bool user) "TZ =
PPC: port %d offset 0x%" PRIx64 " read (secure %d user %d) blocked"
+tz_ppc_write_blocked(int n, uint64_t offset, bool secure, bool user) "TZ=
 PPC: port %d offset 0x%" PRIx64 " write (secure %d user %d) blocked"
=20
 # hw/misc/iotkit-secctl.c
 iotkit_secctl_s_read(uint32_t offset, uint64_t data, unsigned size) "IoT=
Kit SecCtl S regs read: offset 0x%x data 0x%" PRIx64 " size %u"
--=20
2.14.3


