Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMupY-0004XA-Bc
	for mharc-qemu-trivial@gnu.org; Sat, 04 May 2019 09:35:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMupV-0004VQ-U2
	for qemu-trivial@nongnu.org; Sat, 04 May 2019 09:35:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMupU-00058e-0f
	for qemu-trivial@nongnu.org; Sat, 04 May 2019 09:35:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51076)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hMupR-000533-6H; Sat, 04 May 2019 09:35:49 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15F5E20269;
	Sat,  4 May 2019 13:35:47 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C4F85D71A;
	Sat,  4 May 2019 13:35:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Sat,  4 May 2019 15:35:38 +0200
Message-Id: <20190504133540.19758-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sat, 04 May 2019 13:35:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 0/2] roms: Add 'clean' make rule and EDK2
 documentation fix
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
X-List-Received-Date: Sat, 04 May 2019 13:35:54 -0000

Hi,

Two trivial patches waiting Laszlo's series to land.

Since v1:
- rebased

v1:
https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg01589.html
https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg01598.html

Philippe Mathieu-Daud=C3=A9 (2):
  roms: Correct the EDK2_BASETOOLS_OPTFLAGS variable description
  roms: List and describe the Makefile 'clean' rule

 roms/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--=20
2.20.1


