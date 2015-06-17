Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z53qa-0005Ta-K9
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jun 2015 23:17:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z53qX-0005OC-EQ
	for qemu-trivial@nongnu.org; Tue, 16 Jun 2015 23:17:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z53qT-0005Hj-Dr
	for qemu-trivial@nongnu.org; Tue, 16 Jun 2015 23:17:01 -0400
Received: from mail-yh0-f42.google.com ([209.85.213.42]:35243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z53qT-0005HZ-AK
	for qemu-trivial@nongnu.org; Tue, 16 Jun 2015 23:16:57 -0400
Received: by yhak3 with SMTP id k3so25114466yha.2
	for <qemu-trivial@nongnu.org>; Tue, 16 Jun 2015 20:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=gn6WcMax9+QjBmbwtGDGe3f66wjMPmV+zZA5WRt3h64=;
	b=DHhKA2OwmZ/UgEqCNTXv1KAqEJDZEfTlGAn+fr3OynbknEs419E+aO+NQJuKtTxAXN
	7W/+D3RagoAtbuD3qKDmyWqPibogX0n4H6FbIPBpJ52Ifs9m5wpZrCP3j9ENb6iUwDIo
	deurgrZcogY84GhaPxNbtsiTovEy9V9Kj71X3OC6hrU/PhnSONpbfn4ofKajejMWniWo
	p/cs4l3i6OE3/7/jzsL9ILqmJARd2lRoE0IAIIJAWAD3nAXDxQu4WtbecBhsVjbnrdU+
	h9K/s4kt+clWY8kBhkx7WsUSWC+CHFcTzeiUSRba+ofwRJSREAkWI/wBL7sz4LpbVdci
	7swA==
X-Gm-Message-State: ALoCoQn42miwG2TiSE0Jb5JJgZNElixfQhoWR6gKCF7xWsG+orempjgO7+Iza6mRWO/Ye8FU9CqI
MIME-Version: 1.0
X-Received: by 10.13.204.142 with SMTP id o136mr2766556ywd.171.1434511016852; 
	Tue, 16 Jun 2015 20:16:56 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.37.38.9 with HTTP; Tue, 16 Jun 2015 20:16:56 -0700 (PDT)
In-Reply-To: <1434510002-6976-2-git-send-email-zhaoshenglong@huawei.com>
References: <1434510002-6976-1-git-send-email-zhaoshenglong@huawei.com>
	<1434510002-6976-2-git-send-email-zhaoshenglong@huawei.com>
Date: Tue, 16 Jun 2015 20:16:56 -0700
X-Google-Sender-Auth: TJx4vRsvHYdA8vD10QeFA5FSURs
Message-ID: <CAEgOgz7K6k=ZVCfaMVKr1PtBKLW4WidU59wk61YOsDiykGyi8w@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.42
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/8] include/hw/boards.h:
 Add a member in MachineState to store irq array
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
X-List-Received-Date: Wed, 17 Jun 2015 03:17:03 -0000

On Tue, Jun 16, 2015 at 7:59 PM, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> Here we add a member in MachineState to store the irq array returned
> from qemu_allocate_irqs. Then these irq arrays will be free before QEMU
> exit and it will be used to fix the memory leak due to misuse
> qemu_allocate_irqs.
>

This is based on an assumption that IRQ are a global concept. This (as
well as the one global address space) is something we really should
get away from. A better appoach would be to child the IRQs to the
Machine object (note that IRQs are QOM objects) for those machines
where this assumption makes sense. Then we don't have to pollute
common structs.

Regards,
Peter

> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  include/hw/boards.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 6379901..0dea769 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -148,6 +148,7 @@ struct MachineState {
>      char *initrd_filename;
>      const char *cpu_model;
>      AccelState *accelerator;
> +    qemu_irq *irqs;
>  };
>
>  #endif
> --
> 2.0.4
>
>
>

