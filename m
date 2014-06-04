Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WsDcy-0006fd-Pc
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jun 2014 12:01:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WsDcm-0006P0-0p
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 12:01:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WsDcd-0000XV-0K
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 12:01:11 -0400
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a]:47374)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WsDcC-0000Gd-Mo; Wed, 04 Jun 2014 12:00:37 -0400
Received: by mail-wi0-f170.google.com with SMTP id bs8so8110977wib.3
	for <multiple recipients>; Wed, 04 Jun 2014 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=YuL7A/odk11IHu7utakd0iDK4DMnXFNXy6IluKDLIKs=;
	b=eDoAiR9a3KDKmvg/PpYAB0NqXRvXl/wP0Ay5R3n3TbIe2QAoMGQBCkTnSh84K4woqc
	7URmpG92f9GoVtu+Ae+TwEAO4R/oDBmmu2ug/kLqui1jGme8vEkbmpvmMxCnT5iA5p0K
	07fZiEYyq8+BvgcwO+R2Tb7fcAHcE0mScvw6DMvBXvVuZ1LkOb6nHqkQXStR3bo6h5gD
	2oWlkZQCWkkof8SPtGPawMU62EMUZZ23vFZCA/TMGhaxZmUL245+tQem+Vp54d7OXB60
	y9tUlC1zOYTzwkysCzAyBQ+pdZhY300oFdE2+5O9jP+SE6OM0emuJDVByWn1uiTLZ4uw
	t8Fg==
X-Received: by 10.14.198.6 with SMTP id u6mr2561504een.60.1401897634564;
	Wed, 04 Jun 2014 09:00:34 -0700 (PDT)
Received: from playground.station (net-37-117-132-7.cust.vodafonedsl.it.
	[37.117.132.7])
	by mx.google.com with ESMTPSA id m44sm6738108eeh.14.2014.06.04.09.00.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 09:00:33 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Jun 2014 18:00:28 +0200
Message-Id: <1401897628-13422-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22a
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] smbios: use g_free directly on NULL pointers
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
X-List-Received-Date: Wed, 04 Jun 2014 16:01:21 -0000

No need to wrap it with an if.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/smbios.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/i386/smbios.c b/hw/i386/smbios.c
index 7660718..ab89420 100644
--- a/hw/i386/smbios.c
+++ b/hw/i386/smbios.c
@@ -740,11 +740,6 @@ void smbios_set_cpuid(uint32_t version, uint32_t features)
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
@@ -753,7 +748,7 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
 
     /* drop unwanted version of command-line file blob(s) */
     if (smbios_legacy) {
-        G_FREE_UNLESS_NULL(smbios_tables);
+        g_free(smbios_tables);
         /* in legacy mode, also complain if fields were given for types > 1 */
         if (find_next_bit(have_fields_bitmap,
                           SMBIOS_MAX_TYPE+1, 2) < SMBIOS_MAX_TYPE+1) {
@@ -762,7 +757,7 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
             exit(1);
         }
     } else {
-        G_FREE_UNLESS_NULL(smbios_entries);
+        g_free(smbios_entries);
     }
 
     SMBIOS_SET_DEFAULT(type1.manufacturer, manufacturer);
-- 
1.8.3.1


