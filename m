Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ukmaf-00033w-Oj
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2013 22:39:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Ukmab-0002vr-9N
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2013 22:39:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Ukmaa-0005tO-Cr
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2013 22:39:41 -0400
Received: from mail-bk0-x22a.google.com ([2a00:1450:4008:c01::22a]:37616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Ukmaa-0005tG-7O
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2013 22:39:40 -0400
Received: by mail-bk0-f42.google.com with SMTP id jk13so2005793bkc.1
	for <qemu-trivial@nongnu.org>; Thu, 06 Jun 2013 19:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=HaybcsDK+dG/LpUXhdfI9dU4wu2q8cP61Jn3OeTfyuE=;
	b=S8sxz8loLdRcumkR3jLM/BMhJtJttjD6ieQvvMzWmp/GOjohqNEBp68jhYdiWtbnSA
	TvOSy5hpntvYdHXY3haBXkdrij9tA5b/NijrUfhlksE50x+Ik6/p8KA4w0RUu7hv34k8
	EMI7ObMeVdJIWymnuyFEFKRg+DQ7ZButTFeG5z2DYAJKl7pJuUy+ASV6S9TSvsGMLEdq
	T/rCvYqylPcB5i2PqKV75w92RpA1IuqQeREAc9KCvwytI73y32iZxGogfHrmuaPrHpZs
	6+Z31Zbll3vg0xmnOaJKOx8Jhstz55snGtaTPpqoKxhz/fUWQJJiwSAfJjndAH0K0VG+
	miXg==
MIME-Version: 1.0
X-Received: by 10.204.191.132 with SMTP id dm4mr765853bkb.66.1370572779266;
	Thu, 06 Jun 2013 19:39:39 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Thu, 6 Jun 2013 19:39:39 -0700 (PDT)
In-Reply-To: <1ec46fbd250efe78699a1e4cf6838c0c88f4acc7.1370572420.git.peter.crosthwaite@xilinx.com>
References: <cover.1370572420.git.peter.crosthwaite@xilinx.com>
	<1ec46fbd250efe78699a1e4cf6838c0c88f4acc7.1370572420.git.peter.crosthwaite@xilinx.com>
Date: Fri, 7 Jun 2013 12:39:39 +1000
X-Google-Sender-Auth: FyeFEHkcI5wvLKJXxydi0o69P-g
Message-ID: <CAEgOgz7vk_8z+KzFMfj0iWjLPeykkLUP4ePu8AECLSHn1t3KcQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQn9+rgn9/q9hR9wyYBtjCIMEnxm3bAaWZNBZCdy1IBi8e5oKoPdo7GwRvzr7bZ9wQjSkJ6p
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::22a
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com
Subject: Re: [Qemu-trivial] [PATCH v1 1/5] intc/xilinx_intc: Use qemu_set_irq
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
X-List-Received-Date: Fri, 07 Jun 2013 02:39:43 -0000

email accidentally sent with cc supression, so cc qemu-trivial as intended.

On Fri, Jun 7, 2013 at 12:38 PM,  <peter.crosthwaite@xilinx.com> wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>
> Use qemu_set_irq rather than if-elsing qemu_irq_(lower|raise). No
> functional change, just reduces verbosity.
>
> Cc: qemu-trivial@nongnu.org
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>
>  hw/intc/xilinx_intc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
> index b106e72..5df7008 100644
> --- a/hw/intc/xilinx_intc.c
> +++ b/hw/intc/xilinx_intc.c
> @@ -66,11 +66,7 @@ static void update_irq(struct xlx_pic *p)
>          i = ~0;
>
>      p->regs[R_IVR] = i;
> -    if ((p->regs[R_MER] & 1) && p->regs[R_IPR]) {
> -        qemu_irq_raise(p->parent_irq);
> -    } else {
> -        qemu_irq_lower(p->parent_irq);
> -    }
> +    qemu_set_irq(p->parent_irq, (p->regs[R_MER] & 1) && p->regs[R_IPR]);
>  }
>
>  static uint64_t
> --
> 1.8.3.rc1.44.gb387c77.dirty
>

