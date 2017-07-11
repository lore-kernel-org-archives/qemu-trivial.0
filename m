Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dUrVw-0003p9-9B
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jul 2017 05:31:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dUrVu-0003nt-Aj
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 05:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dUrVt-0007m2-D3
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 05:31:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55878)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dUrVp-0007k2-2k; Tue, 11 Jul 2017 05:31:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3CA580F63;
	Tue, 11 Jul 2017 09:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A3CA580F63
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A3CA580F63
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66874627DD;
	Tue, 11 Jul 2017 09:31:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 11 Jul 2017 11:31:17 +0200
Message-Id: <1499765477-10541-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 11 Jul 2017 09:31:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] trivial: Move softmmu_template.h to the
 accel/tcg/ folder
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
X-List-Received-Date: Tue, 11 Jul 2017 09:31:27 -0000

The header is only used by accel/tcg/cputlb.c so we can
move it to the accel/tcg/ folder, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This patch should be applied after Philippe's "MAINTAINERS:
 update TCG entries" patch here:
 https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg06529.html

 MAINTAINERS                                        | 1 -
 softmmu_template.h => accel/tcg/softmmu_template.h | 0
 2 files changed, 1 deletion(-)
 rename softmmu_template.h => accel/tcg/softmmu_template.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 74b3956..993b12e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -86,7 +86,6 @@ M: Richard Henderson <rth@twiddle.net>
 S: Maintained
 F: cpus.c
 F: exec.c
-F: softmmu_template.h
 F: accel/tcg/
 F: include/exec/cpu*.h
 F: include/exec/exec-all.h
diff --git a/softmmu_template.h b/accel/tcg/softmmu_template.h
similarity index 100%
rename from softmmu_template.h
rename to accel/tcg/softmmu_template.h
-- 
1.8.3.1


