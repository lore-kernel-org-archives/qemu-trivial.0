Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iViI9-0004KA-NV
	for mharc-qemu-trivial@gnu.org; Fri, 15 Nov 2019 15:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iViI4-0004J7-57
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 15:34:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iViI2-0006xv-EK
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 15:33:59 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30855
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iViI2-0006xo-Ar
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 15:33:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573850037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/xNcdTmkcJPeynSqMWfjWiq5ARQaZ+ZdcyZVrWm5hM=;
 b=KuArhCgIExERKM1lOHlPRHC+ViEwWf/g5WlmiUBOVXL4rRgESYGCNm51U/1B8jvYkfiGqb
 GeIUUuGlQv/Z4qVhoHPnWfuGMtEoRm+O7h7sQJT4+zhTPA34ZaxmzRXJaUaM88yOxYGfga
 p57SoJahcji89piFtWdbShzfnxP0xOA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-WhpOhZTTNZWziTEPPR_-fQ-1; Fri, 15 Nov 2019 15:33:56 -0500
Received: by mail-wm1-f71.google.com with SMTP id t203so6922867wmt.7
 for <qemu-trivial@nongnu.org>; Fri, 15 Nov 2019 12:33:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LVd/0L7Kkg11GT11i+kP3yo0t5j6ifayUNh5lfAITqo=;
 b=EtYvJOOtCjFUSwI4UN2G6wcRc/zF+bgXmyDz2l7HGTl2ahf/H6HPQwOSKpa1r2gxQS
 oM+LfmAjJMN49dotF/lXvUVhZCjIhjBCtuLGwz2+UbItlmfuQXtdB6NvYqbO0VNx7TOf
 qnLE708P8mhpuwEa5dW3emBvOx0FSu+7JpiV3zmRQRlBDsDdv7/Mj417ZEvW8sgNK13v
 c6+TPFXw3RD1tz1ddDhWvazD13cmtJ6wSgmkf2r+IMAUXJ6RGjyt8Sk5wbD7zU9sG/55
 E11bbuZdemLyK0orywS8iqXymsLd+dnjU3tPvtNTzvr4KSezTIu+U88tlyKUYJL3xlvM
 +bnw==
X-Gm-Message-State: APjAAAUIhfIs/zljdXxvJOEAv7XdmDABjVHxDWJMnAxdGulbY73F2ohm
 NYHFYjRL4w+1N7yh0VjdU8CcVVFFDbCNAXTx4ocWoJPk6KOH8r/Le4fwnpAK0Tk/6gSH2hD5Pq9
 otclLpfs34opryusVnw==
X-Received: by 2002:adf:f44a:: with SMTP id f10mr17547536wrp.63.1573850035594; 
 Fri, 15 Nov 2019 12:33:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqwpsxL7j/q/JtFqkuyG464ZN2FB57L9GJpO1g6b2uC8nNHoJkV3QxyzbmbPvv1wmF1HS5aK1A==
X-Received: by 2002:adf:f44a:: with SMTP id f10mr17547512wrp.63.1573850035411; 
 Fri, 15 Nov 2019 12:33:55 -0800 (PST)
Received: from [192.168.1.35] (170.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.170])
 by smtp.gmail.com with ESMTPSA id n17sm12205585wrp.40.2019.11.15.12.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2019 12:33:54 -0800 (PST)
Subject: Re: [PATCH for-4.2] hw/i386: Fix compiler warning when CONFIG_IDE_ISA
 is disabled
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
References: <20191115145049.26868-1-thuth@redhat.com>
 <CAFEAcA-EuQVBtr=BCE5sdHo+LMv8XchHUSPM=CgSYxPVryWKZg@mail.gmail.com>
 <273a3123-9eef-c78e-5b83-833a21e3988c@redhat.com>
 <c7c45aed-76c0-9c17-72fb-6abceb9e5ff4@redhat.com>
 <be453a76-d5fe-62c3-6954-447be7fe646a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a2795653-8726-6bce-7183-2da59d70808e@redhat.com>
Date: Fri, 15 Nov 2019 21:33:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <be453a76-d5fe-62c3-6954-447be7fe646a@redhat.com>
Content-Language: en-US
X-MC-Unique: WhpOhZTTNZWziTEPPR_-fQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Nov 2019 20:34:01 -0000

On 11/15/19 5:13 PM, Thomas Huth wrote:
> On 15/11/2019 17.13, Paolo Bonzini wrote:
>> On 15/11/19 16:54, Thomas Huth wrote:
>>> On 15/11/2019 16.54, Peter Maydell wrote:
>>>> On Fri, 15 Nov 2019 at 15:10, Thomas Huth <thuth@redhat.com> wrote:
>>>>>
>>>>> When CONFIG_IDE_ISA is disabled, compilation currently fails:
>>>>>
>>>>>   hw/i386/pc_piix.c: In function =E2=80=98pc_init1=E2=80=99:
>>>>>   hw/i386/pc_piix.c:81:9: error: unused variable =E2=80=98i=E2=80=99 =
[-Werror=3Dunused-variable]
>>>>>
>>>>> Move the variable declaration to the right code block to avoid
>>>>> this problem.
>>>>>
>>>>> Fixes: 4501d317b50e ("hw/i386/pc: Extract pc_i8259_create()")
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>   hw/i386/pc_piix.c | 3 +--
>>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>>>> index 2aefa3b8df..d187db761c 100644
>>>>> --- a/hw/i386/pc_piix.c
>>>>> +++ b/hw/i386/pc_piix.c
>>>>> @@ -78,7 +78,6 @@ static void pc_init1(MachineState *machine,
>>>>>       X86MachineState *x86ms =3D X86_MACHINE(machine);
>>>>>       MemoryRegion *system_memory =3D get_system_memory();
>>>>>       MemoryRegion *system_io =3D get_system_io();
>>>>> -    int i;
>>>>>       PCIBus *pci_bus;
>>>>>       ISABus *isa_bus;
>>>>>       PCII440FXState *i440fx_state;
>>>>> @@ -253,7 +252,7 @@ static void pc_init1(MachineState *machine,
>>>>>       }
>>>>>   #ifdef CONFIG_IDE_ISA
>>>>>   else {
>>>>> -        for(i =3D 0; i < MAX_IDE_BUS; i++) {
>>>>> +        for (int i =3D 0; i < MAX_IDE_BUS; i++) {
>>>>>               ISADevice *dev;
>>>>>               char busname[] =3D "ide.0";
>>>>>               dev =3D isa_ide_init(isa_bus, ide_iobase[i], ide_iobase=
2[i],
>>>>
>>>> Don't put variable declarations inside 'for' statements,
>>>> please. They should go at the start of a {} block.
>>>
>>> Why? We're using -std=3Dgnu99 now, so this should not be an issue anymo=
re.
>>
>> For now I can squash the following while we discuss coding standards. :)

Thanks.

>>
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index fa62244f4d..0130b8fb4e 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -244,7 +244,8 @@ static void pc_init1(MachineState *machine,
>>       }
>>   #ifdef CONFIG_IDE_ISA
>>   else {
>> -        for (int i =3D 0; i < MAX_IDE_BUS; i++) {
>> +        int i;
>> +        for (i =3D 0; i < MAX_IDE_BUS; i++) {
>>               ISADevice *dev;
>>               char busname[] =3D "ide.0";
>>               dev =3D isa_ide_init(isa_bus, ide_iobase[i], ide_iobase2[i=
],
>=20
> Yes, please do. I guess we won't update CODING_STYLE.rst during the hard
> freeze anymore ;-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


