Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0Wlp-00020k-Ms
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 11:09:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0Wln-0001zp-6I
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 11:09:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0Wlk-0001yR-Gp
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 11:09:23 -0400
Received: from mail-pa0-f43.google.com ([209.85.220.43]:33456)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0Wlk-0001yG-BC
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 11:09:20 -0400
Received: by padj3 with SMTP id j3so31431409pad.0
	for <qemu-trivial@nongnu.org>; Thu, 04 Jun 2015 08:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=SAMOja3kfQyg+1PX1uT7MoPapnjr3ARZA2ldE8+JNqY=;
	b=k/HQp9EjvqJbiDvwED4Bk/lgRai2VSx8yAIjkF13orn8UXYjtVFsvozfLmsd22buCR
	E/Z+TJzvtkR6TdhJii5sauTri43iyqodvA2JlIYD8BH0+bL4kHgEuS9fZjglj/mbIlvV
	FjuKsA6m4Axay3wuz5YY5F7dkWCTrZtPUOkWyeDx45cKTGfJrdZGknKP0MSg4VD/tzxs
	gwJEcIqwcMsXuSXHKwi3ePMTnAxURlG5U2yiyvZPYNW7C+ZLDQQkKbD9bc5HFkR/2b0A
	morOtZ8ktV+xWXefnOaTB1fR0tSz81UwX8QMG4oG6v1yYw5E1J5RmsmL6APHe8QO6iYg
	lEgg==
X-Gm-Message-State: ALoCoQk8hNk8ZDIW34DZjuaBOKg8X+RIpNtHj03kY4XrNM17dvRTKIoYSG9rUhHZqeEFIjh9ZrUU
X-Received: by 10.68.65.17 with SMTP id t17mr32520568pbs.9.1433430559695;
	Thu, 04 Jun 2015 08:09:19 -0700 (PDT)
Received: from [10.14.6.62] ([167.160.116.183])
	by mx.google.com with ESMTPSA id pu1sm4157479pdb.33.2015.06.04.08.09.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 08:09:18 -0700 (PDT)
Message-ID: <55706A17.80601@linaro.org>
Date: Thu, 04 Jun 2015 23:09:11 +0800
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
	<55706775.7090204@msgid.tls.msk.ru>
In-Reply-To: <55706775.7090204@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.43
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
X-List-Received-Date: Thu, 04 Jun 2015 15:09:24 -0000



On 2015/6/4 22:57, Michael Tokarev wrote:
> 04.06.2015 17:51, Shannon Zhao wrote:
>> >Yeah, but I think something like below would work.
>> >
>> >     cpu_exit_irq = &qemu_allocate_irq(cpu_request_exit, NULL, 0);
>> >     DMA_init(0, cpu_exit_irq);
> NO!!!:)

Hmm...really?

This is used by DMA_schedule.

void DMA_schedule(int nchan)
{
     struct dma_cont *d = &dma_controllers[nchan > 3];

     qemu_irq_pulse(*d->cpu_request_exit);
}

-- 
Shannon

