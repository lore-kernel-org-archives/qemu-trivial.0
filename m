Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoRWZ-0000Yf-UL
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 07:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56511)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jslaby@suse.cz>) id 1hoQKL-0004uo-PD
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 06:41:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jslaby@suse.cz>) id 1hoQKK-0002KW-Ny
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 06:41:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:56718 helo=mx1.suse.de)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jslaby@suse.cz>)
 id 1hoQKI-0002GZ-0U; Fri, 19 Jul 2019 06:41:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 43136AE6D;
 Fri, 19 Jul 2019 10:41:20 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Jiri Slaby <jslaby@suse.cz>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
Date: Fri, 19 Jul 2019 12:41:18 +0200
Message-Id: <20190719104118.17735-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 195.135.220.15
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:58:06 -0400
Subject: [Qemu-trivial] [PATCH] target/i386: sev: fix failed message typos
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
X-List-Received-Date: Fri, 19 Jul 2019 10:41:26 -0000

In these multiline messages, there were typos. Fix them -- add a missing
space and remove a superfluous apostrophe.

Inspired by Tom's patch.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-trivial@nongnu.org
Cc: Brijesh Singh <brijesh.singh@amd.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
---
 target/i386/sev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 5ba1384ea1f6..f1423cb0c0d1 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -763,7 +763,7 @@ sev_guest_init(const char *id)
                                         "reduced-phys-bits", NULL);
     if (s->reduced_phys_bits < 1) {
         error_report("%s: reduced_phys_bits check failed, it should be >=
=3D1,"
-                     "' requested '%d'", __func__, s->reduced_phys_bits)=
;
+                     " requested '%d'", __func__, s->reduced_phys_bits);
         goto err;
     }
=20
@@ -783,7 +783,7 @@ sev_guest_init(const char *id)
     ret =3D sev_platform_ioctl(s->sev_fd, SEV_PLATFORM_STATUS, &status,
                              &fw_error);
     if (ret) {
-        error_report("%s: failed to get platform status ret=3D%d"
+        error_report("%s: failed to get platform status ret=3D%d "
                      "fw_error=3D'%d: %s'", __func__, ret, fw_error,
                      fw_error_to_str(fw_error));
         goto err;
--=20
2.22.0


