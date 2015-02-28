Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRdzH-0002p7-S9
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:47:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRdzC-0002ff-SD
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:47:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRdzC-0001FL-2L
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:47:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49464)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YRdz9-0001Ex-Uh; Sat, 28 Feb 2015 04:47:00 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1398643EE1;
	Sat, 28 Feb 2015 12:41:02 +0300 (MSK)
Message-ID: <54F18D2E.1060501@msgid.tls.msk.ru>
Date: Sat, 28 Feb 2015 12:41:02 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
	<1425023419-12244-6-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1425023419-12244-6-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 5/9] e500: fix memory leak
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
X-List-Received-Date: Sat, 28 Feb 2015 09:47:06 -0000

27.02.2015 10:50, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/ppc/e500.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 7e17d18..38203a6 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -542,6 +542,7 @@ done:
>  
>  out:
>      g_free(pci_map);
> +    g_free(filename);

This patch breaks compilation, because `filename' variable is
local to the "if (dtb_file)" code block at the beginning of this
function and shold be freed there.

Thanks,

/mjt

