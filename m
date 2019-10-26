Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iOL3R-00042X-ES
	for mharc-qemu-trivial@gnu.org; Sat, 26 Oct 2019 08:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38745)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iOL3L-0003fP-H1
 for qemu-trivial@nongnu.org; Sat, 26 Oct 2019 08:20:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iOL3J-0000Mv-94
 for qemu-trivial@nongnu.org; Sat, 26 Oct 2019 08:20:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58738)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iOL3J-0000MD-0D
 for qemu-trivial@nongnu.org; Sat, 26 Oct 2019 08:20:17 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A9C944E938
 for <qemu-trivial@nongnu.org>; Sat, 26 Oct 2019 12:20:15 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id z9so2813986wrq.11
 for <qemu-trivial@nongnu.org>; Sat, 26 Oct 2019 05:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P79WRKrO53iDbT1Yf/VUXLVKWsDQGmKDqtRB4o0iXfg=;
 b=fecTkhgNySYNrENeG503PpxCHk6GCW/Y9UchhigUPK6YkC/l3zi1mpOJHBDsz4SnFk
 ZlO3yMIy1c36fvNVO94B5Allinft0BYqsBVvwbNt+dNqGGgd520KajvPYjd7hVNuEW96
 ft840eflZtE9cnZB/sacd1q+9S54OXapuN9gcIMx+HfTpzmbNAQUKDx3js7cWJ3nvS87
 Y3pubMEohXm50tiJPN3kr9M45F7WuTBQZR0wAXwLOqfMHuWO3c7i/tDp/mif1mxLTtuT
 fSOZ5EQ8Y4GD9eq+4h4uROr/QHp9JS8R0i0NXWDjVtK1elJz8Nb9xR7jyd375xByjunh
 DYcw==
X-Gm-Message-State: APjAAAWYoa4A12wWgc/Ze3BvW1/P4BX5BUoR6p9t6rVxlB+D1pioACMh
 ywcE+Pb9H4rKQ0rjTSzDsBVVuoaMDaSXm/cVg/yDV0wAdW9hCBPP0S2lCWw2QkP6kwBuUSNSFZo
 K4L19rc2NrPF0xpM/LA==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr7153952wmk.123.1572092414386; 
 Sat, 26 Oct 2019 05:20:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuJ/f9ONX2qfY/u1dx6O5YUqz+m/l5HRG42LCVUfxYjQ1FsJbSYGQWLf+EehBmJG/YM2Ds4Q==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr7153907wmk.123.1572092414091; 
 Sat, 26 Oct 2019 05:20:14 -0700 (PDT)
Received: from [192.168.1.33] (62.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.62])
 by smtp.gmail.com with ESMTPSA id y3sm9322335wro.36.2019.10.26.05.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Oct 2019 05:20:13 -0700 (PDT)
Subject: Re: [PATCH 00/20] hw: Clean up hw/i386 headers (and few alpha/hppa)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Fam Zheng <fam@euphon.net>,
 Helge Deller <deller@gmx.de>, Wen Congyang <wencongyang2@huawei.com>,
 qemu-block@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 John Snow <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-arm@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 xen-devel@lists.xenproject.org, Max Reitz <mreitz@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dacba192-0a1e-9801-3e6f-02583bd8b994@redhat.com>
Date: Sat, 26 Oct 2019 14:20:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Sat, 26 Oct 2019 12:20:21 -0000

Hi,

On 10/14/19 4:22 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> This is a follow-up of Markus's cleanup series:
> Tame a few "touch this, recompile the world"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg635748.html
>=20
> This part is mostly restricted to X86, but since some file from the
> Alpha/PA-RISC machines include "hw/i386/pc.h" I had to fix them
> too.
>=20
> Eventually I'll succeed at removing hw/i386/ dependency on non-X86
> platforms (Quest I started 2 years ago...).
>=20
> Regards,
>=20
> Phil.
>=20
> Philippe Mathieu-Daud=C3=A9 (20):
>    vl: Add missing "hw/boards.h" include
>    hw/southbridge/ich9: Removed unused headers
>    hw/input/pckbd: Remove unused "hw/i386/pc.h" header
>    hw/i386/ioapic_internal: Remove unused "hw/i386/ioapic.h" header
>    hw/timer: Remove unused "ui/console.h" header
>    hw/usb/dev-storage: Remove unused "ui/console.h" header
>    hw/i386/intel_iommu: Remove unused includes
>    hw/xen/xen_pt_load_rom: Remove unused includes
>    hw/alpha/alpha_sys: Remove unused "hw/ide.h" header
>    hw/alpha/dp264: Include "net/net.h"
>    hw/hppa/machine: Include "net/net.h"
>    hw/acpi/cpu_hotplug: Include "hw/pci/pci.h"
>    hw/timer/hpet: Include "exec/address-spaces.h"
>    hw/pci-host/q35: Include "qemu/range.h"
>    hw/i2c/smbus_ich9: Include "qemu/range.h"
>    hw/pci-host/piix: Include "qemu/range.h"
>    hw/acpi: Include "hw/mem/nvdimm.h"
>    hw/i386: Include "hw/mem/nvdimm.h"
>    hw/pci-host/q35: Remove unused includes
>    hw/i386/pc: Clean up includes
Laurent, since this series is fully reviewed, can it go via
your qemu-trivial tree?

Thanks,

Phil.

