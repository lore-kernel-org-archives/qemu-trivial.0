Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7JDj-0001BW-Sb
	for mharc-qemu-trivial@gnu.org; Thu, 27 Feb 2020 08:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j7JDh-00018g-4M
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 08:28:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j7JDf-0005Ov-PH
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 08:28:53 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35226
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j7JDf-0005Oh-Lb
 for qemu-trivial@nongnu.org; Thu, 27 Feb 2020 08:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582810131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7cil+S2TI0XenfpWIIHgW3zIl7wCogwPVlPkS1oJPDY=;
 b=iyNjlY7EoBq/ma+A+6Qodz2rf7LPyd73dnecPArgJGyrtrN01uVa8OF/FCr1acHchdAdG3
 1Vue+XxbrjcuooTlfA1aS8YVFR5J5Djz5u2/VY5oTLVfjGgufkYz989uvvQIV1b6Pvx+5q
 oTq65sDWmisNd59lhT0+nejvzgvm5H0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-OeXvkmsIN8-ElR2NZaSytQ-1; Thu, 27 Feb 2020 08:28:44 -0500
X-MC-Unique: OeXvkmsIN8-ElR2NZaSytQ-1
Received: by mail-wr1-f72.google.com with SMTP id z1so1311056wrs.9
 for <qemu-trivial@nongnu.org>; Thu, 27 Feb 2020 05:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fD0MNpuWhab4G9SMLJRbIrZoxFLbb/kORsNGxaBYd4A=;
 b=ooF+e8/6Kt0SE3IszJk0KA5UuJadgmB9lImwQRPfQE6+Map8nXRaHMA55JG5rxwpjn
 taY7xHPdwU76Oixtjj3pbYBzrGP2FlPP8cDqLH4a9+1EN3Oa5P1QgGDgGSgNY+NLJoq1
 5jJsP1qAGENEeLBb7vYilFnnMETqcTXAKHrJU/HHVpPpe4wJTqtA1fHrWCuFJb4WRuol
 y3oHhRyOybU/yTbtsoJfcldA3VOR6CZWQ25WkmersuWZ/Lt/F3EMxRUcJ4NwjFHn0ybr
 DVQXDifVGdL+Q9E2qSDnToEsqghv+k0qrbcqMLOZ6wHyaoa+Nwwx/Vmk2OiV3wpOxTzX
 ZqtA==
X-Gm-Message-State: APjAAAWwhkb6TjqcW4Ya+e75UWdlgUjgTdQXAFIM+FEodntvz/WyeVsD
 F7QjLyUSdX0YJiR9zQ6r8Z2D9QB+9KAXaVLwF9mNabC5eImS1J5ndeaCEmgcEiOql6BkYQL6gzT
 dWbac/dNbrKOt+Aymyw==
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr5577726wmg.154.1582810123069; 
 Thu, 27 Feb 2020 05:28:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxX9vFksVNpjyfpvF+15trhX7hg8u9UM2U82hQyws3i3YOmakD1qZEDxeGYMrxyXo5pOq/jow==
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr5577674wmg.154.1582810122767; 
 Thu, 27 Feb 2020 05:28:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:30cb:d037:e500:2b47?
 ([2001:b07:6468:f312:30cb:d037:e500:2b47])
 by smtp.gmail.com with ESMTPSA id z1sm7450624wmf.42.2020.02.27.05.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 05:28:42 -0800 (PST)
Subject: Re: [PATCH 00/20] hw: Clean up hw/i386 headers (and few alpha/hppa)
To: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
 <dacba192-0a1e-9801-3e6f-02583bd8b994@redhat.com>
 <fe8ef9e8-d8d2-e92c-cde3-13a11fa1a5bf@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <18164a90-1ad2-28d1-f6e2-cc7741532f72@redhat.com>
Date: Thu, 27 Feb 2020 14:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fe8ef9e8-d8d2-e92c-cde3-13a11fa1a5bf@vivier.eu>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Thu, 27 Feb 2020 13:28:54 -0000

On 26/10/19 15:32, Laurent Vivier wrote:
> Le 26/10/2019 =C3=A0 14:20, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=
=A0:
>> Hi,
>>
>> On 10/14/19 4:22 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> This is a follow-up of Markus's cleanup series:
>>> Tame a few "touch this, recompile the world"
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg635748.html
>>>
>>> This part is mostly restricted to X86, but since some file from the
>>> Alpha/PA-RISC machines include "hw/i386/pc.h" I had to fix them
>>> too.
>>>
>>> Eventually I'll succeed at removing hw/i386/ dependency on non-X86
>>> platforms (Quest I started 2 years ago...).
>>>
>>> Regards,
>>>
>>> Phil.
>>>
>>> Philippe Mathieu-Daud=C3=A9 (20):
>>> =C2=A0=C2=A0 vl: Add missing "hw/boards.h" include
>>> =C2=A0=C2=A0 hw/southbridge/ich9: Removed unused headers
>>> =C2=A0=C2=A0 hw/input/pckbd: Remove unused "hw/i386/pc.h" header
>>> =C2=A0=C2=A0 hw/i386/ioapic_internal: Remove unused "hw/i386/ioapic.h" =
header
>>> =C2=A0=C2=A0 hw/timer: Remove unused "ui/console.h" header
>>> =C2=A0=C2=A0 hw/usb/dev-storage: Remove unused "ui/console.h" header
>>> =C2=A0=C2=A0 hw/i386/intel_iommu: Remove unused includes
>>> =C2=A0=C2=A0 hw/xen/xen_pt_load_rom: Remove unused includes
>>> =C2=A0=C2=A0 hw/alpha/alpha_sys: Remove unused "hw/ide.h" header
>>> =C2=A0=C2=A0 hw/alpha/dp264: Include "net/net.h"
>>> =C2=A0=C2=A0 hw/hppa/machine: Include "net/net.h"
>>> =C2=A0=C2=A0 hw/acpi/cpu_hotplug: Include "hw/pci/pci.h"
>>> =C2=A0=C2=A0 hw/timer/hpet: Include "exec/address-spaces.h"
>>> =C2=A0=C2=A0 hw/pci-host/q35: Include "qemu/range.h"
>>> =C2=A0=C2=A0 hw/i2c/smbus_ich9: Include "qemu/range.h"
>>> =C2=A0=C2=A0 hw/pci-host/piix: Include "qemu/range.h"
>>> =C2=A0=C2=A0 hw/acpi: Include "hw/mem/nvdimm.h"
>>> =C2=A0=C2=A0 hw/i386: Include "hw/mem/nvdimm.h"
>>> =C2=A0=C2=A0 hw/pci-host/q35: Remove unused includes
>>> =C2=A0=C2=A0 hw/i386/pc: Clean up includes
>> Laurent, since this series is fully reviewed, can it go via
>> your qemu-trivial tree?
>=20
> I'll try but I'm not sure to have the time to do that before the softfree=
ze.

Ping :)

Paolo


