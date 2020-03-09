Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBNuf-0003s6-9M
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 15:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jBNuc-0003km-Bp
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 15:18:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jBNub-00067n-3R
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 15:18:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22601
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jBNua-00066i-W9
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 15:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583781480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KN5Lztumt4MT507GNyJ7s1Z0S9UNEQ0wlWNZR4FSe4M=;
 b=JQx8pK11qWTo/jEwOIjWaSx1g3HBRwhzvpoyWuWpOngaxWIpOI3hvnPKmtxNdwBZsE+Vud
 J4H4Hbf4qVvuolAYAhBwpeRzenKInz9/bngGEvR2oV3Zn3tyC9e186sPTkrmwzHi3bYp5w
 JNUJKd5mG8Z4q6JnRstraldTOwoEJQc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-ciIMvKraM8C8JYEdsDNS6g-1; Mon, 09 Mar 2020 15:17:57 -0400
X-MC-Unique: ciIMvKraM8C8JYEdsDNS6g-1
Received: by mail-qk1-f200.google.com with SMTP id e13so7946478qkm.23
 for <qemu-trivial@nongnu.org>; Mon, 09 Mar 2020 12:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=duaZiTgTxNvQrcdo/ncFZBotrmtLMlOJLCKEjcPeZ+k=;
 b=UxVvUNvzsa6rENJNWEpE6GsuTgeCEBpcVb5gU3QzGyukb4TsCJ//di/UxyNo8cBlLV
 /TlXymxiOkCtjwjtsxpRIBIZFOhOQZCBXalOgc17rdfYc7+XVllcvmIE8yjwKTFyOoUD
 5OFmzukkfOCaTUzYojwekuFdmb+yMdNbcucBzzab3BOrLHwfcJ2EmujDxVgxKfXt5MhL
 bqjxZiTqGQp1a/4pMJZ9tF4SRPXwTLZjwsOoRFNh0Q/mhJF6X+sNqmTD0f5u53mB/H1k
 6k+bwBJhViVQ3QTkT/RWP7aM4oqV25RKIHPucq1Oca8TfwWzlHnM4lW9q4qcha6nqCTP
 SDjg==
X-Gm-Message-State: ANhLgQ1ZSCIYptNzPihQ+W6+d7ZVXMEdMQ1iPFaO1UoeHD2Zi1by8PJI
 dlkLkXYsQDg6kkCpFNphBOyX1VZT07XYWkAZLqHWVOB3FLChs2rmSqLfM7QYYTBTixWKPX0UMCi
 lDhrA66a6A7uhD56m4g==
X-Received: by 2002:a0c:8402:: with SMTP id l2mr15434786qva.227.1583781474266; 
 Mon, 09 Mar 2020 12:17:54 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsN9VaocfI8nL5avF8Uvqm1HtwNzmTswfv7fhCQ5DKa38eZtzi07ZxICBU5F9Nj7eoYfL7q4A==
X-Received: by 2002:a0c:8402:: with SMTP id l2mr15434739qva.227.1583781473955; 
 Mon, 09 Mar 2020 12:17:53 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id r46sm6835526qtb.87.2020.03.09.12.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 12:17:53 -0700 (PDT)
Date: Mon, 9 Mar 2020 15:17:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Helge Deller <deller@gmx.de>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 00/33] Trivial branch patches
Message-ID: <20200309151621-mutt-send-email-mst@kernel.org>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
X-List-Received-Date: Mon, 09 Mar 2020 19:18:03 -0000

On Mon, Mar 09, 2020 at 04:08:04PM +0100, Laurent Vivier wrote:
> The following changes since commit 7a5853cec479a448edae0fb2aaf4e2f78c9c77=
4d:
>=20
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2020-03-09 10:32:53 +0000)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>=20
> for you to fetch changes up to 916c92503bd5348a33e561db600d8894bde636bb:
>=20
>   monitor/hmp-cmds: Remove redundant statement in hmp_rocker_of_dpa_group=
s() (2020-03-09 15:59:31 +0100)


Could you avoid CC everyone involved on the whole PULL req?
I was involved in a patch or two and don't really need to see
the whole series. Just the cover and the relevant patches
would be enough - if I do want it there's always lore.


