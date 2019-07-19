Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoSil-0007UU-LZ
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 09:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60613)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hoSij-0007KH-IV
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:14:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hoSii-0000PR-H1
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 09:14:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46246)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hoSic-0000KK-Ed; Fri, 19 Jul 2019 09:14:38 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C062E308219F;
 Fri, 19 Jul 2019 13:14:36 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69E892657C;
 Fri, 19 Jul 2019 13:14:28 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Corey Minyard <minyard@acm.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 19 Jul 2019 15:14:18 +0200
Message-Id: <20190719131425.10835-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 19 Jul 2019 13:14:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH-for-4.1? 0/7] Trivial switch 'fall through'
 comment fixes for GCC9
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
X-List-Received-Date: Fri, 19 Jul 2019 13:14:46 -0000

Trivial patches, simply rewrite the comment or move it around.

Reported by Stefan here:
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01970.html

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (7):
  json: Move switch 'fall through' comment to correct place
  hw/dma/omap_dma: Move switch 'fall through' comment to correct place
  hw/block/pflash_cfi02: Rewrite a fall through comment
  hw/ipmi: Rewrite a fall through comment
  target/ppc: Rewrite a fall through comment
  vl: Rewrite a fall through comment
  spapr_events: Rewrite a fall through comment

 hw/block/pflash_cfi02.c   | 2 +-
 hw/dma/omap_dma.c         | 2 +-
 hw/ipmi/ipmi_bmc_extern.c | 3 +--
 hw/ppc/spapr_events.c     | 2 +-
 qobject/json-parser.c     | 2 +-
 target/ppc/mmu_helper.c   | 6 +++---
 vl.c                      | 2 +-
 7 files changed, 9 insertions(+), 10 deletions(-)

--=20
2.20.1


