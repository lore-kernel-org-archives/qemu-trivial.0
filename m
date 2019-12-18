Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihd0O-0007kT-2u
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2019 12:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37747)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihd0K-0007jk-Ew
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 12:20:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihd0I-0008Ta-Ob
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 12:20:56 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42683
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihd0I-0008Ou-Ea
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 12:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576689653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rhz4RPxPQ1vIc+WeKxKoufDlvutrmYap4D2gdrkuO4c=;
 b=bGW0Qa5UUI0+JsIn8D+UXgwiNoH5NDQL7VUNONVSOvcj8XfmdAC859Jl/OxUNH4XdLKeCP
 ktihfj4xoSsimJsVOvv1i19kmGQ18V/9yN/ToShm1W502qqflNt+4m5RKtBoWRE4FZdLId
 2JQUPc0Nv3+c394Zxhr7IgE86ixvvZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-33cw4hSXMpWhfEe4tLQhMQ-1; Wed, 18 Dec 2019 12:20:52 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E8CEDC20;
 Wed, 18 Dec 2019 17:20:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAAA51001281;
 Wed, 18 Dec 2019 17:20:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Corey Minyard <cminyard@mvista.com>, Corey Minyard <minyard@acm.org>,
 qemu-trivial@nongnu.org
Subject: [PATCH v2 01/14] hw/ipmi: Remove unnecessary declarations
Date: Wed, 18 Dec 2019 18:19:56 +0100
Message-Id: <20191218172009.8868-2-philmd@redhat.com>
In-Reply-To: <20191218172009.8868-1-philmd@redhat.com>
References: <20191218172009.8868-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 33cw4hSXMpWhfEe4tLQhMQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 18 Dec 2019 17:20:59 -0000

Since we don't use these methods before defining them,
no need to forward-declare them.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
---
Cc: Corey Minyard <minyard@acm.org>

In case the other patches are rejected:
Cc: qemu-trivial@nongnu.org
---
 hw/ipmi/ipmi_bmc_extern.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index 87da9ff99c..450926e5fb 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -87,10 +87,6 @@ typedef struct IPMIBmcExtern {
     bool send_reset;
 } IPMIBmcExtern;
=20
-static int can_receive(void *opaque);
-static void receive(void *opaque, const uint8_t *buf, int size);
-static void chr_event(void *opaque, int event);
-
 static unsigned char
 ipmb_checksum(const unsigned char *data, int size, unsigned char start)
 {
--=20
2.21.0


