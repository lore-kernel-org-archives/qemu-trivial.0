Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFkpE-0001EY-6E
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2011 06:53:44 -0400
Received: from eggs.gnu.org ([140.186.70.92]:35269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>) id 1RFkpB-000147-If
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 06:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>) id 1RFkp7-0004zv-CJ
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 06:53:41 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:34345)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karaghiozis@gmail.com>)
	id 1RFkoz-0004zP-85; Mon, 17 Oct 2011 06:53:29 -0400
Received: by qadb10 with SMTP id b10so2513231qad.4
	for <multiple recipients>; Mon, 17 Oct 2011 03:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=/cqhOkMLVhVaWn5fIt53xR2UWG/s/bzbF/kg/b3pxng=;
	b=uaja8MPIpfcRnCWJLgh5lMRDhcyc/HaqMMztNwfaEM/YeBAGzeeeCUMohAzO37oUHl
	9kLupbrTZEwqXrPJwXwdzWBg923S7MpoeXFpXrrhruNi6nWh7VPCmzmHEkadRVC/QoQ3
	u4H4RLkWLjS6fxxPaH6Cedw3EUsa+1LK/s7ls=
MIME-Version: 1.0
Received: by 10.229.10.228 with SMTP id q36mr1916784qcq.130.1318848808334;
	Mon, 17 Oct 2011 03:53:28 -0700 (PDT)
Received: by 10.229.42.213 with HTTP; Mon, 17 Oct 2011 03:53:28 -0700 (PDT)
Date: Mon, 17 Oct 2011 14:53:28 +0400
Message-ID: <CAKUHwZpm+WW2vdM1WjHV+rmYe8mbsP8Ydtnub7UxxxzfMD9m8A@mail.gmail.com>
From: Dmitry Koshelev <karaghiozis@gmail.com>
To: qemu-devel@nongnu.org, paul@codesourcery.com
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [Qemu-devel] [PATCH] arm cpu state loading fix
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
X-List-Received-Date: Mon, 17 Oct 2011 10:53:42 -0000

Floating registers loading fix.

Signed-off-by: Dmitry Koshelev <karaghiozis@gmail.com>
---
 target-arm/machine.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target-arm/machine.c b/target-arm/machine.c
index 3925d3a..73d82c9 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -175,7 +175,7 @@ int cpu_load(QEMUFile *f, void *opaque, int version_id)
         env->vfp.vec_stride = qemu_get_be32(f);

         if (arm_feature(env, ARM_FEATURE_VFP3)) {
-            for (i = 0;  i < 16; i++) {
+            for (i = 16;  i < 32; i++) {
                 CPU_DoubleU u;
                 u.l.upper = qemu_get_be32(f);
                 u.l.lower = qemu_get_be32(f);

