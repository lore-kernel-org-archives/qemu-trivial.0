Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yzfaf-0006dp-Lb
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 02:22:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yzfad-0006b4-NX
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 02:22:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yzfab-0002BV-C9
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 02:22:19 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:13780)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YzfaW-00029a-51; Tue, 02 Jun 2015 02:22:13 -0400
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMG06612; Tue, 02 Jun 2015 14:22:09 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1; Tue, 2 Jun 2015
	14:20:25 +0800
Message-ID: <556D4B25.1020003@huawei.com>
Date: Tue, 2 Jun 2015 14:20:21 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1432994083-5677-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1432994083-5677-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/2] hw/display/tcx.c: tcx_realizefn: fix
 memory leak, make FCode loading error fatal and improve error message
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
X-List-Received-Date: Tue, 02 Jun 2015 06:22:20 -0000



On 2015/5/30 21:54, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  hw/display/tcx.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index a9f9f66..c2b32c3 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -1014,10 +1014,13 @@ static void tcx_realizefn(DeviceState *dev, Error **errp)
>      if (fcode_filename) {
>          ret = load_image_targphys(fcode_filename, s->prom_addr,
>                                    FCODE_MAX_ROM_SIZE);
> -        if (ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
> -            error_report("tcx: could not load prom '%s'", TCX_ROM_FILE);
> -        }
>      }
> +    if (!fcode_filename || ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
> +        error_report("tcx: could not load prom '%s'",
> +                     fcode_filename ? fcode_filename : TCX_ROM_FILE);
> +        exit(1);
> +    }
> +    g_free(fcode_filename);
>  
>      /* 0/DFB8 : 8-bit plane */
>      s->vram = vram_base;
> 

-- 
Shannon


