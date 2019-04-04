Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC2RZ-0002hz-IB
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2019 09:30:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hC2RW-0002df-Vt
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 09:30:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hC2RO-0007f4-PC
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 09:30:08 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36489)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hC2RF-0007R2-8G
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 09:29:55 -0400
Received: by mail-wm1-f68.google.com with SMTP id h18so3427888wml.1
	for <qemu-trivial@nongnu.org>; Thu, 04 Apr 2019 06:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nUd8cTP9qpRYs3k+eJh++k3ugtuXl2eIU+wnENtQXpk=;
	b=tHjKp7CkrWCI9nhdsanxv8mN2Cx11LDi68bKBG04CjvcNwRMCHdjEIOOHQsLNZyBYg
	bMUWqGLwbJj57snwYPauWmukzsVYaGZkrK36WCzLBYcEaosCRHqEG7B7o6PYptSHhJCF
	cEP/pliqkWkQmAPMivsaidRn8f22oixafzaiua1SUHm7ak6Gt8jO37DZmAYT1PSjaAfx
	1NZ9s9fCL3fwl/OVMH8+ysCivJyyQQQMWcaoqN8vfTJU7jPSbL7I45TuOhdA6W+Qi19M
	kJwsbzzaFT2PPDzWvpWViUu/P9+cZ2Hc1Q8UUDA0+2kQKBT+04yVReAPPCi6UFU6Iu7J
	eN2Q==
X-Gm-Message-State: APjAAAXdQT/ZUZDgmyzoMmSWB0g2OrabgHxKPTt5TLUPgW/O8gxjj3qq
	OiozxWBGzUi4YjcuWJvwxZtm8ESOIdg=
X-Google-Smtp-Source: APXvYqx8F7jg1gPC/zUcxm6pybLpjJvvliSqwsVdhQj+dG9mqIMRLzz84/tPVPIcdTblVgmbX5BDNQ==
X-Received: by 2002:a7b:c111:: with SMTP id w17mr4162278wmi.6.1554384589080;
	Thu, 04 Apr 2019 06:29:49 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	v14sm22244539wrr.20.2019.04.04.06.29.48
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 06:29:48 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org
References: <20190404071421.4891-1-thuth@redhat.com>
	<298ccbd7-9af5-8303-e42b-33dd1cb94b9e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <158fe22a-5781-73e5-5955-2fe9db019236@redhat.com>
Date: Thu, 4 Apr 2019 15:29:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <298ccbd7-9af5-8303-e42b-33dd1cb94b9e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/input/pckbd: The i8042
 device should not be user_creatable
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
X-List-Received-Date: Thu, 04 Apr 2019 13:30:12 -0000

On 4/4/19 12:07 PM, Paolo Bonzini wrote:
> On 04/04/19 09:14, Thomas Huth wrote:
>> The i8042 PS/2 controller is part of the chipset on the motherboard.
>> It is instantiated by the machine init code, and it does not make sense
>> to allow the user to plug an additional i8042 in any of the free ISA slots.
>> Thus let's mark the device with user_creatable = false.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/input/pckbd.c | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> user_creatable is not for devices that are not pluggable in real life;
> it is for devices that crash QEMU (!) or always fail if plugged by the user.
> 
> So the question to ask is: would it make sense, and especially work, to
> add an i8042 to machines that do have an ISA bridge (for example the Alpha?)

Correct me if I'm wrong but it seems no machine directly use a 8042 on a
ISA bus, it is always part of a SuperIO chipset. It is not reflected in
the code (in particular the X86 machines, but I'm working on cleaning this).

So I think this change is OK and will help to enforce using proper
superio chipsets in the future.

> 
> Paolo
> 
> 
>> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
>> index 47a606f5e3..af393818fc 100644
>> --- a/hw/input/pckbd.c
>> +++ b/hw/input/pckbd.c
>> @@ -568,6 +568,8 @@ static void i8042_class_initfn(ObjectClass *klass, void *data)
>>      dc->realize = i8042_realizefn;
>>      dc->vmsd = &vmstate_kbd_isa;
>>      set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>> +    /* i8042 is a device on the motherboard, and not pluggable by the user */

I'm not sure the comment is accurate, maybe "ISA i8042 are provided by
Super I/O devices"?

>> +    dc->user_creatable = false;
>>  }
>>  
>>  static const TypeInfo i8042_info = {
>>
> 
> 

