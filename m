Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e7h-0000YF-N7
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41380)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e7e-0000Qm-Eb
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e7c-0001QZ-T4
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35728
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e7a-0001Q1-RL
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=clfu+t0nynKAESV4ABRDyRXkvPXe/x1JrxJoUGidyU8=;
 b=ZkZCM6kKq9nQCAriP6PGkQ6h2X24W8utKL8ugDrx1/7VcVu6aCL3c3OSfckSrrhwB6N0aL
 PTYNRNsIoReko6d25KksfiDhTMWNTgwnt/hjxTGPHi68Z7pdbuTrc+DgoIE5ew1e5hsn+5
 q3J8azRu1NfoBtVc7cLmdbI/XYlapQQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-aECvzr45MZ6aEO-zL4J5iA-1; Fri, 28 Feb 2020 06:47:55 -0500
X-MC-Unique: aECvzr45MZ6aEO-zL4J5iA-1
Received: by mail-wr1-f69.google.com with SMTP id f10so1232883wrv.1
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8Eqv2g+dIkDMylSsAtJ9DdMEi7WvLS94birm3uZOd0=;
 b=OxAcoy42KcUM+H3bzfS5BqmnrRFbTj9+QdUH3swpp7Xg7MYOOEn91AUjQ4qvU59uTL
 Rel/jRrfAFkAhsJkAvgXF3XfRQm+aqwxg10t6Xy1Co2jluqrZAvBWgVG3i1xcrqTiqe7
 KocQVQWiYESD4NUfkamF/5yzR2pz/AqSYk5yqy4OVRch/FsqqpWtz9YiJjVJhNlAuv4L
 v7PHqkXop7o5g6ikuEO0riXbaPHh2KYVoy54uDs5xueIByN52w0PV/xSH3PSO406akDb
 Cx1XSqrf+Mk/kGU0FIlRgfZhX6XSCsQT4p1ZgtL/d7Y8xYWUuKXzFLx9plIwRra91391
 4lmg==
X-Gm-Message-State: APjAAAW+J+i4x9rk8TlHfsZKAKWW/92x9IQx98We+05sgRyxQrARufqS
 pQqUQlSH2PK4mJuobopn7X1HKgTTBW6RTGPeabb7+c48CxAf3QbAhhQVfZthO5ixR7mLe6ql5zG
 wCCnUbiIGKlSPkc/4jw==
X-Received: by 2002:adf:e542:: with SMTP id z2mr4756448wrm.150.1582890473977; 
 Fri, 28 Feb 2020 03:47:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2iWI36tGdl0VSywd6QUA69oq7tyrDCvfw5F6lrV8yE8S+cSaCD2mEtcb5YzQahCaHekJkMw==
X-Received: by 2002:adf:e542:: with SMTP id z2mr4756429wrm.150.1582890473738; 
 Fri, 28 Feb 2020 03:47:53 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id v8sm11901514wrw.2.2020.02.28.03.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:47:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: [PATCH v2 08/18] hw/alpha/dp264: Include "net/net.h"
Date: Fri, 28 Feb 2020 12:46:39 +0100
Message-Id: <20200228114649.12818-9-philmd@redhat.com>
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
X-List-Received-Date: Fri, 28 Feb 2020 11:48:04 -0000

hw/alpha/dp264.c uses NICInfo variables which are declared in
"net/net.h". Include it.

This fixes (when modifying unrelated headers):

  hw/alpha/dp264.c:89:21: error: use of undeclared identifier 'nb_nics'
      for (i =3D 0; i < nb_nics; i++) {
                      ^
  hw/alpha/dp264.c:90:30: error: use of undeclared identifier 'nd_table'
          pci_nic_init_nofail(&nd_table[i], pci_bus, "e1000", NULL);
                               ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/alpha/dp264.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 8d71a30617..e264c783c1 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -21,6 +21,7 @@
 #include "hw/dma/i8257.h"
 #include "net/net.h"
 #include "qemu/cutils.h"
+#include "net/net.h"
=20
 #define MAX_IDE_BUS 2
=20
--=20
2.21.1


