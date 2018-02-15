Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1emChk-0005PC-QW
	for mharc-qemu-trivial@gnu.org; Thu, 15 Feb 2018 01:07:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1emChi-0005Ma-4S
	for qemu-trivial@nongnu.org; Thu, 15 Feb 2018 01:07:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1emChh-0007fv-Ar
	for qemu-trivial@nongnu.org; Thu, 15 Feb 2018 01:07:34 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46074 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1emChb-0007ca-Ai; Thu, 15 Feb 2018 01:07:27 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E281D8182D38;
	Thu, 15 Feb 2018 06:07:26 +0000 (UTC)
Received: from [10.36.116.121] (ovpn-116-121.ams2.redhat.com [10.36.116.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 480CBFF879;
	Thu, 15 Feb 2018 06:07:24 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Cc: Keith Busch <keith.busch@intel.com>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
	qemu-trivial@nongnu.org
References: <20180215042900.16078-1-f4bug@amsat.org>
	<20180215042900.16078-4-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f021eed7-5613-6608-aaa9-951733f80c3f@redhat.com>
Date: Thu, 15 Feb 2018 07:07:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180215042900.16078-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 15 Feb 2018 06:07:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 15 Feb 2018 06:07:26 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/30] hw/block/nvme:
 include the "qemu/cutils.h" in the source file
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
X-List-Received-Date: Thu, 15 Feb 2018 06:07:35 -0000

On 15.02.2018 05:28, Philippe Mathieu-Daud=C3=A9 wrote:
> where it is used.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/block/nvme.h | 1 -
>  hw/block/nvme.c | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 8f3981121d..cabcf20c32 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -1,6 +1,5 @@
>  #ifndef HW_NVME_H
>  #define HW_NVME_H
> -#include "qemu/cutils.h"
>  #include "block/nvme.h"
> =20
>  typedef struct NvmeAsyncEvent {
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 85d2406400..811084b6a7 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -35,6 +35,7 @@
>  #include "sysemu/block-backend.h"
> =20
>  #include "qemu/log.h"
> +#include "qemu/cutils.h"
>  #include "trace.h"
>  #include "nvme.h"

Reviewed-by: Thomas Huth <thuth@redhat.com>

