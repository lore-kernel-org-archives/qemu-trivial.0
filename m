Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e8j-0002Jd-3W
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41673)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e8b-0002Da-LD
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:49:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e8Z-0001fO-VP
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:49:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45368
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e8Z-0001f0-R7
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpvhBcgDEFXbW4nnsILUgB/YwCbsH+JgLvDjsUesnxw=;
 b=bTNH6AFsaACRtqwOKo7a3nzFFCfpykxQIsnQg4HfJcVFuJYHL9Bd02RHqn/fsCLelQ+2B8
 ZRroFv2Uepx3DUQJFCDESPwJ/OEt9s2y325UjvrQ7LyVzwLCinwwoeClU4PZiGkykXI5e6
 2K85bLMbjDG5xl2N9H3/d9oxWsWj578=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-fU944Z-IP1u2IrJPQ_ejBA-1; Fri, 28 Feb 2020 06:48:57 -0500
X-MC-Unique: fU944Z-IP1u2IrJPQ_ejBA-1
Received: by mail-wr1-f72.google.com with SMTP id z1so1226577wrs.9
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TAAC6hBU6t+zLFkPHrngSmK6nZvpAvnMhu+yhsKCpbQ=;
 b=M7pojYP+ltXdZwAhAou/CYT8gMLJJURsyD+u/5ByHbuN1REkVMx/hgTsSf9h9RZNmG
 4xYMOTzULGHWev3HB+S/JqAWeXk25+vIjuXi3DmSsNhPjpx8rI315izTvEYJcqtXJF2x
 jOcWyDtbEscRgLvAXBHVV4dCedTNPySqi/szIv6lBny+/Ne0VNINjSCLcfvTQV5XhsqF
 cwum8/ej9IEMahirzy0OMtflCJJa7BpIWfwEPKU10SS46VcgZU8Exiprlf9UNAFkJK3R
 Fg4hwH97VWRPQXLygvq/Glf2GKeNf8EiFKhHoNGq7H+4YfOO5YgIQtRAkJ6YjZqeE6o5
 3Bzw==
X-Gm-Message-State: APjAAAVksKA9iKZY4d03b2Qr+83ExDzOkEKrGdOkkWOdMymR7LwuSW0V
 yQgHj2GExHsjwgas5PzkD+yYzebhUlnkZQPGgONIbVVsSFnrTPiNbFsE66E/qFuQbnfYwm+Ad6u
 g6zc4faeGdEl7z5uWeA==
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr4452245wma.84.1582890535987; 
 Fri, 28 Feb 2020 03:48:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZl9sQglFXX2f58Og2cQLISqqwnYjcxfrvyrAnaP7z/50j7WPYiaW2EQvhFtgE5mUHQ9bYdA==
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr4452232wma.84.1582890535765; 
 Fri, 28 Feb 2020 03:48:55 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id 133sm2082799wmd.5.2020.02.28.03.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:48:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 17/18] hw/pci-host/q35: Remove unused includes
Date: Fri, 28 Feb 2020 12:46:48 +0100
Message-Id: <20200228114649.12818-18-philmd@redhat.com>
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
X-List-Received-Date: Fri, 28 Feb 2020 11:49:03 -0000

Only q35.c requires declarations from "hw/i386/pc.h", move it there.
Remove all the includes not used by "q35.h".

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/pci-host/q35.h | 7 -------
 hw/pci-host/q35.c         | 1 +
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index 47086c645e..070305f83d 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -22,16 +22,9 @@
 #ifndef HW_Q35_H
 #define HW_Q35_H
=20
-#include "hw/isa/isa.h"
-#include "hw/sysbus.h"
-#include "hw/i386/pc.h"
-#include "hw/isa/apm.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie_host.h"
-#include "hw/acpi/acpi.h"
-#include "hw/acpi/ich9.h"
 #include "hw/pci-host/pam.h"
-#include "hw/i386/intel_iommu.h"
 #include "qemu/units.h"
 #include "qemu/range.h"
=20
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index a9b9ccc876..993f467668 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -29,6 +29,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "hw/i386/pc.h"
 #include "hw/pci-host/q35.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
--=20
2.21.1


