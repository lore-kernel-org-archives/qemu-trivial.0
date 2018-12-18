Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZGN6-0000nN-Qm
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 09:29:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gZGN3-0000jO-BY
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:29:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gZGMy-0000s0-FQ
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:29:17 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:46383)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gZGMy-0000r8-6D; Tue, 18 Dec 2018 09:29:12 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N7Qp3-1hTLed30nt-017kvM; Tue, 18 Dec 2018 15:29:02 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-block@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	Collin Walling <walling@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, qemu-trivial@nongnu.org
Date: Tue, 18 Dec 2018 15:28:50 +0100
Message-Id: <20181218142851.9477-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181218142851.9477-1-laurent@vivier.eu>
References: <20181218142851.9477-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XcvVyTRNcuVoO7w926JgzxmXRp1FGKKZbPZfW3sMI8lTgZO0CMc
	gNaPQ5v3qC2fuF7iN1mzsAWCLaU8Hq0CKvko2PFy2IwlD86Ue3E6tRhEl5YuQ26VVWb8qbU
	QuoyaWVxXZj6cmoHVOga67LrLS900ycHGBaKq089dUJT3ISzLyggovUTECaYeFoCGYNVlyC
	glbsReoORZ/JDkwhb3MAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dPeCUy9F6kg=:IRNDK1QmnzHVY1nVXSaj8d
	bYoDo0GicW6OIW2PYzZg2LgE4obR4a7ZDzBn02LuQiLQ5nhpvPyaiFPz0z4JM0+1ojNsoTqXD
	33EEI+KMi3QiZUcZLZ0N3ND5zIhAsmx3p0lo4vfHAwjv2a/wmDDACT0rRTk0gXCqdTPvZLO50
	5/PXTfskpSpkQLdQ3Ckw9rAnjIPV7eDgV/EngF/7rYekt4irxWTyXqKPZiUBWx87Rc9+8ssxA
	MRrilMGPLJdFVIdNexS/355zZsbR9LtBbB0XiB3yptfaMfl5QHMQDjZneuwL2lt88O/HQ9ME9
	eH2YRSZE+rlKSqJSjakaMPh6xNYnc9nY2Pc0DxUuV4i7o9hRbWH/1SJR/MgPoAj3ZIunqvkL/
	r2GFZTH+15j7RmCJllMBewr3nstNGcN+k19rJjL6tvXnG1ZuxSrqpJ6nP6Dovsd55BcTnEh1z
	mzWyHyVYE4NkzOGMEWWZe9khM/ueVC5KwU0I/0/YxHZUuhaHVp7IKyuqczQv9hILQXmKn6fog
	HHkBxGsdDRqaFr4vxtonAsq8EjzR6wK+d4lemh+REYVZGLOe5wPUJnqwsa/sBszY9NcYgES1d
	THV5Vh/DmcLYnswR2VZDwlBLKAnv8koM2JLTMdk97thcKVaOKqn8inEck2UnuKJInv1y+1Awj
	Z4CI9KclF3s21aYL/8whmQ+BURHq90/8Mgll+7r3SF8lVcB3khA6fd18mEkxPaGzPmzHt9qtV
	+g/VIG3rZBlWAeMyVR5F8hKwrPIKDb5p0TWzKnBot3XSu4WdegavlYEuC1w=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 3/4] vl: Use error_fatal to simplify obvious
 fatal errors (again)
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
X-List-Received-Date: Tue, 18 Dec 2018 14:29:19 -0000

From: Markus Armbruster <armbru@redhat.com>

Patch created mechanically by rerunning:

    $ spatch --in-place --sp-file scripts/coccinelle/use-error_fatal.cocci \
             --macro-file scripts/cocci-macro-file.h vl.c

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181213175807.12039-1-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 vl.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/vl.c b/vl.c
index 2a8b2ee16d..530fad6a71 100644
--- a/vl.c
+++ b/vl.c
@@ -3133,11 +3133,8 @@ int main(int argc, char **argv, char **envp)
                     Visitor *v;
                     BlockdevOptions_queue *bdo;
 
-                    v = qobject_input_visitor_new_str(optarg, "driver", &err);
-                    if (!v) {
-                        error_report_err(err);
-                        exit(1);
-                    }
+                    v = qobject_input_visitor_new_str(optarg, "driver",
+                                                      &error_fatal);
 
                     bdo = g_new(BlockdevOptions_queue, 1);
                     visit_type_BlockdevOptions(v, NULL, &bdo->bdo,
-- 
2.19.2


