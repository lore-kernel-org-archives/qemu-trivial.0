Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQUrJ-0004jl-9s
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2019 06:40:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQUrB-0004cd-Er
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:40:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQUr9-0007CQ-6s
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:40:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39096)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hQUr7-00073i-5E
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:40:21 -0400
Received: by mail-wm1-f66.google.com with SMTP id n25so2259602wmk.4
	for <qemu-trivial@nongnu.org>; Tue, 14 May 2019 03:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=APfPWIzAW58W4BKWrDr3D6/BLxWSkOUQ+0nXQGJPVT4=;
	b=FW9R7ZFmNM3rSYs8m9/O0F2EaXuAX4h/2m3XD/G7ZJXEHcMOgX/KV+sV34Tq1YBdjG
	Ki2n4LFo2RHsMtLUBckv33O3m8sebJfoI2MejAOAbTVmBIpGG0HCnvXXtiL5ekpXFjwk
	GqMwHaI9YUlhN93VL56Rt1GGr9ShNYH9iY5oWJT37HXM+jLWSvuwJ7aZ1zUVLnuhP0Wl
	a4MFas60vp0nME4UxDEcfO0ixyeeKrJ+WeuLL3dTXZBaJdtEvhJQQ/QBj2t8vhMu5nk8
	3P6PGTHcGEhaLbKeBPAdpHqWKmEempB+2W4E6ELYsjgjII+Gmu633Yu3DA3+Mg7pnOYa
	XdVw==
X-Gm-Message-State: APjAAAX2ZZUBNwbFWkJHNL02RGC1VpG7KVViPkwsfJA6cDUpdWSgZIi2
	02fBdRwppgq0/eyNu4WbnBg5sQ==
X-Google-Smtp-Source: APXvYqycDjal5z7NOkcD6MXKYMf1dzi9VBsD3CbMunMKUuR5uDnGYhXekdVBainW5NirLdE+Buat5w==
X-Received: by 2002:a05:600c:21d7:: with SMTP id
	x23mr7102967wmj.87.1557830417559; 
	Tue, 14 May 2019 03:40:17 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	s124sm2093306wmf.42.2019.05.14.03.40.16
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 03:40:17 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <20190514100019.13263-1-thuth@redhat.com>
	<20190514100019.13263-3-thuth@redhat.com>
	<CAFEAcA9bGr1249Ofx=TXLK3JNs1KMWTnRR+-FexKr__0AJAipQ@mail.gmail.com>
	<41876537-aa47-6d13-5298-a3af03d11b8a@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4655d635-6fc3-2757-8577-ddce41b91be6@redhat.com>
Date: Tue, 14 May 2019 12:40:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <41876537-aa47-6d13-5298-a3af03d11b8a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [Qemu-arm] [PATCH 2/4] hw/core: Add a config
 switch for the "or-irq" device
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2019 10:40:27 -0000

On 5/14/19 12:25 PM, Philippe Mathieu-Daudé wrote:
> On 5/14/19 12:06 PM, Peter Maydell wrote:
>> On Tue, 14 May 2019 at 11:00, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> The "or-irq" device is only used by certain machines. Let's add
>>> a proper config switch for it so that it only gets compiled when we
>>> really need it.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  hw/arm/Kconfig        | 2 ++
>>>  hw/core/Kconfig       | 3 +++
>>>  hw/core/Makefile.objs | 2 +-
>>>  hw/pci-host/Kconfig   | 3 ++-
>>>  4 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>> index af8cffde9c..0bb3bbe9d3 100644
>>> --- a/hw/arm/Kconfig
>>> +++ b/hw/arm/Kconfig
>>> @@ -277,6 +277,7 @@ config RASPI
>>>  config STM32F205_SOC
>>>      bool
>>>      select ARM_V7M
>>> +    select OR_IRQ
>>>      select STM32F2XX_TIMER
>>>      select STM32F2XX_USART
>>>      select STM32F2XX_SYSCFG
>>> @@ -424,6 +425,7 @@ config ARMSSE
>>>      select IOTKIT_SECCTL
>>>      select IOTKIT_SYSCTL
>>>      select IOTKIT_SYSINFO
>>> +    select OR_IRQ
>>>      select TZ_MPC
>>>      select TZ_MSC
>>>      select TZ_PPC
>>
>> In cases like this where a device is used both by
>> an SoC and also directly by the board code that uses
>> that SoC, should we put the select OR_IRQ only in
>> the SoC's config, or also in the board model's config
>> (ie, in "config MPS2" as well as "config ARMSSE") ?
> 
> Someone should be able to work on the board without having to look at
> the SoC code/config, so both :) The idea of Kconfig is you only worry
> about a specific device, and the qgraph sort the rest out.

Hypothetical example if you only use the selector in the SoC config:
If you replace the SoC OR_IRQ by a more complex device or extended one,
the board will lack the OR_IRQ selector.

Using Kconfig selectors in all place a dependency is explicit also ease
backports.

> 
> So having in both place is safer, and helps to visualize dependencies in
> the graph tree (I'm slowly working on this feature to help new-comer to
> understand model dependencies).
> 

