Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNIF8-0007sf-RP
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 04:45:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YNIF6-0007rE-A2
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 04:45:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YNIF4-0007sy-PJ
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 04:45:27 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YNIF0-0007qH-9L; Mon, 16 Feb 2015 04:45:22 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9655D425BF;
	Mon, 16 Feb 2015 12:45:21 +0300 (MSK)
Message-ID: <54E1BC31.4000301@msgid.tls.msk.ru>
Date: Mon, 16 Feb 2015 12:45:21 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
	<1423627934-11676-4-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1423627934-11676-4-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 03/11] pl330.c: remove superfluous '\n'
	around error_setg
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Feb 2015 09:45:29 -0000

11.02.2015 07:12, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/dma/pl330.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
> index 16cf77e..0f72b59 100644
> --- a/hw/dma/pl330.c
> +++ b/hw/dma/pl330.c
> @@ -1566,7 +1566,7 @@ static void pl330_realize(DeviceState *dev, Error **errp)
>          s->cfg[1] |= 5;
>          break;
>      default:
> -        error_setg(errp, "Bad value for i-cache_len property: %" PRIx8 "\n",
> +        error_setg(errp, "Bad value for i-cache_len property: %" PRIx8 "",

Not hugely important but there's no need in the trailing "" here and below.

Thanks,

/mjt

