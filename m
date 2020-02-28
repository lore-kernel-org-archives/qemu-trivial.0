Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7e6o-0007VY-Ro
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7e6j-0007La-0a
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7e6h-00019j-Qv
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:04 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49560
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7e6h-00019X-O8
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582890423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AmxNuFC3e6lYnUMNlpXbB6JPWDYdS6Xlgt71LjznSWc=;
 b=f/iv7xeSBcTYgwkMxMfOmkIjwsN9ZCF/v88FinJZE7Cz0N1FqcaV5yju017qpIPAVL2Woz
 VIIqq+sQ8BndXvaEGx+77wy02POBb5klk4TAHpNeXASIu4Dyg5l7OzV+UDJid8EfIQYN8J
 tr+E86Ce/5e1HiX8xOniEuP4pGjjgvI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-UL0sVwjcNzaV_-Odnla3bQ-1; Fri, 28 Feb 2020 06:46:54 -0500
X-MC-Unique: UL0sVwjcNzaV_-Odnla3bQ-1
Received: by mail-wr1-f70.google.com with SMTP id o9so1224122wrw.14
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yuQOAGBwnnozKVeLt+LTAi2McDFqWK9ifpJf4wdoSwk=;
 b=tlkUXBzCKQmFZyhDwItFyxtW8kahwIYAWJtcpQqtiOMg4C0ot/4Gl8Ma4eIguRGUeP
 EWoiM6QmCjUg2kNKPnluegKhcbYsREJPNudoRMshCC1pFOhQ69IJXIw/5nYFQGlNyZjy
 9QO7QpV8yC1+g996WD4TIQxLgJfelwIwLh34oygaMNDUGMeP1ry6wimK9vKXsmtxagLE
 f9Wv5K4iIHr+u1hnoMC0r0mgSujDXHc4D78M6gU05S9NWW1ifOc9uyJjIsoVLFyORga2
 lKdaTOaveq3is63QDYGrQR04F6jK2GoMVI/BA7/IZC2mKz6WMt2cWDM3mqj0uly1+Gmp
 GIhA==
X-Gm-Message-State: APjAAAXvCjvoY8Bha8IokLox8oLUn32ZnLS24BLVVxGrS9djnbApPzFP
 w8k8sRlaxc1JVyUSBQigGGOAlpEBVAofQzCOEIKwWaVmsWQr49v0n/1JprOv1BKCiBYDDezwAq2
 hnsPM0lURuz6A9pogrg==
X-Received: by 2002:adf:d4d2:: with SMTP id w18mr4808772wrk.180.1582890413643; 
 Fri, 28 Feb 2020 03:46:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqwN6gIsA/l0Pj7FF9JVSiXFX66nvRoBFxr3C1FT2WelKnn338ckD0zAyyRGpALF7mj+t2NkNg==
X-Received: by 2002:adf:d4d2:: with SMTP id w18mr4808748wrk.180.1582890413322; 
 Fri, 28 Feb 2020 03:46:53 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id q138sm1127219wme.41.2020.02.28.03.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:46:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 00/18] hw: Clean up hw/i386 headers (and few alpha/hppa)
Date: Fri, 28 Feb 2020 12:46:31 +0100
Message-Id: <20200228114649.12818-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
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
X-List-Received-Date: Fri, 28 Feb 2020 11:47:06 -0000

[Rebased since v1]:
https://www.mail-archive.com/qemu-block@nongnu.org/msg57485.html

This is a follow-up of Markus's cleanup series:
Tame a few "touch this, recompile the world"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg635748.html

This part is mostly restricted to X86, but since some file from the
Alpha/PA-RISC machines include "hw/i386/pc.h" I had to fix them
too.

Eventually I'll succeed at removing hw/i386/ dependency on non-X86
platforms (Quest I started 2 years ago...).

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (18):
  vl: Add missing "hw/boards.h" include
  hw/southbridge/ich9: Removed unused headers
  hw/i386/ioapic_internal: Remove unused "hw/i386/ioapic.h" header
  hw/timer: Remove unused "ui/console.h" header
  hw/usb/dev-storage: Remove unused "ui/console.h" header
  hw/i386/intel_iommu: Remove unused includes
  hw/alpha/alpha_sys: Remove unused "hw/ide.h" header
  hw/alpha/dp264: Include "net/net.h"
  hw/hppa/machine: Include "net/net.h"
  hw/acpi/cpu_hotplug: Include "hw/pci/pci.h"
  hw/timer/hpet: Include "exec/address-spaces.h"
  hw/pci-host/q35: Include "qemu/range.h"
  hw/i2c/smbus_ich9: Include "qemu/range.h"
  hw/pci-host/piix: Include "qemu/range.h"
  hw/acpi: Include "hw/mem/nvdimm.h"
  hw/i386: Include "hw/mem/nvdimm.h"
  hw/pci-host/q35: Remove unused includes
  hw/i386/pc: Clean up includes

 hw/alpha/alpha_sys.h              |  1 -
 include/hw/i386/ich9.h            |  1 -
 include/hw/i386/intel_iommu.h     |  4 ----
 include/hw/i386/ioapic_internal.h |  1 -
 include/hw/i386/pc.h              | 11 +++--------
 include/hw/pci-host/q35.h         |  8 +-------
 hw/acpi/cpu_hotplug.c             |  1 +
 hw/acpi/ich9.c                    |  2 +-
 hw/acpi/piix4.c                   |  1 +
 hw/alpha/dp264.c                  |  1 +
 hw/hppa/machine.c                 |  1 +
 hw/i2c/smbus_ich9.c               |  1 +
 hw/i386/acpi-build.c              |  1 +
 hw/i386/pc.c                      |  1 +
 hw/i386/pc_piix.c                 |  1 +
 hw/i386/pc_q35.c                  |  1 +
 hw/isa/lpc_ich9.c                 |  1 -
 hw/pci-host/i440fx.c              |  1 +
 hw/pci-host/q35.c                 |  1 +
 hw/rtc/twl92230.c                 |  1 -
 hw/timer/hpet.c                   |  2 +-
 hw/usb/dev-storage.c              |  1 -
 softmmu/vl.c                      |  1 +
 23 files changed, 18 insertions(+), 27 deletions(-)

--=20
2.21.1


