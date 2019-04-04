Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC5QF-0006aB-NM
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2019 12:41:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hC5QE-0006a1-9G
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 12:41:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hC5QC-00057B-Mj
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 12:41:02 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hC5QC-00050z-De
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 12:41:00 -0400
Received: by mail-wm1-f67.google.com with SMTP id q16so3803662wmj.3
	for <qemu-trivial@nongnu.org>; Thu, 04 Apr 2019 09:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+MMvex/3Xco/RtXRG6FP34tdZUfaGnKFWm133Y9IAlg=;
	b=NUrXWT1ghcCuLWwRkT192crU/xXbxOvC/HtSuown6RkIcoIFL/JYI9+g3pP/A2E/Fz
	XGa9DMhX1kB05sU4Ak0X0UKnw1DQ2HtNLv/iuHsV04dLpuAKGGvXlqnyedNr6vFVfpPN
	wp89NoYsLKLIUESoyqN6sRS67q4L/yLG0LH0sgB8m8W6PskEj4X1vlX6H0SXf4AG5z1r
	Q45I2+5vqEh9FQJ87vgfwXyN9y3S6Xi+anpc3I6ID3hJTT4XXFkHyaHuQhX1gv+gn3QN
	t9/Kvkn3KpAuftQEDy6kFVMQtTJ969hrBSxOFmXUHPJSOp2Zy33dTrQG3hSqPu1D9kwF
	Hwxg==
X-Gm-Message-State: APjAAAW6gscb4BhU4XvdTPWdydEN3Vg3VCes7LWQIiep6mH91I9tiwLo
	1nxwiMuJNlJVvIGOmywBpNB5/3wHehk=
X-Google-Smtp-Source: APXvYqzjOz6H1x1Z6Y1McvIsZZOCRHKemlb0vOEA8VSWrHuJJVgh4zWXUNGIqHb7xiIsfTCMfL3aHg==
X-Received: by 2002:a1c:7f10:: with SMTP id a16mr4880499wmd.30.1554396058922; 
	Thu, 04 Apr 2019 09:40:58 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	q4sm26702137wrx.25.2019.04.04.09.40.57
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 09:40:58 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org
References: <20190404071421.4891-1-thuth@redhat.com>
	<298ccbd7-9af5-8303-e42b-33dd1cb94b9e@redhat.com>
	<158fe22a-5781-73e5-5955-2fe9db019236@redhat.com>
	<3ba3c765-589f-4c0a-38dc-d9126f515e7b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <fda6bc0b-9ea0-2770-f104-568b3f16ab90@redhat.com>
Date: Thu, 4 Apr 2019 18:40:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3ba3c765-589f-4c0a-38dc-d9126f515e7b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
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
X-List-Received-Date: Thu, 04 Apr 2019 16:41:03 -0000

On 4/4/19 4:19 PM, Thomas Huth wrote:
> On 04/04/2019 15.29, Philippe Mathieu-Daudé wrote:
>> On 4/4/19 12:07 PM, Paolo Bonzini wrote:
>>> On 04/04/19 09:14, Thomas Huth wrote:
>>>> The i8042 PS/2 controller is part of the chipset on the motherboard.
>>>> It is instantiated by the machine init code, and it does not make sense
>>>> to allow the user to plug an additional i8042 in any of the free ISA slots.
>>>> Thus let's mark the device with user_creatable = false.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>  hw/input/pckbd.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>
>>> user_creatable is not for devices that are not pluggable in real life;
>>> it is for devices that crash QEMU (!) or always fail if plugged by the user.
> 
> ... hmm, but presenting devices to the user that are clearly not
> intended for direct use is also not very nice, is it?
> 
>>> So the question to ask is: would it make sense, and especially work, to
>>> add an i8042 to machines that do have an ISA bridge (for example the Alpha?)
> 
> I don't think so. It is a device that is supposed to be part of the
> chipset on the motherboard, so operating systems certainly don't know
> how to use this device on other machines.
> 
> And at least some part of the device have to be set up in source code
> (see e.g. i8042_setup_a20_line() ...).
> 
>> Correct me if I'm wrong but it seems no machine directly use a 8042 on a
>> ISA bus, it is always part of a SuperIO chipset. It is not reflected in
>> the code (in particular the X86 machines, but I'm working on cleaning this).
> 
> What about the "isa_create_simple(isa_bus, TYPE_I8042)" in mips_r4k.c ?

There is a comment at the top of the file:

" All peripherial devices are attached to this "bus" with the standard
PC ISA addresses."

So IMO this setup is definitively modelable by an instance of the
TYPE_ISA_SUPERIO abstract device.
At a quick look the r4k has no parallel port and 4 uarts, so I'd add a
such model internal to mips_r4k.c (see fdc37m81x_class_init()).

>>>> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
>>>> index 47a606f5e3..af393818fc 100644
>>>> --- a/hw/input/pckbd.c
>>>> +++ b/hw/input/pckbd.c
>>>> @@ -568,6 +568,8 @@ static void i8042_class_initfn(ObjectClass *klass, void *data)
>>>>      dc->realize = i8042_realizefn;
>>>>      dc->vmsd = &vmstate_kbd_isa;
>>>>      set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>>>> +    /* i8042 is a device on the motherboard, and not pluggable by the user */
>>
>> I'm not sure the comment is accurate, maybe "ISA i8042 are provided by
>> Super I/O devices"?
> 
> Fine for me, too ... but what about mips_r4k in that case?
> 
>  Thomas
> 

