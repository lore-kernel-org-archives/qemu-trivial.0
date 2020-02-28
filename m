Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e7j-0000bW-1i
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e7f-0000UH-Vk
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e7f-0001Rz-2J
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43441
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e7e-0001RO-UJ
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZikWdiIjGHwkJ5s5xsyOGuFMUcLn0/m4b9roi2lzt0=;
 b=P6w2swx1ntky0vhExHpbrQ3FrNowzCFipoqxjdW47cOeEFiV1PDxBCjcx2FuY6EYlilA2V
 ulByqMJztbA/7/Kj178/PGk7s9hoGNRDqY97VD431vNx0SxSp2iEm7LWuiMjxrfgRpJgYJ
 TZug8qi+MK5WX4AeluOmylgFPsGxWls=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-LGwWGZRaOHekHeOCZ2hXFw-1; Fri, 28 Feb 2020 06:48:00 -0500
X-MC-Unique: LGwWGZRaOHekHeOCZ2hXFw-1
Received: by mail-wr1-f71.google.com with SMTP id w6so1214683wrm.16
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7/Nc+BormBNRjwYo07kcxhw053jMRgcHlLvuvF2I3Yg=;
 b=lLB21yRSlYWrcRcZHRFlhfP71L1HDgwynbvPjqelXX+eZ+6HaXy1XeDhixQY+blx+0
 ZIMkHwsTnPLOTMFtreDmvfMdat5qDfEY0NJ+o1xKm0GNNfMiprK/ldfiZ7pYSHaEQPta
 vYU09v93LAD3zQgUk7kAf+t2IZKqj2zTdfjFN1niQk0BnYOmf7gqX/w3wVpxrc00ln3Q
 yb7tNiaMHdEuV9jn46ubmncNYfu8lCIe7q1Iqc6PO+6DuilzCt87Ch0U8qcbmHzKp865
 nQGDzP6eHO1m9DPMQmkOvTs8tcB+nN1WLNWlyZcMp3431pbrgs2CiN2gFa0eUWRi8j0Z
 xXpA==
X-Gm-Message-State: APjAAAVZWwfjZ/HNwOIANXb3alLBwVdY39mI2M2RY96J4pcyzFICFEA8
 qq7BARxRVaLNNCUPIJZtYUFC3k4dyrQ8SZHFbGMPqa4v6U8mcmLipxqfqtdFDtTJVm6qf/oyTxj
 LKQcnw3R4LgHsJdIVzA==
X-Received: by 2002:adf:fc10:: with SMTP id i16mr1242379wrr.331.1582890479512; 
 Fri, 28 Feb 2020 03:47:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwX1PlFUd70akunglxnfTPEuLh7bKZtTlkbg22tnwWQsflCw+cuFlsy7JGHo5YlLqdJeeG/ug==
X-Received: by 2002:adf:fc10:: with SMTP id i16mr1242372wrr.331.1582890479343; 
 Fri, 28 Feb 2020 03:47:59 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id v8sm11901514wrw.2.2020.02.28.03.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:47:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 11/18] hw/timer/hpet: Include "exec/address-spaces.h"
Date: Fri, 28 Feb 2020 12:46:42 +0100
Message-Id: <20200228114649.12818-12-philmd@redhat.com>
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
X-Received-From: 207.211.31.120
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

hw/timer/hpet.c calls address_space_stl_le() declared in
"exec/address-spaces.h". Include it.

This fixes (when modifying unrelated headers):

  hw/timer/hpet.c:210:31: error: use of undeclared identifier 'address_spac=
e_memory'
          address_space_stl_le(&address_space_memory, timer->fsb >> 32,
                               ^~~~~~~~~~~~~~~~~~~~

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/hpet.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 4f30dd50a4..380acfa7c8 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -36,6 +36,7 @@
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "hw/timer/i8254.h"
+#include "exec/address-spaces.h"
=20
 //#define HPET_DEBUG
 #ifdef HPET_DEBUG
--=20
2.21.1


