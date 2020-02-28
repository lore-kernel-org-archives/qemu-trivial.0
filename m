Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e8i-0002JZ-Tb
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e8Z-0002CY-Sx
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:49:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e8Y-0001ep-Cj
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:59 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54322
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e8X-0001eX-RM
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0EjffDBHi226hzTHZyYKDBY0an4Sy/NVV/eLW24fAuA=;
 b=STSl2nAMmOL2qDxs4UBAGWPTuEzSosvsYuYABJ4HrhRrUbchMZlT8Jpq25HbfJZCIYwgCo
 qbsEMFSgRAAalH278BNOHV7ZZqmqbuPsFat2Nb/d6uIcVDhVHRq3n1LRtAERAhZ4mZVWB4
 MzDHszg0hpuOZS89T42wqYBdw7vAKok=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-9c0YACPiNsaNLLZ7M61O-A-1; Fri, 28 Feb 2020 06:48:55 -0500
X-MC-Unique: 9c0YACPiNsaNLLZ7M61O-A-1
Received: by mail-wm1-f71.google.com with SMTP id 7so600438wmf.9
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPdxKBjgOkVXpave73Lu3/06gouy+pZ7PYERljGC+KE=;
 b=ozieT/xwOXAxKQni9VsAaDol05LoB9X5U/VDiYCDyUAzeq4B/pvdFqnn0v0fqR2U+x
 Y53Hh5C/cxY6vn9fxEt1Zwwc5KdPOJFKO48RCHJxS4qNNB/78F9hvq6FARKuElK/SoBE
 2ivKlSyKqffkzziVZk1g+cysKj2mLauIbsHyGiUDQX2CEtXdsD3QkURlyiJuRIM86mTF
 0lPxkFJdR6i8G5vPAS1ioIwo9485i6n9pd1bBhQWa0QTI0v7Wtc5mbW9h6PfSB0k5Ib6
 AhUqP/2BgolxlVjDCvMONJ8T+8UN26+mcS7I8zqt3tzA+a5zKpDXPAMnxY/ubWjbJQSl
 +3uw==
X-Gm-Message-State: APjAAAUAUpmnFnSrnBmyLkjPypRj/GOce2iephkofVRVFMuC4PQdulHN
 8+q/6ZRVXBWoHijildjk2xXD0RdJNv8g8dTOWmMyXxAm7ZjiqX0kCpuOUSeVdCIETtFCuowDI/5
 ea0YCqzFpSfXBQrRw3w==
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr4639894wrw.252.1582890534148; 
 Fri, 28 Feb 2020 03:48:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqy//wMIiuctKGtFr41xfgEgf5isK9uuTADKNwt1zPFLxAqJZPIfd7EY0Bb+5FjTtOpyr+fLHg==
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr4639875wrw.252.1582890533948; 
 Fri, 28 Feb 2020 03:48:53 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id 133sm2082799wmd.5.2020.02.28.03.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:48:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 16/18] hw/i386: Include "hw/mem/nvdimm.h"
Date: Fri, 28 Feb 2020 12:46:47 +0100
Message-Id: <20200228114649.12818-17-philmd@redhat.com>
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
X-List-Received-Date: Fri, 28 Feb 2020 11:49:03 -0000

All this files use methods/definitions declared in the NVDIMM
device header. Include it.

This fixes (when modifying unrelated headers):

  hw/i386/acpi-build.c:2733:9: error: implicit declaration of function 'nvd=
imm_build_acpi' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
        ^
  hw/i386/pc.c:1996:61: error: use of undeclared identifier 'TYPE_NVDIMM'
    const bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
                                                            ^
  hw/i386/pc.c:2032:55: error: use of undeclared identifier 'TYPE_NVDIMM'
    bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
                                                      ^
  hw/i386/pc.c:2040:9: error: implicit declaration of function 'nvdimm_plug=
' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
        nvdimm_plug(ms->nvdimms_state);
        ^
  hw/i386/pc.c:2040:9: error: this function declaration is not a prototype =
[-Werror,-Wstrict-prototypes]
        nvdimm_plug(ms->nvdimms_state);
        ^
  hw/i386/pc.c:2065:42: error: use of undeclared identifier 'TYPE_NVDIMM'
    if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
                                         ^
  hw/i386/pc_i440fx.c:307:9: error: implicit declaration of function 'nvdim=
m_init_acpi_state' is invalid in C99 [-Werror,-Wimplicit-function-declarati=
on]
        nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
        ^
  hw/i386/pc_q35.c:332:9: error: implicit declaration of function 'nvdimm_i=
nit_acpi_state' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
        nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
        ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/acpi-build.c | 1 +
 hw/i386/pc.c         | 1 +
 hw/i386/pc_piix.c    | 1 +
 hw/i386/pc_q35.c     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9c4e46fa74..9335a82e9f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -47,6 +47,7 @@
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "hw/mem/memory-device.h"
+#include "hw/mem/nvdimm.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
=20
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6ab4acb0c6..362eb2a180 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -76,6 +76,7 @@
 #include "hw/boards.h"
 #include "acpi-build.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
 #include "qapi/visitor.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index fa12203079..82f1693901 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -60,6 +60,7 @@
 #include "migration/global_state.h"
 #include "migration/misc.h"
 #include "sysemu/numa.h"
+#include "hw/mem/nvdimm.h"
=20
 #define MAX_IDE_BUS 2
=20
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 84cf925cf4..d37c425e22 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -53,6 +53,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/numa.h"
+#include "hw/mem/nvdimm.h"
=20
 /* ICH9 AHCI has 6 ports */
 #define MAX_SATA_PORTS     6
--=20
2.21.1


