Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grpT2-0002LQ-Iq
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 14:36:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1grpT1-0002KS-7A
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 14:36:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1grpT0-0007Tn-JW
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 14:36:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48356)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1grpSz-0007SO-6I; Thu, 07 Feb 2019 14:36:09 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4190F811DD;
	Thu,  7 Feb 2019 19:36:08 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-41.rdu2.redhat.com
	[10.10.120.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AB061691C;
	Thu,  7 Feb 2019 19:36:07 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Thu,  7 Feb 2019 14:36:01 -0500
Message-Id: <20190207193605.25676-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 07 Feb 2019 19:36:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/4] Trivial fixes for configure and Python
 scripts
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
X-List-Received-Date: Thu, 07 Feb 2019 19:36:12 -0000

This is just a small collection of trivial fixes for configure
and some Python scripts (missing/unused import statements).

Cleber Rosa (4):
  configure: remove handling of "wav" audio driver
  configure: fix qemu-img name
  scripts/render_block_graph.py: add a missing import
  tests/migration/guestperf/engine.py: remove unused import

 configure                           | 6 +-----
 scripts/render_block_graph.py       | 1 +
 tests/migration/guestperf/engine.py | 1 -
 3 files changed, 2 insertions(+), 6 deletions(-)

--=20
2.20.1


