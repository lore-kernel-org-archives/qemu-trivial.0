Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RAP1u-0003MP-P0
	for mharc-qemu-trivial@gnu.org; Sun, 02 Oct 2011 12:36:42 -0400
Received: from eggs.gnu.org ([140.186.70.92]:39458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1RAP1s-0003Gz-Tx
	for qemu-trivial@nongnu.org; Sun, 02 Oct 2011 12:36:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1RAP1r-0004AT-T4
	for qemu-trivial@nongnu.org; Sun, 02 Oct 2011 12:36:40 -0400
Received: from fmmailgate02.web.de ([217.72.192.227]:56317)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1RAP1p-0004A0-TU; Sun, 02 Oct 2011 12:36:38 -0400
Received: from smtp05.web.de  ( [172.20.4.166])
	by fmmailgate02.web.de (Postfix) with ESMTP id 6EC7D1AE90C8E;
	Sun,  2 Oct 2011 18:35:40 +0200 (CEST)
Received: from [87.173.106.85] (helo=af.site)
	by smtp05.web.de with asmtp (WEB.DE 4.110 #2)
	id 1RAP0t-0000Sc-00; Sun, 02 Oct 2011 18:35:40 +0200
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>
To: qemu-devel@nongnu.org
Date: Sun,  2 Oct 2011 18:35:48 +0200
Message-Id: <1317573348-7824-1-git-send-email-andreas.faerber@web.de>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX185FjpaFBLGOT9m9jE9Yey35CVjjT+PiBFWMNoB
	GDmaOTA6eLSpKOyH6f7MUARFHx82SI/bBnBNc87Fg91O/2TngV
	LzIiQ4aB+gI26nZqBtvA==
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.227
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Paul Brook <paul@codesourcery.com>
Subject: [Qemu-trivial] [PATCH] target-arm: Fix typo
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
X-List-Received-Date: Sun, 02 Oct 2011 16:36:41 -0000

The command line option is called -kernel, not -kenrel.

Cc: Paul Brook <paul@codesourcery.com>
Signed-off-by: Andreas F=C3=A4rber <andreas.faerber@web.de>
---
 target-arm/helper.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index cc1a3d2..2273492 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -345,7 +345,7 @@ void cpu_reset(CPUARMState *env)
         if (rom) {
             /* We should really use ldl_phys here, in case the guest
                modified flash and reset itself.  However images
-               loaded via -kenrel have not been copied yet, so load the
+               loaded via -kernel have not been copied yet, so load the
                values directly from there.  */
             env->regs[13] =3D ldl_p(rom);
             pc =3D ldl_p(rom + 4);
--=20
1.7.3.4


