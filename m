Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0Wzo-00026L-N6
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 11:23:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0Wzn-000258-0J
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 11:23:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0Wzf-0007za-V0
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 11:23:50 -0400
Received: from mail-pd0-f170.google.com ([209.85.192.170]:33408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0Wzf-0007zL-P4
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 11:23:43 -0400
Received: by pdbqa5 with SMTP id qa5so33161682pdb.0
	for <qemu-trivial@nongnu.org>; Thu, 04 Jun 2015 08:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=gSeRmwwTEamZMKQZQT50KMdtDQ6wBNO8s8e3nhCkqVs=;
	b=KCTPOC6cgwT7SHciAjxLDa1Au9roSRuwuv/csEdC6mDYiAew59Arrx2cDjwS4iuksf
	Zlji59ajx8fO0EAHwGA3DhS0lluOwjG/0Y3pUI/RbjAwEeur4EQeWh7mes1vQkcVHpB4
	IBeodEN4S3pGY4XcU1pVUkEXuIEmDCBAgh6SOuZKNoXiTNeT8u/gxTxLswe+Vdmf6WQb
	3RbzZTfPx7GX8Ps4utB5TSry90lehICYIB/9Tn/JyNhcUxv4LPag4TDW9n+hqSIoXWZv
	bux9zBrmCNgORvpZq/w3zQDh6r4DkxTkXvkzDurNDp9thMWr4Dsn5G3SPVSF5R5pYQHy
	U5iA==
X-Gm-Message-State: ALoCoQmTGXLCBRwMFRBOhmXyCvEy8qXlKasVi7qNVY9Ij85B08KOFD+yIphyc+SdtERan/cGNjO8
X-Received: by 10.68.205.33 with SMTP id ld1mr32826174pbc.22.1433431423058;
	Thu, 04 Jun 2015 08:23:43 -0700 (PDT)
Received: from [10.14.6.62] ([167.160.116.183])
	by mx.google.com with ESMTPSA id ow6sm4103040pbc.59.2015.06.04.08.23.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 08:23:42 -0700 (PDT)
Message-ID: <55706D76.9000106@linaro.org>
Date: Thu, 04 Jun 2015 23:23:34 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Shannon Zhao <zhaoshenglong@huawei.com>,
	qemu-devel@nongnu.org
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
	<1432972477-13504-3-git-send-email-zhaoshenglong@huawei.com>
	<55705E46.4010106@msgid.tls.msk.ru> <55706108.9070903@linaro.org>
	<55706186.5070701@msgid.tls.msk.ru> <557065ED.7010409@linaro.org>
	<55706775.7090204@msgid.tls.msk.ru> <55706BF2.2040005@linaro.org>
In-Reply-To: <55706BF2.2040005@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.170
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2 2/7] hw/mips/mips_jazz.c: Store irq
 array in MachineState to fix memory leak
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
X-List-Received-Date: Thu, 04 Jun 2015 15:23:52 -0000



On 2015/6/4 23:17, Shannon Zhao wrote:
>
>
> On 2015/6/4 22:57, Michael Tokarev wrote:
>> 04.06.2015 17:51, Shannon Zhao wrote:
>>> >Yeah, but I think something like below would work.
>>> >
>>> >     cpu_exit_irq = &qemu_allocate_irq(cpu_request_exit, NULL, 0);
>>> >     DMA_init(0, cpu_exit_irq);
>> NO!!!:)
>
> Oh, will rethink about it. But I think maybe it's unnecessary to fix it
> as it actually requires a pointer which stores qemu_irq.

And if we want to use qemu_allocate_irq here, it will be something like:

cpu_exit_irq = g_new(qemu_irq, 1);
cpu_exit_irq[0] = qemu_allocate_irq(cpu_request_exit, NULL, 0);
DMA_init(0, cpu_exit_irq);

This is what exactly qemu_allocate_irqs does.

Or we modify the DMA_init to make it take qemu_irq as parameter not 
qemu_irq *

-- 
Shannon

