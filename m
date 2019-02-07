Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grpTK-0002bB-SD
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 14:36:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1grpTI-0002Z7-SY
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 14:36:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1grpTB-0007b4-T3
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 14:36:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34576)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1grpT5-0007XD-Qs; Thu, 07 Feb 2019 14:36:15 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED4AB59473;
	Thu,  7 Feb 2019 19:36:14 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-41.rdu2.redhat.com
	[10.10.120.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C29B161146;
	Thu,  7 Feb 2019 19:36:13 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Date: Thu,  7 Feb 2019 14:36:04 -0500
Message-Id: <20190207193605.25676-4-crosa@redhat.com>
In-Reply-To: <20190207193605.25676-1-crosa@redhat.com>
References: <20190207193605.25676-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 07 Feb 2019 19:36:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 3/4] scripts/render_block_graph.py: add a
 missing import
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
X-List-Received-Date: Thu, 07 Feb 2019 19:36:29 -0000

The handle to QMP may be one of two classes, one implemented locally,
and the other one, which seems to be from "qmp.qmp", but of which an
import is missing.

CC: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/render_block_graph.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.p=
y
index ed7e581b4f..7686e30761 100755
--- a/scripts/render_block_graph.py
+++ b/scripts/render_block_graph.py
@@ -24,6 +24,7 @@ import subprocess
 import json
 from graphviz import Digraph
 from qemu import MonitorResponseError
+from qmp.qmp import QEMUMonitorProtocol
=20
=20
 def perm(arr):
--=20
2.20.1


