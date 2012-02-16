Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ry4kV-0003yT-N3
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2012 12:04:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Ry4kJ-0003By-6t
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 12:04:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Ry4kD-0004JO-HA
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 12:03:51 -0500
Received: from cantor2.suse.de ([195.135.220.15]:56954 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Ry4jt-0004GI-0G; Thu, 16 Feb 2012 12:03:25 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 2B7098FB75;
	Thu, 16 Feb 2012 18:03:23 +0100 (CET)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Thu, 16 Feb 2012 18:03:17 +0100
Message-Id: <1329411799-4266-1-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: [Qemu-trivial] [PATCH 0/2] Some small documentation fixes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Feb 2012 17:04:01 -0000

Hey,

I've taken the liberty of rebasing Anthony's gtk-doc patches to verify th=
e
documentation I'm adding in the CPU series. Here's some warning fixes tha=
t
came out of this endeavor.

Two open issues remain:
* Identifier extensions (e.g., #Objects) lead to warnings.
* Some structs are not picked up correctly, such as Object.

Regards,
Andreas

Cc: Anthony Liguori <anthony@codemonkey.ws>

Andreas F=C3=A4rber (2):
  qom: Fix typo in Object's documentation
  qom: Fix identifiers in documentation

 include/qemu/object.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

--=20
1.7.7