> ----------------------------------------------------------------
> - includes cleanup
> - reduce .data footprint
> - fix warnings reported by Clang static code analyzer
> - fix dp8393x part lost in merge
> - update git.orderfile and rules.mak
>=20
> ----------------------------------------------------------------
>=20
> Chen Qun (7):
>   block/stream: Remove redundant statement in stream_run()
>   block/file-posix: Remove redundant statement in raw_handle_perm_lock()
>   dma/xlnx-zdma: Remove redundant statement in zdma_write_dst()
>   scsi/scsi-disk: Remove redundant statement in
>     scsi_disk_emulate_command()
>   display/pxa2xx_lcd: Remove redundant statement in
>     pxa2xx_palette_parse()
>   display/exynos4210_fimd: Remove redundant statement in
>     exynos4210_fimd_update()
>   monitor/hmp-cmds: Remove redundant statement in
>     hmp_rocker_of_dpa_groups()
>=20
> Eric Blake (1):
>   maint: Include top-level *.rst files early in git diff
>=20
> Finn Thain (1):
>   dp8393x: Mask EOL bit from descriptor addresses, take 2
>=20
> Pan Nengyuan (1):
>   core/qdev: fix memleak in qdev_get_gpio_out_connector()
>=20
> Philippe Mathieu-Daud=E9 (23):
>   build-sys: Move the print-variable rule to rules.mak
>   hw/audio/fmopl: Fix a typo twice
>   hw/net/e1000: Add readops/writeops typedefs
>   hw/net/e1000: Move macreg[] arrays to .rodata to save 1MiB of .data
>   virtfs-proxy-helper: Make the helper_opts[] array const
>   vl: Add missing "hw/boards.h" include
>   hw/southbridge/ich9: Removed unused headers
>   hw/i386/ioapic_internal: Remove unused "hw/i386/ioapic.h" header
>   hw/timer: Remove unused "ui/console.h" header
>   hw/usb/dev-storage: Remove unused "ui/console.h" header
>   hw/i386/intel_iommu: Remove unused includes
>   hw/alpha/alpha_sys: Remove unused "hw/ide.h" header
>   hw/alpha/dp264: Include "net/net.h"
>   hw/hppa/machine: Include "net/net.h"
>   hw/acpi/cpu_hotplug: Include "hw/pci/pci.h"
>   hw/timer/hpet: Include "exec/address-spaces.h"
>   hw/pci-host/q35: Include "qemu/range.h"
>   hw/i2c/smbus_ich9: Include "qemu/range.h"
>   hw/pci-host/piix: Include "qemu/range.h"
>   hw/acpi: Include "hw/mem/nvdimm.h"
>   hw/i386: Include "hw/mem/nvdimm.h"
>   hw/pci-host/q35: Remove unused includes
>   hw/i386/pc: Clean up includes
>=20
>  Makefile                          |  3 ---
>  block/file-posix.c                |  1 -
>  block/stream.c                    |  3 +--
>  fsdev/virtfs-proxy-helper.c       |  2 +-
>  hw/acpi/cpu_hotplug.c             |  1 +
>  hw/acpi/ich9.c                    |  2 +-
>  hw/acpi/piix4.c                   |  1 +
>  hw/alpha/alpha_sys.h              |  1 -
>  hw/alpha/dp264.c                  |  1 +
>  hw/audio/fmopl.c                  |  4 ++--
>  hw/core/qdev.c                    |  2 +-
>  hw/display/exynos4210_fimd.c      |  1 -
>  hw/display/pxa2xx_lcd.c           |  1 -
>  hw/dma/xlnx-zdma.c                | 10 +++++-----
>  hw/hppa/machine.c                 |  1 +
>  hw/i2c/smbus_ich9.c               |  1 +
>  hw/i386/acpi-build.c              |  1 +
>  hw/i386/pc.c                      |  1 +
>  hw/i386/pc_piix.c                 |  1 +
>  hw/i386/pc_q35.c                  |  1 +
>  hw/isa/lpc_ich9.c                 |  1 -
>  hw/net/dp8393x.c                  |  4 ++--
>  hw/net/e1000.c                    |  6 ++++--
>  hw/net/e1000e_core.c              |  6 ++++--
>  hw/pci-host/i440fx.c              |  1 +
>  hw/pci-host/q35.c                 |  1 +
>  hw/rtc/twl92230.c                 |  1 -
>  hw/scsi/scsi-disk.c               |  1 -
>  hw/timer/hpet.c                   |  2 +-
>  hw/usb/dev-storage.c              |  1 -
>  include/hw/i386/ich9.h            |  1 -
>  include/hw/i386/intel_iommu.h     |  4 ----
>  include/hw/i386/ioapic_internal.h |  1 -
>  include/hw/i386/pc.h              | 11 +++--------
>  include/hw/pci-host/q35.h         |  8 +-------
>  monitor/hmp-cmds.c                |  5 +----
>  rules.mak                         |  3 +++
>  scripts/git.orderfile             |  1 +
>  softmmu/vl.c                      |  1 +
>  39 files changed, 43 insertions(+), 55 deletions(-)
>=20
> --=20
> 2.24.1


