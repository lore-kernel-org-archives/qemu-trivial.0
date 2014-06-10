Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOkb-0002NI-A2
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:18:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOkU-00029Y-Ac
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:18:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOkP-0003hl-6i
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:18:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38260)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOkE-0003fE-Jm; Tue, 10 Jun 2014 12:17:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B665F412C3;
	Tue, 10 Jun 2014 20:17:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A76CA6C1;
	Tue, 10 Jun 2014 20:08:48 +0400 (MSK)
Received: (nullmailer pid 13330 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:37 +0400
Message-Id: <1402416523-13212-20-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 19/25] smbios: use g_free directly on NULL
	pointers
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
X-List-Received-Date: Tue, 10 Jun 2014 16:18:15 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

No need to wrap it with an if.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Benoit Canet <benoit@irqsave.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/smbios.c |    9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/i386/smbios.c b/hw/i386/smbios.c
index b3bedde..e3fa1b2 100644
--- a/hw/i386/smbios.c
+++ b/hw/i386/smbios.c
@@ -745,11 +745,6 @@ void smbios_set_cpuid(uint32_t version, uint32_t features)
         field = value;                                                    \
     }
 
-#define G_FREE_UNLESS_NULL(ptr)                                           \
-    if (ptr != NULL) {                                                    \
-        g_free(ptr);                                                      \
-    }
-
 void smbios_set_defaults(const char *manufacturer, const char *product,
                          const char *version, bool legacy_mode)
 {
@@ -758,7 +753,7 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
 
     /* drop unwanted version of command-line file blob(s) */
     if (smbios_legacy) {
-        G_FREE_UNLESS_NULL(smbios_tables);
+        g_free(smbios_tables);
         /* in legacy mode, also complain if fields were given for types > 1 */
         if (find_next_bit(have_fields_bitmap,
                           SMBIOS_MAX_TYPE+1, 2) < SMBIOS_MAX_TYPE+1) {
@@ -767,7 +762,7 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
             exit(1);
         }
     } else {
-        G_FREE_UNLESS_NULL(smbios_entries);
+        g_free(smbios_entries);
     }
 
     SMBIOS_SET_DEFAULT(type1.manufacturer, manufacturer);
-- 
1.7.10.4


