Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnVVM-0002NT-LW
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 13:10:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YnVVJ-0002N3-NZ
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 13:10:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YnVVF-0004hF-6I
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 13:10:33 -0400
Received: from mail-qc0-f174.google.com ([209.85.216.174]:34913)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YnVVF-0004gw-35
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 13:10:29 -0400
Received: by qcbii10 with SMTP id ii10so16346733qcb.2
	for <qemu-trivial@nongnu.org>; Wed, 29 Apr 2015 10:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=LS7YGufWglcES9NnpPj5I6iAy3+92DuQ5kaqu6Ml0xQ=;
	b=m0ORj/5wr60I3f+QnJlO7QyaR2wwdyituvKf71oFgfKYulV/q8AkcdhpOn4fwIrKsa
	BWO8K800LKpMKzHMYEwkmKH0sqny5JI4gdisYQk7Mpmz9qrICoNTb4P5ucDxIg0fUp1e
	ccqjaFjl+tFm2mO03pPnBsAIluZvvct+XKSu9GHsrxsTO/u3gNSPF7aVBlkqKvO+jZrA
	ah9Ce9dlSM1KIQeknnXnWlIWlIBS7meiylG6DlMxrlYgbua7Jss1iJYapFkKqI9gzBdH
	4RupLELs2HQPOuh104cvoFTdHSYUKjcgZFd2J3TUePef4/k4uNg5nctxg3G41p4+/ZLz
	gIFw==
X-Gm-Message-State: ALoCoQlbNZc7eqTBsC7GyCbVQ7lyLq//G+JWzNvtZrndJ4TuKjTzA3Vfv6/ltZroC/kagfayJrrV
MIME-Version: 1.0
X-Received: by 10.140.216.5 with SMTP id m5mr127404qhb.52.1430327428556; Wed,
	29 Apr 2015 10:10:28 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.96.97.41 with HTTP; Wed, 29 Apr 2015 10:10:28 -0700 (PDT)
In-Reply-To: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>
References: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>
Date: Wed, 29 Apr 2015 10:10:28 -0700
X-Google-Sender-Auth: 3MCVbLJSngKX-FXmIZj-TfNvmPw
Message-ID: <CAEgOgz79=9euMBdvWvEpqCPju85VGPXX8Bjp22P4iUBSP1_=cA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: gonglei <arei.gonglei@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.174
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] microblaze: fix memory
	leak
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
X-List-Received-Date: Wed, 29 Apr 2015 17:10:34 -0000

On Wed, Mar 4, 2015 at 7:05 PM,  <arei.gonglei@huawei.com> wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>
> When not assign a -dtb argument, the variable dtb_filename
> storage returned from qemu_find_file(), which should be freed
> after use. Alternatively we define a local variable filename,
> with 'char *' type, free after use.
>
> Cc: Michael Tokarev <mjt@tls.msk.ru>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> ---
> v2: fix a complier error.
> ---
>  hw/microblaze/boot.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index a2843cd..352ccb1 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -113,15 +113,15 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>      const char *kernel_filename;
>      const char *kernel_cmdline;
>      const char *dtb_arg;
> +    char *filename = NULL;
>
>      machine_opts = qemu_get_machine_opts();
>      kernel_filename = qemu_opt_get(machine_opts, "kernel");
>      kernel_cmdline = qemu_opt_get(machine_opts, "append");
>      dtb_arg = qemu_opt_get(machine_opts, "dtb");
> -    if (dtb_arg) { /* Preference a -dtb argument */
> -        dtb_filename = dtb_arg;
> -    } else { /* default to pcbios dtb as passed by machine_init */
> -        dtb_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
> +    /* default to pcbios dtb as passed by machine_init */
> +    if (!dtb_arg) {
> +        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
>      }
>
>      boot_info.machine_cpu_reset = machine_cpu_reset;
> @@ -203,7 +203,8 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>                              boot_info.initrd_start,
>                              boot_info.initrd_end,
>                              kernel_cmdline,
> -                            dtb_filename);
> +                            /* Preference a -dtb argument */
> +                            dtb_arg ? dtb_arg : filename);
>      }
> -
> +    g_free(filename);
>  }
> --
> 1.7.12.4
>
>
>

