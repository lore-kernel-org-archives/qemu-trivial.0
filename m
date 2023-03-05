Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYlJ5-0003t7-Dm
	for mharc-qemu-trivial@gnu.org; Sun, 05 Mar 2023 05:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pYlJ3-0003se-Iv
 for qemu-trivial@nongnu.org; Sun, 05 Mar 2023 05:09:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pYlJ0-0007zX-Me
 for qemu-trivial@nongnu.org; Sun, 05 Mar 2023 05:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678010964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D3VYHQ4PlqwkN8xjpHytmxDsbfPL+rHNcX9cwZegjfY=;
 b=I0TPB+xhoCuGeugxbNsC+VNCk+mVk3G2bBBldqbQaBxZHrHZkIylW5lyBplEwDx5NrtDvJ
 meZDVAoRBFKZI2mx9QvmAz2OY2L39ceuqe0j1glsozfgSfkfKFowyR8pmY56yp94tW8xWi
 a3Svg4Z+BHx5FEpgJ/ElQHErwghrMHM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-NXHhH8PcNcucMYkJV5Z__A-1; Sun, 05 Mar 2023 05:09:23 -0500
X-MC-Unique: NXHhH8PcNcucMYkJV5Z__A-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi21-20020a05600c3d9500b003e836e354e0so2614763wmb.5
 for <qemu-trivial@nongnu.org>; Sun, 05 Mar 2023 02:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678010962;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D3VYHQ4PlqwkN8xjpHytmxDsbfPL+rHNcX9cwZegjfY=;
 b=xi7M25GXshMib46Uz9Fbw7eImBaBEJgpeABrwmu3mJ8u89BrZaBSAzF+SovBRWJ++L
 EI6d5tnl1q9hKlqfbrHvbmLft8yjNg9d5y1ZUI9DLnwp7dDNzDBlEZdgFtLf2XGObV0G
 zS2RWaA4dEBifOpt80vMbWFf5VkkVqtjamMi2YpXjgRjTLYUTi+scVHPdHDYvQuefYu0
 R7Mwo0JmNuJxZKjUl1xsbmnnLIzh/tNmtPqo8csMdu/5t82axtWtFEPzy0UDxkpcsfI8
 DwNQmSdiokKZM9NTAnAWQct+cM78KHH6qdQgKQRVbmvf18ZgfQHloy5P3GUrtar7XKWG
 5cGA==
X-Gm-Message-State: AO0yUKXeJa+wPr1dwsSXjGazdlnwAx1h0yyIDtj1cQuVLWWkr3dbMl4n
 5c8SkzRhx5NcqkwAOllE4JVDNMWswrZOdolIIZe2ZIYF87DLfNB6hDHpIA0gkZBXUGpCAy9V0+/
 8Hg3M+cOcaQrypZN+Kg==
X-Received: by 2002:a05:600c:3548:b0:3dc:5390:6499 with SMTP id
 i8-20020a05600c354800b003dc53906499mr6655970wmq.1.1678010961922; 
 Sun, 05 Mar 2023 02:09:21 -0800 (PST)
X-Google-Smtp-Source: AK7set+URKRXmC0GV0fTXjL81xKWzVQj26hG/dXpwdaDR1u1LGow4fctGbG6Wpqp7X3ADBGEtfaHBQ==
X-Received: by 2002:a05:600c:3548:b0:3dc:5390:6499 with SMTP id
 i8-20020a05600c354800b003dc53906499mr6655945wmq.1.1678010961586; 
 Sun, 05 Mar 2023 02:09:21 -0800 (PST)
Received: from redhat.com ([2.52.23.160]) by smtp.gmail.com with ESMTPSA id
 w34-20020a05600c09a200b003e21f959453sm7279615wmp.32.2023.03.05.02.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 02:09:21 -0800 (PST)
Date: Sun, 5 Mar 2023 05:09:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v4 0/9] PC cleanups
Message-ID: <20230305050831-mutt-send-email-mst@kernel.org>
References: <20230213162004.2797-1-shentey@gmail.com>
 <776DAC15-E708-47BF-9EF6-D511731DF56D@gmail.com>
 <4A6D076C-5091-42A5-BB83-695B5BF2F04D@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4A6D076C-5091-42A5-BB83-695B5BF2F04D@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Mar 2023 10:09:29 -0000

