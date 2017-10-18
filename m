Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4nFg-0006W1-4P
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 08:15:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4nFb-0006T5-6Z
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:15:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4nFV-00033x-Jt
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:15:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4nFR-00032B-BG; Wed, 18 Oct 2017 08:14:57 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C229883AB;
	Wed, 18 Oct 2017 12:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3C229883AB
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A90006973D;
	Wed, 18 Oct 2017 12:14:48 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
	<hpoussin@reactos.org>, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017164426.25277-1-f4bug@amsat.org>
	<20171017164426.25277-37-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <30402756-92d4-ee2a-056e-fa976991035f@redhat.com>
Date: Wed, 18 Oct 2017 14:14:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017164426.25277-37-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 18 Oct 2017 12:14:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3 36/42] hw/display/vga: "vga_int.h"
 requires "ui/console.h"
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
X-List-Received-Date: Wed, 18 Oct 2017 12:15:10 -0000

On 17.10.2017 18:44, Philippe Mathieu-Daud=C3=A9 wrote:
> since The VGACommonState struct has a GraphicHwOps *hw_ops member,
> then remove the now unnecessary includes.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/display/qxl.h        | 1 -
>  hw/display/vga_int.h    | 3 ++-
>  hw/display/cirrus_vga.c | 1 -
>  hw/display/vga-isa-mm.c | 1 -
>  hw/display/vga-isa.c    | 1 -
>  hw/display/vga-pci.c    | 1 -
>  hw/display/vga.c        | 1 -
>  hw/display/virtio-vga.c | 1 -
>  hw/display/vmware_vga.c | 1 -
>  9 files changed, 2 insertions(+), 9 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

