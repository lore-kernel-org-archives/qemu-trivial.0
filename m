Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1afBPi-00008N-De
	for mharc-qemu-trivial@gnu.org; Sun, 13 Mar 2016 15:10:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1afBPf-00005L-I6
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 15:10:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1afBPe-0005IB-Iw
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 15:10:51 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1afBPd-0005Hl-C3
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 15:10:50 -0400
Received: by mail-vk0-x22c.google.com with SMTP id e6so186388940vkh.2
	for <qemu-trivial@nongnu.org>; Sun, 13 Mar 2016 12:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DmsQUnww3Qt6DUDEQiBW5+mgN+2CJdWHkmU5KD2+7TA=;
	b=b6Oh/ylaSrtRfrDhsoP0ap2ejRNFoxrEsh9IUD7XBkfEwh0mpb0oH2iKIPe8qvp90I
	dpj6qbjwZEDuVcYx8J3u9cxjSUSZXDsplpDB58miVeGe8GmP8Pq3dHa3Pgq2l7/nDDAm
	PFk+wDfNdyxplQ0MIubi9WpXahOOzvUSqqSSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DmsQUnww3Qt6DUDEQiBW5+mgN+2CJdWHkmU5KD2+7TA=;
	b=fhmwCklxidsZ51U/8Wm+tOul+XsOmOxoXmw94naHXH9BssTEtEX0XXeWn5I5uJx6cX
	NwWUdnYwibQq3PGaZuEV6uyGSMG0TJjbVs90HE+Iq842VeOhS7tW1YoASHwwkacebL4M
	qoRcfZeQHtLvV31xr+6niXVRhG/87eUXEZdQiGcqiJ+c38BlgkgjTh0tJk0m7bHTxdY7
	ilsOnLfMq9iP2JrR2KAvrv5bsRx9PVWfuWx0lYiULKV4ZIIG3MexeXdDxS1x8QXcs0ny
	cKG4PKNhwjgkRgoxt7QrzcoRZhN58xkEOZKIFcCXu9/EiiLxQ9+btcgRViFwc1PW4gWi
	oz+g==
X-Gm-Message-State: AD7BkJJJezskMfvMf7d28bSi3NHYufp36RbnlI2naFW3tSnmPyufvStz99yZx0Xy7u/k2v1l5+xyoe67dHjXn/Ig
X-Received: by 10.31.7.138 with SMTP id 132mr21213084vkh.92.1457896248990;
	Sun, 13 Mar 2016 12:10:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Sun, 13 Mar 2016 12:10:29 -0700 (PDT)
In-Reply-To: <1457895376-22138-1-git-send-email-mbtamuli@gmail.com>
References: <1457895376-22138-1-git-send-email-mbtamuli@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Mar 2016 19:10:29 +0000
Message-ID: <CAFEAcA_9H0txC8nPb2TuOWFK9Dxm4w26ZMmjpuuH9ZUTd=WHDQ@mail.gmail.com>
To: Mriyam Tamuli <mbtamuli@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] address_space: replaced
	function calls
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
X-List-Received-Date: Sun, 13 Mar 2016 19:10:52 -0000

On 13 March 2016 at 18:56, Mriyam Tamuli <mbtamuli@gmail.com> wrote:
> replaced calls named cpu_physical_memory_* with address_space_*
>
> cpus.c
> cputlb.c
> disas.c
> exec.c
> ---
>  cpus.c   |  2 +-
>  cputlb.c |  8 ++++----
>  disas.c  |  2 +-
>  exec.c   | 60 ++++++++++++++++++++++++++++++------------------------------
>  4 files changed, 36 insertions(+), 36 deletions(-)
>
> diff --git a/cpus.c b/cpus.c
> index bc774e2..d73cd7b 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -1662,7 +1662,7 @@ void qmp_pmemsave(int64_t addr, int64_t size, const char *filename,
>          l = sizeof(buf);
>          if (l > size)
>              l = size;
> -        cpu_physical_memory_read(addr, buf, l);
> +        address_space_read(addr, buf, l);

address_space_read() takes five arguments, not three -- surely
this change won't compile?

> --- a/exec.c
> +++ b/exec.c
> @@ -991,9 +991,9 @@ static void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length)
>  }
>
>  /* Note: start and end must be within the same ram block.  */
> -bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
> -                                              ram_addr_t length,
> -                                              unsigned client)
> +bool address_space_test_and_clear_dirty(ram_addr_t start,
> +                                        ram_addr_t length,
> +                                        unsigned client)

This doesn't look right either -- a function address_space_*
should take an AddressSpace* as argument.

The idea of the item on the BiteSizedTasks list is to
convert code (and in particular device model code) which uses
cpu_physical_memory_read() or cpu_physical_memory_write() from
using those functions (which implicitly act on the CPU's
default address space) to instead use functions which specify
their address space explicitly. This might involve changing
the devices to allow board code to pass the device a memory
region that it should use for DMA type accesses. In any case
it is not as simple as a pure search and replace operation.

thanks
-- PMM

