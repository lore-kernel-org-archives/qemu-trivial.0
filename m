Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gql7k-00064A-Tc
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 15:45:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gql7i-00060b-Ta
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 15:45:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gql7i-0001cb-2y
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 15:45:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52318)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gql7d-0001WA-VS; Mon, 04 Feb 2019 15:45:42 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B674804F5;
	Mon,  4 Feb 2019 20:45:40 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95C348A29B;
	Mon,  4 Feb 2019 20:45:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Andrzej Zaborowski <balrogg@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Mon,  4 Feb 2019 21:45:17 +0100
Message-Id: <20190204204517.23698-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 04 Feb 2019 20:45:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/input/tsc210x: Fix building with no
 verbosity
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
X-List-Received-Date: Mon, 04 Feb 2019 20:45:47 -0000

When building with TSC_VERBOSE not defined, we get:
      CC      arm-softmmu/hw/input/tsc210x.o
    hw/input/tsc210x.c: In function =E2=80=98tsc2102_data_register_write=E2=
=80=99:
    hw/input/tsc210x.c:554:5: error: label at end of compound statement
         default:
         ^~~~~~~
    hw/input/tsc210x.c: In function =E2=80=98tsc2102_control_register_wri=
te=E2=80=99:
    hw/input/tsc210x.c:638:5: error: label at end of compound statement
         bad_reg:
         ^~~~~~~
    hw/input/tsc210x.c: In function =E2=80=98tsc2102_audio_register_write=
=E2=80=99:
    hw/input/tsc210x.c:766:5: error: label at end of compound statement
         default:
         ^~~~~~~
    make[1]: *** [rules.mak:69: hw/input/tsc210x.o] Error 1

Fix this by replacing the culprit fprintf(stderr) calls by a more
recent API: qemu_log_mask(LOG_GUEST_ERROR). Other fprintf() calls
are left untouched.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/input/tsc210x.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index ded0db9351..2eb3cb9518 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -552,10 +552,8 @@ static void tsc2102_data_register_write(
         return;
=20
     default:
-#ifdef TSC_VERBOSE
-        fprintf(stderr, "tsc2102_data_register_write: "
-                        "no such register: 0x%02x\n", reg);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_data_register_write: "
+                                       "no such register: 0x%02x\n", reg=
);
     }
 }
=20
@@ -636,10 +634,8 @@ static void tsc2102_control_register_write(
=20
     default:
     bad_reg:
-#ifdef TSC_VERBOSE
-        fprintf(stderr, "tsc2102_control_register_write: "
-                        "no such register: 0x%02x\n", reg);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_control_register_write: =
"
+                                       "no such register: 0x%02x\n", reg=
);
     }
 }
=20
@@ -764,10 +760,8 @@ static void tsc2102_audio_register_write(
         return;
=20
     default:
-#ifdef TSC_VERBOSE
-        fprintf(stderr, "tsc2102_audio_register_write: "
-                        "no such register: 0x%02x\n", reg);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_audio_register_write: "
+                                       "no such register: 0x%02x\n", reg=
);
     }
 }
=20
--=20
2.20.1


