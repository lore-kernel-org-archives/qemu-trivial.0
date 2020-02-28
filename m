Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e8G-0001gF-1W
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41603)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e8D-0001bi-Hu
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e8B-0001ZC-Mn
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:37 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45895
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e8B-0001Yx-2g
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8BGhqYvAxWxH9RR4HNdmBjAggFWzcDPf58d0HXElA0=;
 b=DuoicvW3PmlexqPMhZY8s2aZ722x1GIQEUUbuDs8Bi86j8E/x8hZM/mt8zlas+T/K+enzU
 faBINFLteVjPZwuBfLur3fr14bPPxhHMcZdSWnkWwIImzOWdXlwDSi5/Qd0N5uSgRuT9kn
 VRZ90d6CH/7hNg8XosF7kRyJzdwAx0s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-ODTrQkUVMvy3IBRiAacLYA-1; Fri, 28 Feb 2020 06:48:31 -0500
X-MC-Unique: ODTrQkUVMvy3IBRiAacLYA-1
Received: by mail-wr1-f70.google.com with SMTP id t14so1215880wrs.12
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XJL8zcwpbbfm3fUEVt8ZadYdnagmELDf/cCcBxJaPzQ=;
 b=pO8Mg6ucMVSVHQEjxy4A8cxFhbMDo5xo5zpMzpFcu6cDTc6JJy2cUS5FmC/MApJjSH
 VXt59A2c+42PkfMFEEZJzbADoQKWu6jBtPHp1LLVJ/zAwIZR3PWGQzi1e4Np75Jz/iLP
 pfueDF95LJSGSoOpJNBcjK6qi5CY0IeskdQk421cFZeYU/4fjXdX+i/qyrIprKNDcArt
 WwSedvG9q3irs8AgBA/RUgj3PDGAdEv6w44/A0oIi5OPA0Olg+z33Pg7d3x5aOoxmWIP
 PUexsR7exuPw4RLHvfRoyzKaIOD16l04xjOoM1REUvYHCk68Mo7eSGcXfVW9wFrZCVgM
 FqTA==
X-Gm-Message-State: APjAAAXSzSm+GU/RD+FUOTWJKiF85MxRpfK98LamlKV1TNcDrOmUgIUD
 eEHwEB6rJfS8imwlCyl2D3g/ThtT/yJ8V8OUDz8FP5HckDlLtTG4ZOy28QHIvCPbMqNlWRExSB/
 +Kw8jVauGP78kVAB77A==
X-Received: by 2002:adf:f641:: with SMTP id x1mr4461372wrp.248.1582890510051; 
 Fri, 28 Feb 2020 03:48:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqxLCjRs3+/wwxvobfNEWrKhWYJfIhitg7qQUMnrsXNtIKgKBTusamdzSQfoVvo9B6Zs8pZyMg==
X-Received: by 2002:adf:f641:: with SMTP id x1mr4461361wrp.248.1582890509891; 
 Fri, 28 Feb 2020 03:48:29 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id a7sm1736226wmj.12.2020.02.28.03.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:48:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v2 15/18] hw/acpi: Include "hw/mem/nvdimm.h"
Date: Fri, 28 Feb 2020 12:46:46 +0100
Message-Id: <20200228114649.12818-16-philmd@redhat.com>
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
X-List-Received-Date: Fri, 28 Feb 2020 11:48:38 -0000

Both ich9.c and piix4.c use methods/definitions declared in the
NVDIMM device header. Include it.

This fixes (when modifying unrelated headers):

  hw/acpi/ich9.c:507:46: error: use of undeclared identifier 'TYPE_NVDIMM'
        if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
                                             ^
  hw/acpi/ich9.c:508:13: error: implicit declaration of function 'nvdimm_ac=
pi_plug_cb' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
            nvdimm_acpi_plug_cb(hotplug_dev, dev);
            ^
  hw/acpi/piix4.c:403:46: error: use of undeclared identifier 'TYPE_NVDIMM'
        if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
                                             ^
  hw/acpi/piix4.c:404:13: error: implicit declaration of function 'nvdimm_a=
cpi_plug_cb' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
            nvdimm_acpi_plug_cb(hotplug_dev, dev);
            ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/acpi/ich9.c  | 1 +
 hw/acpi/piix4.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index fdd0a6c79e..4e74284b65 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -39,6 +39,7 @@
=20
 #include "hw/i386/ich9.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
=20
 //#define DEBUG
=20
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 6d621c31e7..b84dbba2c3 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -38,6 +38,7 @@
 #include "hw/acpi/cpu.h"
 #include "hw/hotplug.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/xen/xen.h"
--=20
2.21.1


