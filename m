Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e7K-0008SO-1Z
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41309)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e7D-0008Bp-5s
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e7C-0001Kd-4o
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49244
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e7C-0001KV-1X
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8ePsKj5YbwzFmCSbDjLbStV8+VqxxSeQRnfTwIVzUU=;
 b=UQwXTHCq4OIunngg3cUZVckERKEw3juWt8lKVmcdLH5D8hBTPl8/xP9Rd5e6HMZJ3NOVQY
 QAvCzQpWvhIsgA7nfbk+qKd9UlADb+B5ta2pN7yKfIiJ+/FlGQ4FI4ZupIzDIRx0q26lzv
 XShb4vd8lBd/xh6PLWq7K/I+SEqDbj0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-CsyGBMBIOUKAmtp4Yr12cw-1; Fri, 28 Feb 2020 06:47:29 -0500
X-MC-Unique: CsyGBMBIOUKAmtp4Yr12cw-1
Received: by mail-wr1-f70.google.com with SMTP id y28so1203236wrd.23
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T5sSCEp9I6m1ocN4OvxPRUQZAmULP2h9DUzM0g+WsgY=;
 b=POxigamTx+ibY8lLJYIT7/V+WhTsW31qkxD0ifvArsQxiq0vUpJadnhdwmhqL3LZq5
 IRPLh6Ov0h4QNrZ+2DjaVzU/8ntNIK28Qu5GAiHA/eaUC7GwZhb5bAms/Q2lTly4G7/3
 Djsq9yIukMSbtKXmpM5s+hPchRSpqG7+N2Uu2mdHpQw/WpVJ457reV1kKekJr8Grjkn3
 +wK+S5c8IL98kXvth8FqvWkBIUp+JIL5X+ELZTYKlEi2/6fNCjRtLHNFMaHAXMMc7git
 K2a9PHh3MR7XhgLiqm94mTZpGmfEjr4ekQUgx80iMEHKT2uptFEWrWdLz29boupqAz3l
 2jJQ==
X-Gm-Message-State: APjAAAUyT0Vg58zCp8NT2gkkfG2NRVWMKKqrgdQ18muk3F6o2yZFblWZ
 UTXTSoblh+5y+Ybpg7xSS9U/vCFGhAZnwCcdjGGtyVB+LkfFwTLXc90DTKm19J6xDtESmtVU8a/
 hSohOwBjGHowcvG+vWg==
X-Received: by 2002:a5d:6690:: with SMTP id l16mr4741422wru.251.1582890448645; 
 Fri, 28 Feb 2020 03:47:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqzHAG/V9Lgl4O+xWBzgNCPVxffpQWXf5zY4ukcAq+l3DPwWUAFh33GHGippgrBm9pBGh5AtmQ==
X-Received: by 2002:a5d:6690:: with SMTP id l16mr4741418wru.251.1582890448489; 
 Fri, 28 Feb 2020 03:47:28 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id f1sm12392933wro.85.2020.02.28.03.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:47:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 06/18] hw/i386/intel_iommu: Remove unused includes
Date: Fri, 28 Feb 2020 12:46:37 +0100
Message-Id: <20200228114649.12818-7-philmd@redhat.com>
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
X-List-Received-Date: Fri, 28 Feb 2020 11:47:36 -0000

intel_iommu.h does not use any of these includes, remove them.

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/i386/intel_iommu.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 66b931e526..a1c4afcda5 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -22,11 +22,7 @@
 #ifndef INTEL_IOMMU_H
 #define INTEL_IOMMU_H
=20
-#include "sysemu/dma.h"
 #include "hw/i386/x86-iommu.h"
-#include "hw/i386/ioapic.h"
-#include "hw/pci/msi.h"
-#include "hw/sysbus.h"
 #include "qemu/iova-tree.h"
=20
 #define TYPE_INTEL_IOMMU_DEVICE "intel-iommu"
--=20
2.21.1


