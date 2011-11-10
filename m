Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROWfh-0002YP-TN
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2011 10:36:09 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1ROWfZ-00026Y-0B
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 10:36:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1ROWfU-0006cn-Tj
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 10:36:00 -0500
Received: from fmmailgate03.web.de ([217.72.192.234]:59802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1ROWfO-0006cG-Uy; Thu, 10 Nov 2011 10:35:51 -0500
Received: from moweb002.kundenserver.de (moweb002.kundenserver.de
	[172.19.20.108])
	by fmmailgate03.web.de (Postfix) with ESMTP id DDB681AA51020;
	Thu, 10 Nov 2011 16:35:48 +0100 (CET)
Received: from localhost.localdomain ([2.39.114.236]) by smtp.web.de
	(mrweb001) with ESMTPA (Nemesis) id 0Mbhiv-1RgsKX0V7N-00J2rG;
	Thu, 10 Nov 2011 16:35:48 +0100
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>
To: qemu-devel@nongnu.org
Date: Thu, 10 Nov 2011 16:35:32 +0100
Message-Id: <1320939332-31871-1-git-send-email-andreas.faerber@web.de>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Provags-ID: V02:K0:aNa2Ptn1nkmTOoV2vs5S3LzyFOm6GGVRUyRgRi6W4CH
	j9Nsc2WbEjr7e0Z6sFBgqfs26rsBiNda7YLc8ATbxWJjkW9S6U
	2tg5gs69l2nUdFqUYLaXhXJ2WEIGIwqtOneyUKz7UDQzszpmeA
	g9BVVcEGjTgWCgVLSlaYZJ0z5kkd5BNgnqxokSCpa+sTonGfD/
	BVyQFeyVg5idck4gl98Fw==
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.234
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>
Subject: [Qemu-trivial] [PATCH] vl.c: Fail gracefully if no machine is found
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
X-List-Received-Date: Thu, 10 Nov 2011 15:36:06 -0000

machine defaults to find_default_machine(),
then gets overridden via -M and machine_parse().

If no -M is specified and find_default_machine() returns NULL
(when no machine compiled in), exit with an error.

Avoids a segfault when setting machine->max_cpus.

Signed-off-by: Andreas F=C3=A4rber <andreas.faerber@web.de>
---
 vl.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/vl.c b/vl.c
index f169aac..16fa222 100644
--- a/vl.c
+++ b/vl.c
@@ -3089,6 +3089,11 @@ int main(int argc, char **argv, char **envp)
         data_dir =3D CONFIG_QEMU_DATADIR;
     }
=20
+    if (machine =3D=3D NULL) {
+        fprintf(stderr, "No machine found.\n");
+        exit(1);
+    }
+
     /*
      * Default to max_cpus =3D smp_cpus, in case the user doesn't
      * specify a max_cpus value.
--=20
1.7.7


