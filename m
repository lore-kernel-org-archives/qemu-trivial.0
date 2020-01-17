Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1isUx3-0008G2-M1
	for mharc-qemu-trivial@gnu.org; Fri, 17 Jan 2020 11:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isUx0-0008Er-3F
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 11:58:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isUww-0007FH-7e
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 11:58:26 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27250
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isUww-0007ET-3Q
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 11:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579280301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtlpF8hCqPWPuecJjcVs1Of/sWKhtu9gUlJyHqUkIoM=;
 b=RNdO6s+xH2HT01SJ326RYh9EENaXXpBooQAQqGKmyLx+S9mOMv9rrpwNUHzs/5m0K6GySK
 +zcK2ZZyiLNZDYfatWKHbfhusFNP4RQttdvvcme0OudW6sSwrhoJacfwmErSSLv44WaTb2
 APE1+b94xkq0Vu1SuBuUSfpTbnXltCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-al6e_ps3OnOL1XXjg1l0IQ-1; Fri, 17 Jan 2020 11:58:20 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E39F9800D50;
 Fri, 17 Jan 2020 16:58:18 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-206-6.brq.redhat.com [10.40.206.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D0415D9CD;
 Fri, 17 Jan 2020 16:58:17 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 1/2] MAINTAINERS: Add missing m48t59 files to the PReP
 section
Date: Fri, 17 Jan 2020 17:58:08 +0100
Message-Id: <20200117165809.31067-2-philmd@redhat.com>
In-Reply-To: <20200117165809.31067-1-philmd@redhat.com>
References: <20200117165809.31067-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: al6e_ps3OnOL1XXjg1l0IQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
X-List-Received-Date: Fri, 17 Jan 2020 16:58:28 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b425d030d..c162145bd0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1084,6 +1084,8 @@ F: hw/pci-host/prep.[hc]
 F: hw/isa/i82378.c
 F: hw/isa/pc87312.c
 F: hw/dma/i82374.c
+F: hw/rtc/m48t59.c
+F: hw/rtc/m48t59-internal.h
 F: hw/rtc/m48t59-isa.c
 F: include/hw/isa/pc87312.h
 F: include/hw/rtc/m48t59.h
--=20
2.21.1


