Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVeEW-0006nJ-4K
	for mharc-qemu-trivial@gnu.org; Fri, 15 Nov 2019 11:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iVeET-0006j6-FU
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 11:14:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iVeES-0002pf-Bc
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 11:14:01 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50243
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iVeES-0002pR-7o
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 11:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573834439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=UennmhyG0dP9wCu8SRBKgYsQAkaiuD+Jxt/UZ17dl+o=;
 b=Yv8+pDZiWYemR3fDJVFBZje5OgJ28hDR2slQ/HvK1xRVT3blNwJLx5vGKStLVR5lQDpTJu
 LNb1Z1NHdse7W7xqiAmEaB4bTYEtgw7LFN1eCoYdruyAQpkzgvwXBkUwROXQfPQ19nsAl7
 CG53r+s3sJGRddRMxA/PdAGYFbStctI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-20827psXPleD7_BXz9ZMSw-1; Fri, 15 Nov 2019 11:13:58 -0500
Received: by mail-wm1-f71.google.com with SMTP id f21so6239521wmh.5
 for <qemu-trivial@nongnu.org>; Fri, 15 Nov 2019 08:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W3F/w1aELdf0A/0WT5oul3fnoEMBpqpKoCKpHcMispc=;
 b=lOv6EtDLE97TQvuy/zCJPTnEAiQsaADnLsaw8aMG422JD8bOkdhGrSHdlKftWorTv/
 a8G6FwPQUtilPIZjyustCr1Vr/fw37zdRjT6kyqgqXup/gQYFME4eQrevgn7VjXU+E/U
 eytzH3xgL7aSIYNLcK2hdPVf+4Wvcg7oyrs2nGCQL80M3VqU3tQY7dxl9JDi3ShGOMao
 ZcaajGNy32qkCFICzXoZ9N5AldcLu9g5prBTi2aK0hx5gfk4xL7175s37qBU9jsCc8D0
 3HSCg6DuAR47Sp8M4+IBtixMS61s5yflB0JcTnoQUWWr5ZtjeKknpnpNXRsHCAJ9squj
 4NXg==
X-Gm-Message-State: APjAAAXzuM5muTlp9UzCoVID6koJ0z2Wz3Y+p1nW6iHpCS3zAyP3Z3wn
 fEz3GYZ/x+HTAHe6bOM/wZL7NeCFE+l6lbuPqZLFcXHP9GPAqJ8zFo5QfMGs9KRvP7BFmqYlfpD
 66IaBFsZ2jP6m43BVnQ==
X-Received: by 2002:adf:fc0a:: with SMTP id i10mr16995945wrr.105.1573834437239; 
 Fri, 15 Nov 2019 08:13:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqzh6nsrSFYjug+U57NGuvdt/lSudSQoPtJKoXziK/gU/mEfB866177mwLmblUL9a03CtDFgiw==
X-Received: by 2002:adf:fc0a:: with SMTP id i10mr16995915wrr.105.1573834436939; 
 Fri, 15 Nov 2019 08:13:56 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:a15b:f753:1ac4:56dc?
 ([2001:b07:6468:f312:a15b:f753:1ac4:56dc])
 by smtp.gmail.com with ESMTPSA id d202sm9583655wmd.47.2019.11.15.08.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2019 08:13:56 -0800 (PST)
Subject: Re: [PATCH for-4.2] hw/i386: Fix compiler warning when CONFIG_IDE_ISA
 is disabled
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191115145049.26868-1-thuth@redhat.com>
 <CAFEAcA-EuQVBtr=BCE5sdHo+LMv8XchHUSPM=CgSYxPVryWKZg@mail.gmail.com>
 <273a3123-9eef-c78e-5b83-833a21e3988c@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c7c45aed-76c0-9c17-72fb-6abceb9e5ff4@redhat.com>
Date: Fri, 15 Nov 2019 17:13:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <273a3123-9eef-c78e-5b83-833a21e3988c@redhat.com>
Content-Language: en-US
X-MC-Unique: 20827psXPleD7_BXz9ZMSw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 15 Nov 2019 16:14:02 -0000

On 15/11/19 16:54, Thomas Huth wrote:
> On 15/11/2019 16.54, Peter Maydell wrote:
>> On Fri, 15 Nov 2019 at 15:10, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> When CONFIG_IDE_ISA is disabled, compilation currently fails:
>>>
>>>  hw/i386/pc_piix.c: In function =E2=80=98pc_init1=E2=80=99:
>>>  hw/i386/pc_piix.c:81:9: error: unused variable =E2=80=98i=E2=80=99 [-W=
error=3Dunused-variable]
>>>
>>> Move the variable declaration to the right code block to avoid
>>> this problem.
>>>
>>> Fixes: 4501d317b50e ("hw/i386/pc: Extract pc_i8259_create()")
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  hw/i386/pc_piix.c | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>> index 2aefa3b8df..d187db761c 100644
>>> --- a/hw/i386/pc_piix.c
>>> +++ b/hw/i386/pc_piix.c
>>> @@ -78,7 +78,6 @@ static void pc_init1(MachineState *machine,
>>>      X86MachineState *x86ms =3D X86_MACHINE(machine);
>>>      MemoryRegion *system_memory =3D get_system_memory();
>>>      MemoryRegion *system_io =3D get_system_io();
>>> -    int i;
>>>      PCIBus *pci_bus;
>>>      ISABus *isa_bus;
>>>      PCII440FXState *i440fx_state;
>>> @@ -253,7 +252,7 @@ static void pc_init1(MachineState *machine,
>>>      }
>>>  #ifdef CONFIG_IDE_ISA
>>>  else {
>>> -        for(i =3D 0; i < MAX_IDE_BUS; i++) {
>>> +        for (int i =3D 0; i < MAX_IDE_BUS; i++) {
>>>              ISADevice *dev;
>>>              char busname[] =3D "ide.0";
>>>              dev =3D isa_ide_init(isa_bus, ide_iobase[i], ide_iobase2[i=
],
>>
>> Don't put variable declarations inside 'for' statements,
>> please. They should go at the start of a {} block.
>=20
> Why? We're using -std=3Dgnu99 now, so this should not be an issue anymore=
.

For now I can squash the following while we discuss coding standards. :)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index fa62244f4d..0130b8fb4e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -244,7 +244,8 @@ static void pc_init1(MachineState *machine,
     }
 #ifdef CONFIG_IDE_ISA
 else {
-        for (int i =3D 0; i < MAX_IDE_BUS; i++) {
+        int i;
+        for (i =3D 0; i < MAX_IDE_BUS; i++) {
             ISADevice *dev;
             char busname[] =3D "ide.0";
             dev =3D isa_ide_init(isa_bus, ide_iobase[i], ide_iobase2[i],



Paolo


