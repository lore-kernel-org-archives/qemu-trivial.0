Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j04fd-0005I0-IZ
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 09:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j04fY-0005Gi-2b
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 09:31:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j04fW-0000k9-BS
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 09:31:43 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21694
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j04fV-0000iu-Qz
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 09:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581085899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vz8wbWCWXlY0gWuW3MgVcaPaCa09d8KKsH0OzL8y8a4=;
 b=f1aC4AySAoj4xQzprWg8cmt7jlGIUqeSYT2rI3md57szsc6mxGF+nuBljLnaG3t2A1eGV5
 bdC9KBxG+8NxcLOkUxgbI+Ejo2lJgEqCNgVR7GSi2G0OgFoMPEBK8dwuenycPGsq979Hck
 8YKL98BmXq/lSZmepApDik2vZexRyiw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-XCS10-5cMoekBl6IdAxkdA-1; Fri, 07 Feb 2020 09:31:38 -0500
Received: by mail-wm1-f69.google.com with SMTP id y24so801155wmj.8
 for <qemu-trivial@nongnu.org>; Fri, 07 Feb 2020 06:31:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VtkHZr81rvmtBj1Cpat22KAdsuT5jWjVLYgghqx79fI=;
 b=sw278x2iZPdAm0WZT0QpSowjBFIWpGMRVWGzs+Gqu84C+9vgmFg3Shx9G/BH0rcJ36
 Qt3Xur9iOSgdsgvtscDnNjTdmNDg+av1r7jdhm/S43IHR7ghO4A84uF+7Nyjkn5ny1/E
 3PgWJTAzb16xiwDP0MkEtVuc6S54Cn5RUK6ZgTwNIBK5tEcUbX65fQA2KGPykNtohMw4
 vmoIs4/Wu33Rt/ePVPevnBY5x9pFwPqzTqy/tHkbwBNVqWmxl3rja+sWcq8W1m3dV5Ha
 JlHc3ARmjQjsB4An/RdyM79Y9T1s7bvj+h2bipv+t13AcLIkwlFs0Z8fncM/xcVeq5hm
 8f+w==
X-Gm-Message-State: APjAAAXfnfktf97u3TZ3KZki3mUMGCQIHu1a/eTN7aUNUyZO2OgzHf+t
 uHZwfOEmzkTKgvdeIzeX0TUu2t/ObjJikZt9x6HqDsgKO7YFJCYltrG7e3aM2oqeofMxIDqXL9t
 cFUui1XOydFNK+uBqZw==
X-Received: by 2002:adf:b351:: with SMTP id k17mr4947924wrd.199.1581085896766; 
 Fri, 07 Feb 2020 06:31:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLhT2wOX9AtHoZd6PuG4htpgedY1dLbQ449keb8ioxL5X/z6hNF4a8m1NNSpNqgOK0GIzq+w==
X-Received: by 2002:adf:b351:: with SMTP id k17mr4947890wrd.199.1581085896575; 
 Fri, 07 Feb 2020 06:31:36 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id n1sm3531640wrw.52.2020.02.07.06.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 06:31:35 -0800 (PST)
Subject: Re: [PATCH v3 2/3] hw: Make MachineClass::is_default a boolean type
To: Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Green <green@moxielogic.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Michael Walle <michael@walle.cc>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Huth <huth@tuxfamily.org>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20200207130453.16666-1-philmd@redhat.com>
 <20200207130453.16666-3-philmd@redhat.com>
 <20200207091138-mutt-send-email-mst@kernel.org>
 <16ec9b38-94e4-bd2d-a47f-83a27289ab47@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <60c21c90-8b29-64aa-15bd-4ba94972f344@redhat.com>
Date: Fri, 7 Feb 2020 15:31:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <16ec9b38-94e4-bd2d-a47f-83a27289ab47@vivier.eu>
Content-Language: en-US
X-MC-Unique: XCS10-5cMoekBl6IdAxkdA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Fri, 07 Feb 2020 14:31:47 -0000

