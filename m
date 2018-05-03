Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fEN9v-0001Qj-JZ
	for mharc-qemu-trivial@gnu.org; Thu, 03 May 2018 18:57:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1fEN9t-0001NT-Gq
	for qemu-trivial@nongnu.org; Thu, 03 May 2018 18:57:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1fEN9s-0005wO-Ni
	for qemu-trivial@nongnu.org; Thu, 03 May 2018 18:57:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48084 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1fEN9l-0005lU-Kf; Thu, 03 May 2018 18:56:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E41F8427095C;
	Thu,  3 May 2018 22:56:56 +0000 (UTC)
Received: from probe.redhat.com (ovpn-126-131.rdu2.redhat.com [10.10.126.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E8CC6F9E3;
	Thu,  3 May 2018 22:56:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Cc: qemu-trivial@nongnu.org,
	John Snow <jsnow@redhat.com>
Date: Thu,  3 May 2018 18:56:46 -0400
Message-Id: <20180503225648.13153-4-jsnow@redhat.com>
In-Reply-To: <20180503225648.13153-1-jsnow@redhat.com>
References: <20180503225648.13153-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 03 May 2018 22:56:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 03 May 2018 22:56:56 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'jsnow@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 3/5] qemu-img: remove references to GEN_DOCS
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
X-List-Received-Date: Thu, 03 May 2018 22:57:06 -0000

Nothing seemingly uses this.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qemu-img.c             | 2 --
 qemu-options-wrapper.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 855fa52514..a01425372d 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -123,7 +123,6 @@ static void QEMU_NORETURN help(void)
            "  " arg_string "\n"
 #include "qemu-img-cmds.h"
 #undef DEF
-#undef GEN_DOCS
            "\n"
            "Command parameters:\n"
            "  'filename' is a disk image filename\n"
@@ -4685,7 +4684,6 @@ static const img_cmd_t img_cmds[] = {
     { option, callback },
 #include "qemu-img-cmds.h"
 #undef DEF
-#undef GEN_DOCS
     { NULL, NULL, },
 };
 
diff --git a/qemu-options-wrapper.h b/qemu-options-wrapper.h
index 13bfea0294..6f548e3922 100644
--- a/qemu-options-wrapper.h
+++ b/qemu-options-wrapper.h
@@ -34,7 +34,6 @@
 #undef DEF
 #undef DEFHEADING
 #undef ARCHHEADING
-#undef GEN_DOCS
 
 #undef QEMU_OPTIONS_GENERATE_ENUM
 #undef QEMU_OPTIONS_GENERATE_HELP
-- 
2.14.3


