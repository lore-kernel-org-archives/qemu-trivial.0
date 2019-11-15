Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVeOq-0006xb-83
	for mharc-qemu-trivial@gnu.org; Fri, 15 Nov 2019 11:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51744)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iVeOo-0006x4-Ei
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 11:24:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iVeOm-0000QJ-Sp
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 11:24:42 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34748
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iVeOm-0000Q6-Pd
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 11:24:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573835080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rVekyxgN4bMiTsZH/4w84/56lmlCAIprnqv5e2wLqAE=;
 b=KQRt1piOHv4zpGX/TScNeLXB4BrpDxaMBoksMxtkv38NHp55uBKd11/TxHrHkNKAkTQfLX
 NdBlglIuGYNQEk3FZZ6LtSNhRDWLsKTi+Icu7IoQ3j/4kLFJYHoxE+gZ7TPjI0JkYVi5wx
 Ely1nZm2LfVFrLArE9un8BTeiaJnetA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-6SrWiY4qPBmPr32446gpQA-1; Fri, 15 Nov 2019 11:24:37 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18D291858F1D;
 Fri, 15 Nov 2019 16:24:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-84.ams2.redhat.com
 [10.36.117.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BC671036C81;
 Fri, 15 Nov 2019 16:24:29 +0000 (UTC)
Subject: Re: [PATCH for-4.2] hw/i386: Fix compiler warning when CONFIG_IDE_ISA
 is disabled
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191115145049.26868-1-thuth@redhat.com>
 <CAFEAcA-EuQVBtr=BCE5sdHo+LMv8XchHUSPM=CgSYxPVryWKZg@mail.gmail.com>
 <273a3123-9eef-c78e-5b83-833a21e3988c@redhat.com>
 <CAFEAcA9N+T=M=5-xb3ahRMqD6oxhm5Lx55-1Mtk1vXsRJEomwA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <85b5fbcc-e06b-7ce2-0a97-7fdc156915cd@redhat.com>
Date: Fri, 15 Nov 2019 17:12:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9N+T=M=5-xb3ahRMqD6oxhm5Lx55-1Mtk1vXsRJEomwA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 6SrWiY4qPBmPr32446gpQA-1
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
X-List-Received-Date: Fri, 15 Nov 2019 16:24:43 -0000

On 15/11/2019 17.15, Peter Maydell wrote:
> On Fri, 15 Nov 2019 at 16:08, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 15/11/2019 16.54, Peter Maydell wrote:
>>> On Fri, 15 Nov 2019 at 15:10, Thomas Huth <thuth@redhat.com> wrote:
>>>> --- a/hw/i386/pc_piix.c
>>>> +++ b/hw/i386/pc_piix.c
>>>> @@ -78,7 +78,6 @@ static void pc_init1(MachineState *machine,
>>>>      X86MachineState *x86ms =3D X86_MACHINE(machine);
>>>>      MemoryRegion *system_memory =3D get_system_memory();
>>>>      MemoryRegion *system_io =3D get_system_io();
>>>> -    int i;
>>>>      PCIBus *pci_bus;
>>>>      ISABus *isa_bus;
>>>>      PCII440FXState *i440fx_state;
>>>> @@ -253,7 +252,7 @@ static void pc_init1(MachineState *machine,
>>>>      }
>>>>  #ifdef CONFIG_IDE_ISA
>>>>  else {
>>>> -        for(i =3D 0; i < MAX_IDE_BUS; i++) {
>>>> +        for (int i =3D 0; i < MAX_IDE_BUS; i++) {
>>>>              ISADevice *dev;
>>>>              char busname[] =3D "ide.0";
>>>>              dev =3D isa_ide_init(isa_bus, ide_iobase[i], ide_iobase2[=
i],
>>>
>>> Don't put variable declarations inside 'for' statements,
>>> please. They should go at the start of a {} block.
>>
>> Why? We're using -std=3Dgnu99 now, so this should not be an issue anymor=
e.
>=20
> Consistency with the rest of the code base, which mostly
> avoids this particular trick.

We've also got a few spots that use it...
(run e.g.: grep -r 'for (int ' hw/* )

> See the 'Declarations' section of CODING_STYLE.rst.

OK, that's a point. But since this gnu99 is a rather new option that we
just introduced less than a year ago, we should maybe think of whether
we want to allow this for for-loops now, too (since IMHO it's quite a
nice feature in gnu99).

 Thomas


