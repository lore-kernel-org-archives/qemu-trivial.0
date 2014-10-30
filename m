Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkEAp-0001fI-Ga
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:31:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1XkE9p-0005k4-Qb
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:31:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1Xjv9T-0005tv-2r
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 15:13:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60015)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1Xjv9M-0005lR-Mq; Thu, 30 Oct 2014 15:12:48 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9UJClP0021644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 30 Oct 2014 15:12:47 -0400
Received: from localhost (ovpn-113-184.phx2.redhat.com [10.3.113.184])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9UJCjgb004511; Thu, 30 Oct 2014 15:12:46 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 30 Oct 2014 17:12:33 -0200
Message-Id: <1414696353-23605-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH] target-i386: Remove unused model_features_t
	struct
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
X-List-Received-Date: Fri, 31 Oct 2014 15:31:33 -0000

The struct is not used anymore and can be removed.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target-i386/cpu.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index e194601..e4ccee1 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -442,14 +442,6 @@ const char *get_register_name_32(unsigned int reg)
     return x86_reg_info_32[reg].name;
 }
 
-/* collects per-function cpuid data
- */
-typedef struct model_features_t {
-    uint32_t *guest_feat;
-    uint32_t *host_feat;
-    FeatureWord feat_word;
-} model_features_t;
-
 /* KVM-specific features that are automatically added to all CPU models
  * when KVM is enabled.
  */
-- 
1.9.3


