Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yyec4-00040x-EY
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 07:07:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Yyec1-0003tX-7n
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 07:07:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Yyebv-0005Fb-6O
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 07:07:33 -0400
Received: from mail-pd0-f174.google.com ([209.85.192.174]:33745)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Yyebv-0005F6-1Q
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 07:07:27 -0400
Received: by pdbqa5 with SMTP id qa5so71936130pdb.0
	for <qemu-trivial@nongnu.org>; Sat, 30 May 2015 04:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=67awTeRkaQF1NPZQn4Kcema07EaUgRR9FwmJFhaH9Uo=;
	b=EWwSHcGc4dG9rcPUX0qDI3zM+l7mfTC1brRroKiGbC8JTLyAey8zFu3uhqqRPaaCGk
	n2cPZNTIk5qUagC9WEY8y9qo5h/x5hbF6IonOXL5vemthgSsl73xhHpdjXCy42dgc62P
	5yv2/IHs65+mgTlATWSO/1XqdUbjck05LF0SoY2kG4zr1CO5t+Ft2EYoWyGMfEIU2XAJ
	B+DihM4nU1QyIKo81hyR6wa8RvwM2oFi0goLcLB/1OYGPOsyPyzu1a1VjqqEA8YQtcYB
	5rsyS3SjOgSiIkGk+SKi2pkEtxbxSQZvJiqP+F8v72jBQSs76RCcHryxGaYfHNvgKuVx
	GmVQ==
X-Gm-Message-State: ALoCoQkMraDVsaVpfbL4exHOp74Qvtenf5ABc+7ZziVpg4WEvXjj/qrn7nfj8HLfZyWMVm9X2UIq
X-Received: by 10.66.160.71 with SMTP id xi7mr22793682pab.19.1432984045548;
	Sat, 30 May 2015 04:07:25 -0700 (PDT)
Received: from [10.10.95.198] ([167.160.116.73])
	by mx.google.com with ESMTPSA id el6sm8363704pdb.93.2015.05.30.04.07.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 May 2015 04:07:23 -0700 (PDT)
Message-ID: <556999EA.7040502@linaro.org>
Date: Sat, 30 May 2015 19:07:22 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, 
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
	<1432814932-12608-30-git-send-email-zhaoshenglong@huawei.com>
	<55699237.7070702@redhat.com>
In-Reply-To: <55699237.7070702@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.174
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, mjt@tls.msk.ru
Subject: Re: [Qemu-trivial] [PATCH 29/29] hw/s390x/sclpcpu.c: Fix memory
 leak spotted by valgrind
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
X-List-Received-Date: Sat, 30 May 2015 11:07:34 -0000



On 2015/5/30 18:34, Paolo Bonzini wrote:
>
> On 28/05/2015 14:08, Shannon Zhao wrote:
>> >-static qemu_irq *irq_cpu_hotplug; /* Only used in this file */
>> >+static qemu_irq irq_cpu_hotplug; /* Only used in this file */
>> >
>> >  #define EVENT_QUAL_CPU_CHANGE  1
>> >
>> >  void raise_irq_cpu_hotplug(void)
>> >  {
>> >-    qemu_irq_raise(*irq_cpu_hotplug);
>> >+    qemu_irq_raise(irq_cpu_hotplug);
>> >  }
>> >
>> >  static unsigned int send_mask(void)
>> >@@ -81,7 +81,10 @@ static void trigger_signal(void *opaque, int n, int level)
>> >
>> >  static int irq_cpu_hotplug_init(SCLPEvent *event)
>> >  {
>> >-    irq_cpu_hotplug = qemu_allocate_irqs(trigger_signal, event, 1);
>> >+    qemu_irq irq = qemu_allocate_irq(trigger_signal, event, 0);
>> >+
>> >+    irq_cpu_hotplug = irq;
>> >+    qemu_free_irq(irq);
>> >      return 0;
> This is wrong, you cannot free the IRQ after you have stored it in
> irq_cpu_hotplug.

Yeah, sorry for that. But I don't find who calls 
raise_irq_cpu_hotplug(). I'm not very familiar with these codes.

-- 
Shannon

