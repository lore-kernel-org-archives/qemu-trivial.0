Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yzf9L-0000OR-Se
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 01:54:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yzf9J-0000Kj-Kt
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 01:54:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yzf9H-0007MF-4y
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 01:54:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35445)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yzf9C-0007KH-P3; Tue, 02 Jun 2015 01:53:58 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 22C2240423;
	Tue,  2 Jun 2015 08:53:52 +0300 (MSK)
Message-ID: <556D44EF.1030704@msgid.tls.msk.ru>
Date: Tue, 02 Jun 2015 08:53:51 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1432993766-5528-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1432993766-5528-1-git-send-email-mjt@msgid.tls.msk.ru>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
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
X-List-Received-Date: Tue, 02 Jun 2015 05:54:06 -0000

Shannon Zhao: can you please add your s-o-b or r-o-b for this
version, for this and the next patch?

This started from your original patch which just adds g_free(),
later you also added error message improvements to this piece,
on my request, but apparently this place needs more tweeking,
since failing to load firmware is fatal to the code, so instead
of requesting you to change it further I created my version,
identical for two files.

Thanks,

/mjt

30.05.2015 16:49, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


