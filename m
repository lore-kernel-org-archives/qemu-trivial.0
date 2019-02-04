Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqlVa-0002qN-MO
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 16:10:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqlVY-0002cG-DZ
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 16:10:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqlQE-00040i-AX
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 16:04:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gqlQ7-0003iC-Ns; Mon, 04 Feb 2019 16:04:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 994EB88E4F;
	Mon,  4 Feb 2019 21:04:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8A931755D;
	Mon,  4 Feb 2019 21:04:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	David Gibson <david@gibson.dropbear.id.au>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Mon,  4 Feb 2019 22:04:30 +0100
Message-Id: <20190204210433.26088-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 04 Feb 2019 21:04:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/3] hw: Drop useless inclusion of
 hw/i386/pc.h
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
X-List-Received-Date: Mon, 04 Feb 2019 21:10:25 -0000

Since 47973a2dbf, it is useless to include "hw/i386/pc.h"
on the ppc/unicore32/sparc64 boards.

The last non-x86 targets still requiring it are alpha/hppa/mips,
because the I8259 intc is still deeply mixed with the PC board.

Philippe Mathieu-Daud=C3=A9 (3):
  hw/sparc64/sun4u: Drop useless inclusion of "hw/i386/pc.h"
  hw/unicore32/puv3: Drop useless inclusion of "hw/i386/pc.h"
  hw/ppc/prep: Drop useless inclusion of "hw/i386/pc.h"

 hw/ppc/prep.c       | 1 -
 hw/sparc64/sun4u.c  | 1 -
 hw/unicore32/puv3.c | 1 -
 3 files changed, 3 deletions(-)

--=20
2.20.1


