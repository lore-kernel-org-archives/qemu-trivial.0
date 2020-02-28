Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e7l-0000hL-8m
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41442)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e7g-0000Vd-Hs
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e7f-0001SF-8g
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43804
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e7f-0001Rl-4s
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HrRTVdOozv2swNberymfD/6/LBZVv8zEj+lFL8+gIA8=;
 b=PrvmETWyOxiyo3gYRHdvQCzoJzhWpQyeckfHzjIRstVZHFNSYfBlgc+LC6xArArTsxCu5M
 Fj0ZXULFwoXxiLgZZXH4xxW1vFKSgJ4RtergABTyeelPeZNyNSPkgMJYtAy360u+oHNOJf
 SLJQeUj/lWltQVxdEPagKn6uiMYmWkU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-k_LGMY0wNdiPhHSmt8mn0w-1; Fri, 28 Feb 2020 06:47:59 -0500
X-MC-Unique: k_LGMY0wNdiPhHSmt8mn0w-1
Received: by mail-wm1-f72.google.com with SMTP id c5so1044576wmd.8
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yh9hMHA4I8RamAySV+tXZ2gxC3VYLXS2TKM9OKFdh90=;
 b=coPRAFHJlSnS9mySPgBtMAdKwkcTBGZmRnrLq6MPgfDlK14MK56qaWWpjfylk/oZRD
 gdOkT65CTObsmw9xyq7VlLYLihhz2l2wHSX+L3HH6gGti1z7UPnI39afIvl62NJxfV+c
 pPyw/tf6QWaJ+1SOFmeP1yU3zvUSepLVB2h9eM8pjICIrc3YACPxP9ce1eCgVmqhlyjY
 2ZKcSnErcjQItYaFa0rDN7KO2Io76/MOzyNoIC7D8b+Fs57znZ3KfAuPf9H7qp4DT4wP
 zQOuCBvxzZ06aMD2razxUyGMJDcE3DbDSoc4O82+GWe2AlMz2eFYNKGmU1k4uqtVEs28
 ERrQ==
X-Gm-Message-State: APjAAAWxtqssMx0b4q0CQgvSleS2wmNJyalI7qcy16xkswO2BIM74SqO
 5e5rTp8CCNalr41Z3qkM9aC6Ajhnx06XMQ/79KamZJHgRpUqBVhATovc4O1easLSso2ymz5Rc5n
 n+Alb8PBLSJj8qo2wLw==
X-Received: by 2002:adf:fa0f:: with SMTP id m15mr4775665wrr.392.1582890477933; 
 Fri, 28 Feb 2020 03:47:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqwahxOejGcUYrooOz98isjVLiq45yBuIhe5WFJkm0IJ2JEUp/XhHUcozZZ87r4B+zm0T+daZw==
X-Received: by 2002:adf:fa0f:: with SMTP id m15mr4775659wrr.392.1582890477766; 
 Fri, 28 Feb 2020 03:47:57 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id v8sm11901514wrw.2.2020.02.28.03.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:47:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 10/18] hw/acpi/cpu_hotplug: Include "hw/pci/pci.h"
Date: Fri, 28 Feb 2020 12:46:41 +0100
Message-Id: <20200228114649.12818-11-philmd@redhat.com>
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

hw/acpi/cpu_hotplug.c calls pci_address_space_io(). Include
"hw/pci/pci.h" which declares it.

This fixes (when modifying unrelated headers):

  hw/acpi/cpu_hotplug.c:103:28: error: implicit declaration of function 'pc=
i_address_space_io' is invalid in C99 [-Werror,-Wimplicit-function-declarat=
ion]
      MemoryRegion *parent =3D pci_address_space_io(PCI_DEVICE(gpe_cpu->dev=
ice));
                             ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/acpi/cpu_hotplug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index 9c3bcc84de..3e687d227a 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -14,6 +14,7 @@
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
 #include "hw/i386/pc.h"
+#include "hw/pci/pci.h"
 #include "qemu/error-report.h"
=20
 #define CPU_EJECT_METHOD "CPEJ"
--=20
2.21.1


