Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1URYX5-0000iY-2t
	for mharc-qemu-trivial@gnu.org; Sun, 14 Apr 2013 21:48:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1URYX0-0000ff-Nf
	for qemu-trivial@nongnu.org; Sun, 14 Apr 2013 21:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1URYWx-0000Oc-Ps
	for qemu-trivial@nongnu.org; Sun, 14 Apr 2013 21:48:30 -0400
Received: from mail-da0-x22b.google.com ([2607:f8b0:400e:c00::22b]:46973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1URYWx-0000NQ-I9
	for qemu-trivial@nongnu.org; Sun, 14 Apr 2013 21:48:27 -0400
Received: by mail-da0-f43.google.com with SMTP id u36so1849097dak.2
	for <qemu-trivial@nongnu.org>; Sun, 14 Apr 2013 18:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=oXOYxKoHPCpxGJbba+9SWW3P2DQB68Yjzu5PYnORRDE=;
	b=ficnWDCRpG8FxdUbTh2//q9kzXUd11NaF3hAG0TRrwVIY0Dx9UOQwEpyD/ehz71D4W
	Omj9Rn86MTWpbSiGSd9ExYeYrmMwhr9v+u+SevUnTPHVAO+ofrdIyuK53iD9k3YN+t8d
	dGPzyyUCGM5nbY870AAO50RDIIanFvICoZzKs8XHXbCkrcuZFcuuL/FKuNcu9wp2hTI+
	DHaFqeOW1KgylsoD/HKDyug+C7wBFHzLnAYJmCv8jOI5iHgnmXWYXKNljbcCzEJQsbeQ
	Ap2MPKHhiMP5F868n/ATdopsyHUnxQ080EhzbkXpUYw752NOEX4RbaR0T/7SNvGK/BBa
	TXWg==
X-Received: by 10.68.196.231 with SMTP id ip7mr26026544pbc.61.1365990505320;
	Sun, 14 Apr 2013 18:48:25 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPS id
	pb14sm18182452pbb.27.2013.04.14.18.48.19
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 18:48:23 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 15 Apr 2013 11:47:56 +1000
Message-Id: <1365990476-14975-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <51686F17.7070503@weilnetz.de>
References: <51686F17.7070503@weilnetz.de>
X-Gm-Message-State: ALoCoQl0WWr/EsKGgnHIGvVuHwdpSKGJlHOOFq1/hSnpGU1NUMSclP24deWXiu1BM8W6KrUTp8+h
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c00::22b
Cc: Anthony Liguori <aliguori@us.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
	Stefan Weil <sw@weilnetz.de>, Blue Swirl <blauwirbel@gmail.com>,
	qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH v2] bswap: fix compiler warning
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
X-List-Received-Date: Mon, 15 Apr 2013 01:48:34 -0000

The bswap functions use memcpy but the bswap.h header itself does not seem to
include it in some configuration such as cross compiling for powerpc64
on x86_64 machine.

The patch explicitly includes string.h.

v2:
* #include statement moved to the right place

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/bswap.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index d3af35d..14a5f65 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -4,6 +4,7 @@
 #include "config-host.h"
 #include <inttypes.h>
 #include <limits.h>
+#include <string.h>
 #include "fpu/softfloat.h"
 
 #ifdef CONFIG_MACHINE_BSWAP_H
-- 
1.7.10.4


