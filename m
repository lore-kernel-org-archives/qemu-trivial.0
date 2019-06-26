Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg6vI-0005Pt-9B
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jun 2019 08:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52001)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hg6vG-0005KY-0U
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 08:21:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hg6vF-0005ym-63
 for qemu-trivial@nongnu.org; Wed, 26 Jun 2019 08:21:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52066)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hg6v7-0005g7-JY; Wed, 26 Jun 2019 08:21:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C1001309175F;
 Wed, 26 Jun 2019 12:20:50 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95E8E1001B10;
 Wed, 26 Jun 2019 12:20:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Wed, 26 Jun 2019 14:20:40 +0200
Message-Id: <20190626122042.7656-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 26 Jun 2019 12:20:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/2] hw/timer/m48t59: Convert to trace events
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 12:21:10 -0000

Another trivial cleanup series.

Philippe Mathieu-Daud=C3=A9 (2):
  MAINTAINERS: Add missing m48t59 files to the PReP section
  hw/timer/m48t59: Convert debug printf()s to trace events

 MAINTAINERS                |  2 ++
 hw/timer/m48t59-internal.h |  5 -----
 hw/timer/m48t59.c          | 11 +++++------
 hw/timer/trace-events      |  6 ++++++
 4 files changed, 13 insertions(+), 11 deletions(-)

--=20
2.20.1