On Sun, Mar 05, 2023 at 07:45:55AM +0000, Bernhard Beschow wrote:
> 
> 
> Am 13. Februar 2023 16:45:05 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >
> >
> >Am 13. Februar 2023 16:19:55 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >>This series contains some cleanups I came across when working on the PC
> >>
> >>machines. It consists of reducing the usage of global variables and eliminating
> >>
> >>some redundancies.
> >>
> >>
> >>
> >>One notable change is that the SMRAM memory region gets moved from the i440fx
> >>
> >>and q35 host bridges into the x86 machine. This will simplify cleaning up these
> >>
> >>host bridges which will be done in a separate series. Note that the movement of
> >>
> >>the SMRAM memory region apparently doesn't change migration ABI for the pc and
> >>
> >>q35 machines (see below).
> >>
> >>
> >>
> >>Testing done:
> >>
> >>* `make check`
> >>
> >>' `make check-avocado`
> >>
> >>* `qemu-system-x86_64 -M q35 -m 2G -cdrom \
> >>
> >>   manjaro-kde-21.3.2-220704-linux515.iso`
> >>
> >>* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
> >>
> >>* Confirm that JSON representation of migration files (pc & q35) are empty:
> >>
> >>  1. Create four migration files {pc,q35}-{before,after}.mig by running
> >>
> >>     `qemu-system-x86_64 -M {pc,q35} -S` with QEMU built from master and from
> >>
> >>     this series.
> >>
> >>  2. Run `./scripts/analyze-migration.py -d desc -f *.mig > *.json` on the four
> >>
> >>     files
> >>
> >>  3. Compare the diffs -> both are empty
> >>
> >>
> >>
> >>v4:
> >>
> >>* Remove ram_memory variable in pc_q35 completely (Zoltan)
> >>
> >
> >The last two patches still need review. Comments welcome!
> 
> Ping
> 
> Can we queue the reviewed patches (all but the last two) already?
> 
> Thanks,
> Bernhard

Philippe objected to patch 1 - he suggested using
pci_address_space_io.




> >
> >>
> >>
> >>v3:
> >>
> >>* Add three patches regarding init_pam() and SMRAM.
> >>
> >>* Drop 'hw/i386/pc_q35: Resolve redundant q35_host variable' since Phil posted
> >>
> >>  a similar patch in a more comprehensive series:
> >>
> >>  https://lore.kernel.org/qemu-devel/20230203180914.49112-13-philmd@linaro.org/
> >>
> >>* Drop 'hw/isa/lpc_ich9: Reuse memory and io address space of PCI bus' since
> >>
> >>  it inadvertantly changed the memory hierarchy.
> >>
> >>* Drop ICH9 cleanups again in favor of a separate series.
> >>
> >>
> >>
> >>v2:
> >>
> >>* Factor out 'hw/i386/pc_q35: Reuse machine parameter' from 'hw/i386/pc_q35:
> >>
> >>  Resolve redundant q35_host variable' (Zoltan)
> >>
> >>* Lower type of phb to Object in 'hw/i386/pc_q35: Resolve redundant q35_host
> >>
> >>  variable' (Zoltan)
> >>
> >>* Add ICH9 cleanups
> >>
> >>
> >>
> >>Bernhard Beschow (9):
> >>
> >>  hw/pci-host/i440fx: Inline sysbus_add_io()
> >>
> >>  hw/pci-host/q35: Inline sysbus_add_io()
> >>
> >>  hw/i386/pc_q35: Reuse machine parameter
> >>
> >>  hw/i386/pc_{q35,piix}: Reuse MachineClass::desc as SMB product name
> >>
> >>  hw/i386/pc_{q35,piix}: Minimize usage of get_system_memory()
> >>
> >>  hw/i386/pc: Initialize ram_memory variable directly
> >>
> >>  hw/pci-host/pam: Make init_pam() usage more readable
> >>
> >>  hw/i386/x86: Make TYPE_X86_MACHINE the owner of smram
> >>
> >>  target/i386/tcg/sysemu/tcg-cpu: Avoid own opinion about smram size
> >>
> >>
> >>
> >> include/hw/i386/pc.h             |  1 -
> >>
> >> include/hw/i386/x86.h            |  2 ++
> >>
> >> include/hw/pci-host/i440fx.h     |  7 ++++---
> >>
> >> include/hw/pci-host/pam.h        |  5 +++--
> >>
> >> include/hw/pci-host/q35.h        |  4 +++-
> >>
> >> hw/i386/pc.c                     |  2 --
> >>
> >> hw/i386/pc_piix.c                | 10 +++++-----
> >>
> >> hw/i386/pc_q35.c                 | 17 +++++++++--------
> >>
> >> hw/i386/x86.c                    |  4 ++++
> >>
> >> hw/pci-host/i440fx.c             | 28 +++++++++++++---------------
> >>
> >> hw/pci-host/pam.c                | 12 ++++++------
> >>
> >> hw/pci-host/q35.c                | 31 ++++++++++++++++---------------
> >>
> >> target/i386/tcg/sysemu/tcg-cpu.c |  3 +--
> >>
> >> 13 files changed, 66 insertions(+), 60 deletions(-)
> >>
> >>
> >>
> >>-- >
> >>2.39.1
> >>
> >>
> >>


