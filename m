Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e7K-0008T6-93
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41326)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e7F-0008H5-2z
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e7E-0001LN-61
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:36 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23374
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e7E-0001L8-2M
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DiwsHxYwluw0cuqUGGkA84vK67eK7P8CIbL4qQHkagU=;
 b=gFB2MCnAJkiFMxllucJaHAZ6Xit4yNRvkw98hca7qz7a/iSqzjfmV6t2M4aIxO453U2yt4
 euuc+2/fkeA0mSqUHEAME0vCZPUKJY5BgM8p+usfAF3e6dsj7yqVxZlqXFLmrkmtRYVLWG
 Z/7f8ysqmk1ZgBxo/g2wycVryMAoHU8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-qLkQfBxBNim-LmbjJEapfw-1; Fri, 28 Feb 2020 06:47:31 -0500
X-MC-Unique: qLkQfBxBNim-LmbjJEapfw-1
Received: by mail-wr1-f71.google.com with SMTP id w18so1236212wro.2
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=to/q+TAGTTV4TMCuXzmoJpC1A+khKH9U1vgS0Q0SFBQ=;
 b=TodXE8yrWKB6cm0yyNoiNiHsCNF/Y8YcWiqoRhoYpFZw4e67SVnnWYnzvDnX99UdTC
 SvE945xkSvCsUVYNX6+YhJRHbZRXGdpdCvpAmMOUBEDbSj4pQ86msEypCtYTp4j3Tbso
 xX8QMFX9/Vw+LlzTODMKD+bEAeSKuG3kgpd/OWZ/26O6xaBuCO5MMsOryxnsmhAciFxe
 dEidTZWCPRmVuJXjxZnyqkARRp0ZZd40YBuLx/TSlORqw0qW3aQAWkn/sym5UKGA+XyA
 9nhoAsU/cC77q2Vc89Iy8HXaxm4y4vRryFQe7A08NQGP59326gapacNR+bUaMB7XS1Hi
 nHUg==
X-Gm-Message-State: APjAAAXweNwJqBwjbAvNuhjJeRQcA8qHzHZn6DzWJoglXwSmTmNXGgER
 4gZEDE4kk1jVU7SUzW2AOW9CssMe407EW0+G0oZ/3ksZwSkiXKAYHN8zg1u3LmmMT1IBSAtcpFE
 BEu31qkS6AexxewEV2A==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr4730029wrw.182.1582890450751; 
 Fri, 28 Feb 2020 03:47:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwbYVgKMpk9DJ8B7pHReS32Q1gRnOWtmkXXObPKFyp+aHeVvajmQ2zyC3PKEWm6GwHFHu/Rzw==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr4730013wrw.182.1582890450581; 
 Fri, 28 Feb 2020 03:47:30 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id f1sm12392933wro.85.2020.02.28.03.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:47:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: [PATCH v2 07/18] hw/alpha/alpha_sys: Remove unused "hw/ide.h" header
Date: Fri, 28 Feb 2020 12:46:38 +0100
Message-Id: <20200228114649.12818-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200228114649.12818-1-philmd@redhat.com>
References: <20200228114649.12818-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
X-List-Received-Date: Fri, 28 Feb 2020 11:47:38 -0000

alpha_sys.h does not use anything from the "hw/ide.h" header.
Remove it.

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/alpha/alpha_sys.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
index bc0a286226..e2c02e2bbe 100644
--- a/hw/alpha/alpha_sys.h
+++ b/hw/alpha/alpha_sys.h
@@ -6,7 +6,6 @@
 #include "target/alpha/cpu-qom.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
-#include "hw/ide.h"
 #include "hw/boards.h"
 #include "hw/intc/i8259.h"
=20
--=20
2.21.1


