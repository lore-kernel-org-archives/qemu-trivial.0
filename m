Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4PlR-0002UC-UB
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 07:10:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4PlL-0002Px-2X
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 07:10:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4PlJ-0007AO-TJ
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 07:10:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60128)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4PlA-00070U-Ne; Tue, 17 Oct 2017 07:10:08 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B7AB4DD58;
	Tue, 17 Oct 2017 11:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0B7AB4DD58
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5E656251B;
	Tue, 17 Oct 2017 11:09:55 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
	<hpoussin@reactos.org>, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-31-f4bug@amsat.org>
	<44b57d76-6d10-84c8-3a13-cdac7331c5d9@redhat.com>
	<47c7b41d-23ff-3dd1-9c07-69bd5df08685@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d1f23a08-364b-b9c3-fec1-495ce9ce9e47@redhat.com>
Date: Tue, 17 Oct 2017 13:09:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <47c7b41d-23ff-3dd1-9c07-69bd5df08685@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 17 Oct 2017 11:10:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 30/39] hw/display/vga: remove the old
 i386/pc dependency
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Oct 2017 11:10:24 -0000

On 17.10.2017 12:49, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Thomas,
>=20
>>> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
>>> index ad34a1f048..fe23b81442 100644
>>> --- a/hw/display/vga_int.h
>>> +++ b/hw/display/vga_int.h
>>> @@ -25,8 +25,9 @@
>>>  #ifndef HW_VGA_INT_H
>>>  #define HW_VGA_INT_H
>>> =20
>>> -#include "hw/hw.h"
>>> +#include "exec/ioport.h"
>>>  #include "exec/memory.h"
>>> +#include "ui/console.h"
>>
>> So vga_int.h now includes console.h (is it really necessary?) ...
>=20
> The VGACommonState struct has a GraphicHwOps *hw_ops member.

Ok, thanks, I just wanted to confirm that this is needed here.

[...]
> Do you suggest me do declare GraphicHwOps opaque in "qemu/typedefs.h"?

No, I think it's fine if you keep the #include in vga_int.h, I just
wanted to make sure that it is really needed there. So please just
remove the #includes from the .c files instead.

 Thomas