On 2/7/20 3:22 PM, Laurent Vivier wrote:
> Le 07/02/2020 =C3=A0 15:11, Michael S. Tsirkin a =C3=A9crit=C2=A0:
>> On Fri, Feb 07, 2020 at 02:04:52PM +0100, Philippe Mathieu-Daud=C3=A9 wr=
ote:
>>> There's no good reason for it to be type int, change it to bool.
>>>
>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>
>>> ---
>>> v3: new patch
>>> ---
>>>   include/hw/boards.h                      |  2 +-
>>>   hw/alpha/dp264.c                         |  2 +-
>>>   hw/cris/axis_dev88.c                     |  2 +-
>>>   hw/hppa/machine.c                        |  2 +-
>>>   hw/i386/pc_piix.c                        | 10 +++++-----
>>>   hw/lm32/lm32_boards.c                    |  2 +-
>>>   hw/m68k/mcf5208.c                        |  2 +-
>>>   hw/microblaze/petalogix_s3adsp1800_mmu.c |  2 +-
>>>   hw/mips/mips_malta.c                     |  2 +-
>>>   hw/moxie/moxiesim.c                      |  2 +-
>>>   hw/nios2/10m50_devboard.c                |  2 +-
>>>   hw/openrisc/openrisc_sim.c               |  2 +-
>>>   hw/ppc/mac_oldworld.c                    |  2 +-
>>>   hw/ppc/spapr.c                           |  2 +-
>>>   hw/riscv/spike.c                         |  2 +-
>>>   hw/s390x/s390-virtio-ccw.c               |  2 +-
>>>   hw/sh4/shix.c                            |  2 +-
>>>   hw/sparc/sun4m.c                         |  2 +-
>>>   hw/sparc64/niagara.c                     |  2 +-
>>>   hw/sparc64/sun4u.c                       |  4 ++--
>>>   hw/unicore32/puv3.c                      |  2 +-
>>>   21 files changed, 26 insertions(+), 26 deletions(-)
>>>
> ...
>>> diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
>>> index 5eb2d097b9..81a1748fad 100644
>>> --- a/hw/sparc64/niagara.c
>>> +++ b/hw/sparc64/niagara.c
>>> @@ -170,7 +170,7 @@ static void niagara_class_init(ObjectClass *oc, voi=
d *data)
>>>  =20
>>>       mc->desc =3D "Sun4v platform, Niagara";
>>>       mc->init =3D niagara_init;
>>> -    mc->max_cpus =3D 1; /* XXX for now */
>>> +    mc->max_cpus =3D true; /* XXX for now */
>=20
> what happened here ^^^
>=20
>>>       mc->default_boot_order =3D "c";
>>>       mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("Sun-UltraSparc-T1")=
;
>>>   }
>>> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
>>> index b7ac42f7a5..3c2c9d2eb0 100644
>>> --- a/hw/sparc64/sun4u.c
>>> +++ b/hw/sparc64/sun4u.c
>>> @@ -816,7 +816,7 @@ static void sun4u_class_init(ObjectClass *oc, void =
*data)
>>>       mc->init =3D sun4u_init;
>>>       mc->block_default_type =3D IF_IDE;
>>>       mc->max_cpus =3D 1; /* XXX for now */
>>> -    mc->is_default =3D 1;
>>> +    mc->is_default =3D true;
>>>       mc->default_boot_order =3D "c";
>>>       mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("TI-UltraSparc-IIi")=
;
>>>       mc->ignore_boot_device_suffixes =3D true;
>>> @@ -841,7 +841,7 @@ static void sun4v_class_init(ObjectClass *oc, void =
*data)
>>>       mc->desc =3D "Sun4v platform";
>>>       mc->init =3D sun4v_init;
>>>       mc->block_default_type =3D IF_IDE;
>>> -    mc->max_cpus =3D 1; /* XXX for now */
>>> +    mc->max_cpus =3D true; /* XXX for now */
>=20
> and here ^^

lol too few cases so I was lazy to use a sed regex... v4 coming soon.


