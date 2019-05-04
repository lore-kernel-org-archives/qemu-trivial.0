Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMvU5-0005Kg-N8
	for mharc-qemu-trivial@gnu.org; Sat, 04 May 2019 10:17:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMvU0-0005IH-Fe
	for qemu-trivial@nongnu.org; Sat, 04 May 2019 10:17:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMvTz-0006Ns-0H
	for qemu-trivial@nongnu.org; Sat, 04 May 2019 10:17:44 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39071)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hMvTy-0006NE-R2
	for qemu-trivial@nongnu.org; Sat, 04 May 2019 10:17:42 -0400
Received: by mail-wm1-f68.google.com with SMTP id n25so9838836wmk.4
	for <qemu-trivial@nongnu.org>; Sat, 04 May 2019 07:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=V8JCfOXytt3Wb5bbw6Fx43wj8nhFahWQodb/zSt5jJw=;
	b=f9oOs+J+M7QvV6OK4SOYzma6MkK7WiFMMLu0BtCr+0lkkyQbY1eUjdpnYdEjcxBkUj
	KIVWnc0Z5v6r/J2cS9BEzSB7I888RTfJUtl7s8m/J2hRqtn5RaXRc7JlKU2RpfVGkRs0
	iITs372pfIdpuhF4e3trQDhOUMg60xM/fKHAO+2KpljAMMvKa39eeoUHciT3zCGRXtfC
	92okImi1VRJZ/RaM+fkqu1uFWrUJGx0jLvK8Ach5hN4gyPTlqtxlr7iEifbZQRuKL3IP
	QTZA1T5Cpkdnmsk+tZm8IBWVk/DWvRHfxWXjg/gaxGR3dSk33Uk6anj7Enikni0Bomqi
	PGFw==
X-Gm-Message-State: APjAAAXusXYvLcWkbXRSdxBhO2tpvroQUYuh7bqNzqHoykyvACQUan3j
	IXTUAIyiTwtgaCxMvC8Myf+9K3KNnSE=
X-Google-Smtp-Source: APXvYqxK1k2fIUEfEBMDbSHWQpmGHdm/cZ/Q302oPVYDRWdxjbTWVsTyCOumDXqcG15Ojbvoc4PLGQ==
X-Received: by 2002:a1c:4c09:: with SMTP id z9mr9986631wmf.87.1556979460797;
	Sat, 04 May 2019 07:17:40 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	z140sm7657501wmc.27.2019.05.04.07.17.39
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 May 2019 07:17:40 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20190504123538.14952-1-philmd@redhat.com>
	<ffe3d73d-b9a2-a0e3-6dee-222a3d87cc28@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b10a02d5-e54a-7dd5-4e7e-3a39b3fd0b1a@redhat.com>
Date: Sat, 4 May 2019 16:17:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ffe3d73d-b9a2-a0e3-6dee-222a3d87cc28@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [PATCH] hw/net/ne2000: Extract the PCI device
 from the chipset common code
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
X-List-Received-Date: Sat, 04 May 2019 14:17:45 -0000

On 5/4/19 4:09 PM, Thomas Huth wrote:
> On 04/05/2019 14.35, Philippe Mathieu-Daudé wrote:
>> The ne2000.c file contains functions common the the ISA and PCI
>> devices. To allow to build with one or another, extract the PCI
>> specific part into a new file.
>>
>> This fix an issue where the NE2000_ISA Kconfig had to pull the
>> full PCI core objects.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/net/Kconfig       |   7 ++-
>>  hw/net/Makefile.objs |   3 +-
>>  hw/net/ne2000-pci.c  | 132 +++++++++++++++++++++++++++++++++++++++++++
>>  hw/net/ne2000.c      | 105 ----------------------------------
>>  4 files changed, 139 insertions(+), 108 deletions(-)
>>  create mode 100644 hw/net/ne2000-pci.c
>>
>> diff --git a/hw/net/Kconfig b/hw/net/Kconfig
>> index 7d7bbc5d7c9..4ef86dc3a53 100644
>> --- a/hw/net/Kconfig
>> +++ b/hw/net/Kconfig
>> @@ -1,10 +1,14 @@
>>  config DP8393X
>>      bool
>>  
>> +config NE2000_COMMON
>> +    bool
> 
> I'd maybe rather simply name it "NE2000" instead of "NE2000_COMMON", but
> that's just a matter of taste.

I started using this name, but then realized it is confuse and someone
could enable CONFIG_NE2000=y expecting a network device, but none would
be linked.

Paolo, would it be useful to add some 'internal' Kconfig property (like
"default")? So that config is not user-selectable, but only
dependency-selectable. CONFIG_ARM_V7M might be a similar example (we
don't want the user to unselect it).

> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks!

