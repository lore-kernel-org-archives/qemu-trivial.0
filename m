Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzfZP-0005No-60
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 02:21:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YzfZM-0005Kl-SB
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 02:21:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YzfZL-0001aT-Ok
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 02:21:00 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:11789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YzfZF-0001Xq-9z; Tue, 02 Jun 2015 02:20:55 -0400
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMG06405; Tue, 02 Jun 2015 14:20:46 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1; Tue, 2 Jun 2015
	14:20:07 +0800
Message-ID: <556D4B13.5020707@huawei.com>
Date: Tue, 2 Jun 2015 14:20:03 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1432993766-5528-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1432993766-5528-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/2] hw/display/cg3.c: cg3_realizefn: fix
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
X-List-Received-Date: Tue, 02 Jun 2015 06:21:02 -0000



On 2015/5/30 21:49, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  hw/display/cg3.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/display/cg3.c b/hw/display/cg3.c
> index 1e6ff2b..5f869a7 100644
> --- a/hw/display/cg3.c
> +++ b/hw/display/cg3.c
> @@ -302,10 +302,12 @@ static void cg3_realizefn(DeviceState *dev, Error **errp)
>      if (fcode_filename) {
>          ret = load_image_targphys(fcode_filename, s->prom_addr,
>                                    FCODE_MAX_ROM_SIZE);
> -        if (ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
> -            error_report("cg3: could not load prom '%s'", CG3_ROM_FILE);
> -        }
>      }
> +    if (!fcode_filename || ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
> +        error_report("cg3: could not load prom '%s'",
> +                     fcode_filename ? fcode_filename : CG3_ROM_FILE);
> +    }
> +    g_free(fcode_filename);
>  
>      memory_region_init_ram(&s->vram_mem, NULL, "cg3.vram", s->vram_size,
>                             &error_abort);
> 

-- 
Shannon


