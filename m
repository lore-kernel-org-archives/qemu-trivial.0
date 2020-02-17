Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3dSL-0007Pn-QL
	for mharc-qemu-trivial@gnu.org; Mon, 17 Feb 2020 05:16:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58665)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3dSJ-0007PL-Fa
 for qemu-trivial@nongnu.org; Mon, 17 Feb 2020 05:16:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3dSI-0003B7-EB
 for qemu-trivial@nongnu.org; Mon, 17 Feb 2020 05:16:47 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32490
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3dSI-0003AI-BD
 for qemu-trivial@nongnu.org; Mon, 17 Feb 2020 05:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581934605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IUaVcGjN28qdV/RxtUDKDL/AV+GNVJZv0wUdvWNIeo0=;
 b=coLs4Vg9HzFKKN7ydfmSwcM3QAtrXOj3wKeKozA/eftOzhYMXPkF1F5QI6yi2KYtJ5wopV
 msg6KHWfkp+RxGpkoAxmSRxvkiEfrSv/VSeJ8BryakABioye0hDk4rRcNwQ9n2JjkUQTOW
 2N8cTiLvFgLCVUCEEqOCOm7qE9cuc8g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-RfTqI4rENVeXzgLtw29oGQ-1; Mon, 17 Feb 2020 05:16:42 -0500
Received: by mail-wr1-f70.google.com with SMTP id n23so8701430wra.20
 for <qemu-trivial@nongnu.org>; Mon, 17 Feb 2020 02:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xwLS+COmcR41GGeeIBPxB9dBo+JD9m5623Lo315G/CY=;
 b=N1E7YYL92gPJSCxrA2i4yyjovqRmTdWIInUydDufy1/ZVHguFQ+GVzaK/RkexekcOt
 s5pAFNh0+CRSYw31wGQ5B0QQMUfS/NBxNNSa8E51ud7oaRG5KrdkX2Ws0fg+xE2SQKPc
 AdfFnMBHEwe/yhzjAIYajaqXEyPDfFmUwj0u8zM1vT4k1pMfjK43nMu3Zb410yvfWn4b
 wxrQhKU4QI6nuzYke0Zs6t2sL7V2m34XkhPWUChjm5sg37K42V+QA0kmZmRquwjMQiaz
 Ccy8PVix/1m6KbhNUED7NuG1ZKvEJ8ksiJYd12zsI8et9BolNCYUltcqgkbHnWt671yZ
 QrYw==
X-Gm-Message-State: APjAAAU4gNsgm26/gkKLAhhUq/A+ZWmHbXs69tUSMS5Aq8qJHBsE5TAZ
 okShFC3CMTZ1yuIYWPwdcsMqMRDPrkvs7UCvMq56hOAiHfy1O49P3I/JV9OMJWRMg2Oydvs1MO7
 HqtgARSjS4Jb0wnA0eA==
X-Received: by 2002:a05:600c:410f:: with SMTP id
 j15mr20888158wmi.132.1581934600828; 
 Mon, 17 Feb 2020 02:16:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqx44WJz7H+E9nr52G5R5D5EYr5Wl+aipaNkgq5ZtCqdiZFcdQYkQ7axqELVlGqoYzOJXwMk+w==
X-Received: by 2002:a05:600c:410f:: with SMTP id
 j15mr20888116wmi.132.1581934600400; 
 Mon, 17 Feb 2020 02:16:40 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id s23sm295486wra.15.2020.02.17.02.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 02:16:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/net/rocker: Report unimplemented feature with
 qemu_log_mask(UNIMP)
Date: Mon, 17 Feb 2020 11:16:37 +0100
Message-Id: <20200217101637.27558-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-MC-Unique: RfTqI4rENVeXzgLtw29oGQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Mon, 17 Feb 2020 10:16:48 -0000

Fix warnings reported by Clang static code analyzer:

    CC      hw/net/rocker/rocker.o
  hw/net/rocker/rocker.c:213:9: warning: Value stored to 'tx_tso_mss' is ne=
ver read
          tx_tso_mss =3D rocker_tlv_get_le16(tlvs[ROCKER_TLV_TX_TSO_MSS]);
          ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  hw/net/rocker/rocker.c:217:9: warning: Value stored to 'tx_tso_hdr_len' i=
s never read
          tx_tso_hdr_len =3D rocker_tlv_get_le16(tlvs[ROCKER_TLV_TX_TSO_HDR=
_LEN]);
          ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
  hw/net/rocker/rocker.c:255:9: warning: Value stored to 'tx_l3_csum_off' i=
s never read
          tx_l3_csum_off +=3D tx_tso_mss =3D tx_tso_hdr_len =3D 0;
          ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: dc488f888
Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/net/rocker/rocker.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 81dd3b5f14..15d66f6cbc 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -27,6 +27,7 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/bitops.h"
+#include "qemu/log.h"
=20
 #include "rocker.h"
 #include "rocker_hw.h"
@@ -207,14 +208,22 @@ static int tx_consume(Rocker *r, DescInfo *info)
=20
     if (tlvs[ROCKER_TLV_TX_L3_CSUM_OFF]) {
         tx_l3_csum_off =3D rocker_tlv_get_le16(tlvs[ROCKER_TLV_TX_L3_CSUM_=
OFF]);
+        qemu_log_mask(LOG_UNIMP, "rocker %s: L3 not implemented"
+                                 " (cksum off: %u)\n",
+                      __func__, tx_l3_csum_off);
     }
=20
     if (tlvs[ROCKER_TLV_TX_TSO_MSS]) {
         tx_tso_mss =3D rocker_tlv_get_le16(tlvs[ROCKER_TLV_TX_TSO_MSS]);
+        qemu_log_mask(LOG_UNIMP, "rocker %s: TSO not implemented (MSS: %u)=
\n",
+                      __func__, tx_tso_mss);
     }
=20
     if (tlvs[ROCKER_TLV_TX_TSO_HDR_LEN]) {
         tx_tso_hdr_len =3D rocker_tlv_get_le16(tlvs[ROCKER_TLV_TX_TSO_HDR_=
LEN]);
+        qemu_log_mask(LOG_UNIMP, "rocker %s: TSO not implemented"
+                                 " (hdr length: %u)\n",
+                      __func__, tx_tso_hdr_len);
     }
=20
     rocker_tlv_for_each_nested(tlv_frag, tlvs[ROCKER_TLV_TX_FRAGS], rem) {
@@ -249,12 +258,6 @@ static int tx_consume(Rocker *r, DescInfo *info)
         iovcnt++;
     }
=20
-    if (iovcnt) {
-        /* XXX perform Tx offloads */
-        /* XXX   silence compiler for now */
-        tx_l3_csum_off +=3D tx_tso_mss =3D tx_tso_hdr_len =3D 0;
-    }
-
     err =3D fp_port_eg(r->fp_port[port], iov, iovcnt);
=20
 err_too_many_frags:
--=20
2.21.1


