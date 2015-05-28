Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxx5t-0005nE-Pk
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:39:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Yxx5p-0005ed-TI
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:39:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Yxx5l-0006O7-SV
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:39:25 -0400
Received: from mail-ig0-f170.google.com ([209.85.213.170]:34967)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Yxx5l-0006Nn-OK
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:39:21 -0400
Received: by igbyr2 with SMTP id yr2so110765727igb.0
	for <qemu-trivial@nongnu.org>; Thu, 28 May 2015 05:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WjDxrj4WsoLgWl7D7PFWJOFdOPL/JskmWEGyBvluy2g=;
	b=jwr9WuFLpyOQN32l4wP2FX/SeTl+CLuEw4S7IaS14jcC00WK9vu/XTYl32CPwRaKT7
	L2/9IAqiKM8Ux/1Ye2ZYo4/FHSNjfAKYHODTBJb5eR8QYZS7Aj+p/Xg9UWnQ9OYkgb4H
	4HxA+XKe9ubN8dQJmR7xzhXeuUrD8De/dpUx5d0Y49fCWR3pkNGPqiJW+X49fL2tLkRQ
	yhHhT3L9CyodErs8W9dZv8OHZPe4TEBLNUOpQqaHLbPiyuU9/ASmk6boJIJmg4qE1jCW
	INOsPfs20PA9SNBSZ0UR0Bdq22TKuQoIRZsk8/7rYgb6Naxe2GbSdb8Fxu3pYgQrr9k1
	dOgw==
X-Gm-Message-State: ALoCoQnETD6Qjm7EIUcDsF2YwEl9dTBynMpOTZ/oCoU+oL9h+NYPz5RjNwpOyuojx6t3v4b6t8DM
X-Received: by 10.50.79.196 with SMTP id l4mr44019798igx.48.1432816761219;
	Thu, 28 May 2015 05:39:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.181.6 with HTTP; Thu, 28 May 2015 05:39:00 -0700 (PDT)
In-Reply-To: <5567091A.5050901@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
	<1432814932-12608-2-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA_ya9V+kLVCrqU-wuG7cbJNf4ZX+xS9OsLgmzBveyXT1g@mail.gmail.com>
	<5567091A.5050901@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2015 13:39:00 +0100
Message-ID: <CAFEAcA8QXBPj3-mMWfTHUM+88q1QPzgOk49rZ1thVfvb+uiptA@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.170
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 01/29] hw/ide/ahci.c: Fix memory leak
	spotted by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 12:39:27 -0000

On 28 May 2015 at 13:24, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>
> On 2015/5/28 20:16, Peter Maydell wrote:
>> On 28 May 2015 at 13:08, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>>> > --- a/hw/ide/ahci.c
>>> > +++ b/hw/ide/ahci.c
>>> > @@ -1367,6 +1367,7 @@ void ahci_init(AHCIState *s, DeviceState *qdev, AddressSpace *as, int ports)
>>> >          ad->port.dma->ops = &ahci_dma_ops;
>>> >          ide_register_restart_cb(&ad->port);
>>> >      }
>>> > +    g_free(irqs);
>>> >  }
>> Freeing the return value of qemu_allocate_irqs()
>> directly rather than using qemu_free_irqs() looks
>> dubious to me.
>
> qemu_free_irqs() will free the return value self of qemu_allocate_irqs()
> and also will free all the contents of this array while some of them are
> still in use.

Yes, but you're still looking into the internal implementation
details of this API, which is what I'm suggesting is dubious.

For instance, in this case, why are we calling
qemu_allocate_irqs() in the first place, rather than
just calling qemu_allocate_irq() inside the for() loop in
ahci_init()?

If code wants to deal with the array of irqs as an array,
it should probably be saving the pointer somewhere in its
state struct and freeing the whole thing on deinit. If it
doesn't actually want an array of irqs (as here) it should
probably not be calling qemu_allocate_irqs() in the first
place.

thanks
-- PMM

