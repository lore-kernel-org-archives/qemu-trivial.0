Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZGGl-00041N-2B
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 09:22:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gZGGd-0003um-Sq
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:22:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gZGGc-0006TQ-KH
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:22:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gZGGX-0006OK-9j; Tue, 18 Dec 2018 09:22:33 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F792796EA;
	Tue, 18 Dec 2018 11:56:41 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 095951001914;
	Tue, 18 Dec 2018 11:56:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Markus Armbruster <armbru@redhat.com>, Helge Deller <deller@gmx.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 18 Dec 2018 12:56:03 +0100
Message-Id: <20181218115615.1499-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 18 Dec 2018 11:56:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 00/12] MAINTAINERS: Add various missing
 entries
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
X-List-Received-Date: Tue, 18 Dec 2018 14:22:45 -0000

Hi,

This cleanup effort is inspired by Markus "Full list of unmaintained file=
s"
from the "MAINTAINERS leaves too many files uncovered" thread:
https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg04270.html

v1: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg04994.html

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (12):
  MAINTAINERS: Add missing entries to the X86 section (AMD SEV)
  MAINTAINERS: Add missing entries for the sun4u machines
  MAINTAINERS: Add missing entries for the PC machines
  MAINTAINERS: Add missing entries to VFIO and NVMe
  MAINTAINERS: Add missing entries for the QObject section
  MAINTAINERS: Add missing test entries to the Cryptography section
  MAINTAINERS: Add an entry for the Dino machine
  MAINTAINERS: Add maintainers to the Linux subsystem
  MAINTAINERS: Add maintainer to the POSIX subsystem
  MAINTAINERS: Orphanize the 'CPU (QOM)' subsystem
  MAINTAINERS: Orphanize the 'GDB stub' subsystem
  MAINTAINERS: Add maintainer to the TCG/i386 subsystem

 MAINTAINERS | 55 ++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 11 deletions(-)

--=20
2.17.2


