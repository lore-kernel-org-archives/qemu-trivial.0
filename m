Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dazFG-00020I-A3
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 02:59:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dazFD-0001xw-No
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 02:59:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dazFC-0006sg-UP
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 02:59:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dazF9-0006lB-3h; Fri, 28 Jul 2017 02:59:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF27E1A8056;
	Fri, 28 Jul 2017 06:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EF27E1A8056
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90C6C5D969;
	Fri, 28 Jul 2017 06:59:22 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-5-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a692e098-3491-1e4c-e5af-68bc2bf4e81c@redhat.com>
Date: Fri, 28 Jul 2017 08:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170728053610.15770-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 28 Jul 2017 06:59:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/47] MAINTAINERS: add
 missing USB entry
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
X-List-Received-Date: Fri, 28 Jul 2017 06:59:32 -0000

On 28.07.2017 07:35, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f10252c292..3b472d7a09 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1008,6 +1008,7 @@ F: docs/usb2.txt
>  F: docs/usb-storage.txt
>  F: include/hw/usb.h
>  F: include/hw/usb/
> +F: default-configs/usb.mak
> =20
>  USB (serial adapter)
>  M: Gerd Hoffmann <kraxel@redhat.com>
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>

