Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0WAP-0005XE-Dl
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 10:30:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0WAN-0005Te-7N
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:30:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0WAH-0003xj-Oi
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:30:43 -0400
Received: from mail-pd0-f169.google.com ([209.85.192.169]:35697)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z0WAH-0003xM-K5
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:30:37 -0400
Received: by pdbnf5 with SMTP id nf5so32204501pdb.2
	for <qemu-trivial@nongnu.org>; Thu, 04 Jun 2015 07:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=K0Dro0cPzcmpghWcchX2Gr4RYmVddHaKhbrlC5XWkc4=;
	b=beAvEyPPi5bZQrYQinH/TzXwbk3kKhdRzjv9L7zw6JNw7LbB7cKm1lVNKK4llvrP7z
	s2pXyVqCrFIz7s1VsOs5w5f4DL8gkZB21o4KdF60JMirOxnpOKbRmwnJuPCdApIkUF70
	xStjoCMcIR2mMIPzEPtWtgB/m4rrxwKNns2yoIAgYcROzLzNsEGWurc9URUd4UfJf5Al
	egP9ZhCJ/TgtLbDeD0wvnERonyKbbB5bihasyy+ItAX/+4g9uKkBg9GlwB29kdIwtbdS
	WXGdXGLdnZo+PZ5YW+fnOre3aDtaYKbFdI+tF8MzQpxWX+x8DUpHP/66o2z3ASUQqAKN
	iUXg==
X-Gm-Message-State: ALoCoQmtXkbQ3XOdI3TCQygSW3cbTRFJfXGIY6MFFe3zxg18KBHFdYSvwDt1Wi3kM82UPr7UbQKm
X-Received: by 10.68.68.230 with SMTP id z6mr31447219pbt.102.1433428236664;
	Thu, 04 Jun 2015 07:30:36 -0700 (PDT)
Received: from [10.14.6.62] ([167.160.116.183])
	by mx.google.com with ESMTPSA id le17sm4137702pab.2.2015.06.04.07.30.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 07:30:35 -0700 (PDT)
Message-ID: <55706108.9070903@linaro.org>
Date: Thu, 04 Jun 2015 22:30:32 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Shannon Zhao <zhaoshenglong@huawei.com>,
	qemu-devel@nongnu.org
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
	<1432972477-13504-3-git-send-email-zhaoshenglong@huawei.com>
	<55705E46.4010106@msgid.tls.msk.ru>
In-Reply-To: <55705E46.4010106@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.169
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
X-List-Received-Date: Thu, 04 Jun 2015 14:30:44 -0000



On 2015/6/4 22:18, Michael Tokarev wrote:
> 30.05.2015 10:54, Shannon Zhao пишет:
>> >From: Shannon Zhao<shannon.zhao@linaro.org>
>> >
>> >Signed-off-by: Shannon Zhao<zhaoshenglong@huawei.com>
>> >Signed-off-by: Shannon Zhao<shannon.zhao@linaro.org>
>> >---
>> >  hw/mips/mips_jazz.c | 28 ++++++++++++++--------------
>> >  1 file changed, 14 insertions(+), 14 deletions(-)
>> >
>> >diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
>> >index 2c153e0..259458b 100644
>> >--- a/hw/mips/mips_jazz.c
>> >+++ b/hw/mips/mips_jazz.c
>> >@@ -135,7 +135,7 @@ static void mips_jazz_init(MachineState *machine,
>> >      MIPSCPU *cpu;
>> >      CPUClass *cc;
>> >      CPUMIPSState *env;
>> >-    qemu_irq *rc4030, *i8259;
>> >+    qemu_irq *i8259;
> Hm. Why do you only cover rc4030, not i8259?
>

As i8259 is stored in ISABus->irqs by function isa_bus_irqs.

void isa_bus_irqs(ISABus *bus, qemu_irq *irqs)
{
     if (!bus) {
         hw_error("Can't set isa irqs with no isa bus present.");
     }
     bus->irqs = irqs;
}

> Besides, in order to keep the changes smaller, I think it is okay to
> keep the variables like that, here and in the rest of the function,
> and only add assignment of it to machine->irqs.  This way, we also
> keep semantic names of the variables, rc4030[i] is easier to understand
> than machine->irqs[i], the former's more specific.
>
Agree.

> BTW, there's also cpu_exit_irq in this function whose allocation also
> suffers from qemu_allocate_irqs(..., 1) API abuse.

Yeah, missed this one.

-- 
Shannon

