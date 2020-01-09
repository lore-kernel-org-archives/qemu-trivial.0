Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipVwM-0000FO-4P
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jan 2020 06:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57869)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ipVwJ-0000FA-JI
 for qemu-trivial@nongnu.org; Thu, 09 Jan 2020 06:25:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ipVwH-0002WI-Md
 for qemu-trivial@nongnu.org; Thu, 09 Jan 2020 06:25:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45583
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ipVwF-0002Ra-Pb
 for qemu-trivial@nongnu.org; Thu, 09 Jan 2020 06:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578569117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VwVlumTRz4lYmIeI6Pd3Oq5csOtynk5EXgYga4znV5s=;
 b=DMpbtzPayHAaZ1P4t25ZtNXaGQdNUwn7esKpmsb9RUhoqbTvPWLm1VT3KloKIz683sAZVi
 SDXobJY/ETbrWl717fEnRHp22r7GenTw7VONhzsFGmPmAgh6QkZxtOIE7NU7+PJCZ33GJp
 YBvB0ovj7ODzbUd99dJCrwJnBeEXqis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-fQV5RlmTNWGzengLQvCWKg-1; Thu, 09 Jan 2020 06:25:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5129B107ACC4;
 Thu,  9 Jan 2020 11:25:15 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-107.brq.redhat.com [10.40.204.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A097460C88;
 Thu,  9 Jan 2020 11:25:07 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/smbios/smbios: Remove unused include
Date: Thu,  9 Jan 2020 12:25:04 +0100
Message-Id: <20200109112504.32622-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: fQV5RlmTNWGzengLQvCWKg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Thu, 09 Jan 2020 11:25:24 -0000

Nothing from "sysemu/cpus.h" is used by smbios.c, remove the include.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/smbios/smbios.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index ded5f1f4e2..1a0f461541 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -24,7 +24,6 @@
 #include "qemu/option.h"
 #include "sysemu/sysemu.h"
 #include "qemu/uuid.h"
-#include "sysemu/cpus.h"
 #include "hw/firmware/smbios.h"
 #include "hw/loader.h"
 #include "hw/boards.h"
--=20
2.21.1


