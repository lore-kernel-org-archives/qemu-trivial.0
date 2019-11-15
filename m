Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVdcS-0007dm-Hf
	for mharc-qemu-trivial@gnu.org; Fri, 15 Nov 2019 10:34:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iVdcP-0007bC-NV
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 10:34:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iVdcO-0002VV-AP
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 10:34:41 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48111
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iVdcO-0002V0-5n
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 10:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573832079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxQN2ykuPzWY1WWuzKCGPYzXoWDwWAklpvKcneRm7NU=;
 b=HzGMnrV+VkX3qghquBPjwJg8GCUqemVqmuL+0yugvg0niIt4sMJwBVsvfzBcgITFvmmDq+
 IXSUA+GMa1LO58s1/9//cxO+vsOVIlel2NtWDIfcrOHvnJoJKBbFnznoFxu+5C1oZV0se1
 5XyKKXOPGqcxxxz4mFH1nu7vvsUyTSY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-H4vyW-I4Nr2Ytu-QyzucYQ-1; Fri, 15 Nov 2019 10:34:38 -0500
Received: by mail-qk1-f197.google.com with SMTP id s144so6597299qke.20
 for <qemu-trivial@nongnu.org>; Fri, 15 Nov 2019 07:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jXuZvRCxs4H7wEEmJhLwwDotj+6kIvzITkOyqqDQOWU=;
 b=V+YXNvrSHh3LPIxIjlvwbXnNXohikSekp/k1OhTC1/kKV8ElB/8qU8P9fkY5qjInzB
 fNxRNhGR1hJc8ZF9Pzh1EPKYRPxZqCD01T5ShaxNuCL3RUBtPdlV3xGyHv/nuTlSRb09
 REmOSIy9tyxdh2lGEBZc7qapo+bOIMetv8bIFXQjOfJvd/d2LCESgrva8Y2vVxBtc46M
 tjCbDIZ2lv3V05VUs7ZiDa+BVoovb6UEtj5V6X0D7hAzzimnbO0VjZI8S7QwKo+1vrVb
 8YXaXP5iZYEhLzh1mfe5oRuYW95FCUjmP8fa54QgDndKhX2YVU3dQVo0qtI5Me/A9hv7
 h72Q==
X-Gm-Message-State: APjAAAWH3MVuxanQTDnvaVbMfmxaag/lHd0PWOD5FaMOkPELMJk+4xvp
 0v2tBdvzMeXlpcFuKr1V3wGKlba/ILE1WwrVAL9EMYgs8rMRTJmVaPLRSXB6cbTq+4AUuANiO5t
 85R57vGMmpv+eNw9hqA==
X-Received: by 2002:a05:620a:110f:: with SMTP id
 o15mr12703172qkk.127.1573832077250; 
 Fri, 15 Nov 2019 07:34:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqxo7BpSfa8lh2X5mXpDSvekynyzwR7AxSyihG0mFZD6PZqmRuL0mFs/cw2wK97xTB0XiYREOg==
X-Received: by 2002:a05:620a:110f:: with SMTP id
 o15mr12703048qkk.127.1573832075823; 
 Fri, 15 Nov 2019 07:34:35 -0800 (PST)
Received: from redhat.com (bzq-79-176-6-42.red.bezeqint.net. [79.176.6.42])
 by smtp.gmail.com with ESMTPSA id h24sm3072394qtn.36.2019.11.15.07.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 07:34:34 -0800 (PST)
Date: Fri, 15 Nov 2019 10:34:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH for-4.2] hw/i386: Fix compiler warning when
 CONFIG_IDE_ISA is disabled
Message-ID: <20191115103335-mutt-send-email-mst@kernel.org>
References: <20191115145049.26868-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191115145049.26868-1-thuth@redhat.com>
X-MC-Unique: H4vyW-I4Nr2Ytu-QyzucYQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:43 -0000

On Fri, Nov 15, 2019 at 03:50:49PM +0100, Thomas Huth wrote:
> When CONFIG_IDE_ISA is disabled, compilation currently fails:
>=20
>  hw/i386/pc_piix.c: In function =E2=80=98pc_init1=E2=80=99:
>  hw/i386/pc_piix.c:81:9: error: unused variable =E2=80=98i=E2=80=99 [-Wer=
ror=3Dunused-variable]
>=20
> Move the variable declaration to the right code block to avoid
> this problem.
>=20
> Fixes: 4501d317b50e ("hw/i386/pc: Extract pc_i8259_create()")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/i386/pc_piix.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 2aefa3b8df..d187db761c 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -78,7 +78,6 @@ static void pc_init1(MachineState *machine,
>      X86MachineState *x86ms =3D X86_MACHINE(machine);
>      MemoryRegion *system_memory =3D get_system_memory();
>      MemoryRegion *system_io =3D get_system_io();
> -    int i;
>      PCIBus *pci_bus;
>      ISABus *isa_bus;
>      PCII440FXState *i440fx_state;
> @@ -253,7 +252,7 @@ static void pc_init1(MachineState *machine,
>      }
>  #ifdef CONFIG_IDE_ISA
>  else {
> -        for(i =3D 0; i < MAX_IDE_BUS; i++) {
> +        for (int i =3D 0; i < MAX_IDE_BUS; i++) {
>              ISADevice *dev;
>              char busname[] =3D "ide.0";
>              dev =3D isa_ide_init(isa_bus, ide_iobase[i], ide_iobase2[i],
> --=20
> 2.23.0


