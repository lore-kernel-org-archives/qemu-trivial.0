Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e7k-0000fF-8F
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e7f-0000U9-Ur
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e7e-0001Rq-Ul
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44849
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e7e-0001R3-Dv
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oG2syAmxddzmH8pkr5M8RpghUELPZIGL0i8vM3fPgM8=;
 b=YM2eYcUbz8DgwkSLgB/OMGeNS82X8bUn4MHbhDRNvFRzxh4LfLMPIF2iBtEdkxXY9ZY0ze
 pGJX1hqYvynClGtrhfzkSaWIvfdKtlagf2DwPiTAMsgrd894A6lh2L2gNGFT8WWScOoDvO
 gnVgmcsIX1yY5W0kF3DLk2gnv+MmNoo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-JC5zALxLNXKtRe75rl6A-g-1; Fri, 28 Feb 2020 06:47:57 -0500
X-MC-Unique: JC5zALxLNXKtRe75rl6A-g-1
Received: by mail-wm1-f72.google.com with SMTP id w12so606982wmc.3
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CyFzDanqkMTdQtUsYemEsgIvaK/rIvnd/I4zWxBCovs=;
 b=hhsp9wQah3WA2peyAnTFIyvuhs2sqDgz8IMjikDSUqPr7Oxs7V1MR0UtGJ8TWGXOGj
 v3fVXDQXPKJtOmbcQHA/IaRiSkUzvASss1CALO18caqGMTvpVFPjeLzj9AFvRnDQfAbP
 3GccPsJmSpijz9pYMe+TE2OmQcAP63Z3S9E4T4sKym57AlSK+oNquQ+tmbTPGdulV3R0
 RICeDKuXHZVUlDmZuHMzKNOWZvygG8cQK8b4sdQr00B9K5FolQogywhr/E8SGmkOhZHa
 bFhefpMq+oW8Zyue68cXAATiNe4yjQQGhx8rjyPMeY1igfRUeDttyjXbah2J+L8WjtNr
 mGNg==
X-Gm-Message-State: APjAAAVPoaZV+WjRVpWkV2mVIDyNw9fTdp/KFVZBpFQrO7ciEEBSC6rj
 9SDbU6/25rD+q8gOTrAJWu7pLIJZBx3Su8l3x/sf3UtKqlrSAanGApS9eRat/Q9eFNUuvAWvrkt
 VVrGtw4GalXA/5TjSHg==
X-Received: by 2002:a1c:e483:: with SMTP id b125mr4581419wmh.187.1582890476137; 
 Fri, 28 Feb 2020 03:47:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxoc2NmSiQbBjwvkZ7JfDbfzavlQedgqjrfKmu67Pq/AxFihGtFt1BaY87Dd2WcjsWhpewNUw==
X-Received: by 2002:a1c:e483:: with SMTP id b125mr4581397wmh.187.1582890475900; 
 Fri, 28 Feb 2020 03:47:55 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id v8sm11901514wrw.2.2020.02.28.03.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:47:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v2 09/18] hw/hppa/machine: Include "net/net.h"
Date: Fri, 28 Feb 2020 12:46:40 +0100
Message-Id: <20200228114649.12818-10-philmd@redhat.com>
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
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 28 Feb 2020 11:48:05 -0000

hw/hppa/machine.c uses NICInfo variables which are declared in
"net/net.h". Include it.

This fixes (when modifying unrelated headers):

  hw/hppa/machine.c:126:21: error: use of undeclared identifier 'nb_nics'
      for (i =3D 0; i < nb_nics; i++) {
                      ^
  hw/hppa/machine.c:127:30: error: use of undeclared identifier 'nd_table'
          pci_nic_init_nofail(&nd_table[i], pci_bus, "e1000", NULL);
                               ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/hppa/machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 67181e75ba..d1e59a97f6 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -22,6 +22,7 @@
 #include "qapi/error.h"
 #include "net/net.h"
 #include "qemu/log.h"
+#include "net/net.h"
=20
 #define MAX_IDE_BUS 2
=20
--=20
2.21.1


