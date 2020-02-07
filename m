Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j04Za-000752-JM
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 09:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j04ZY-00072N-E4
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 09:25:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j04ZX-0004tP-78
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 09:25:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24375
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j04ZX-0004s9-39
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 09:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581085530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5giItzpYoo3JEelMMhtzAC6x4a3E/6AQgX4HqCHDuJE=;
 b=MfzLo6xlpnyjCavepg+/OXknZdIDW9qToHgZVNjO1DL4QpEHSH6+G7+0LVkaYJl1diH0kk
 sTdgjHT4VVChfuriDtv6KmXoXYxxNZRwAeO57qkLSOxYYgtBZakQ4uJNpwgf+dVMPnLncn
 6vwpCJCY5Uhx8W9oM9gLA8P+h6xPSlo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-vwPI4V3fP8mJW_wBRZfxNw-1; Fri, 07 Feb 2020 09:25:28 -0500
Received: by mail-qk1-f199.google.com with SMTP id z21so1490076qki.18
 for <qemu-trivial@nongnu.org>; Fri, 07 Feb 2020 06:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zs6K5DgkRqHV/ngJLTDOx4/uc8Jnp+hvbLz9w49py/Q=;
 b=Ya2SVIxAoB0Wfy74gCupv2I/VxARmyy2vd3TrsphUzbtqEae+j5hV+ph/i3LQ/0NC0
 6ypJ40D+P4XG4Ux0VnQ9Tu6dmsN4SgrpeVv/by9LbElpVJrRrLNZOEntVfcvJzDbGxEe
 2f1nY30lEC1yeGYVqm+Gu1slDcRA9S86nciGrvyojoCsqwpmvqNo3Xo4RJNJE6RXb8ey
 FHJgA+XrcS6YsxSu6OAU7bqiP0yOaDcWEgZFuc4QqCsTGdRhM210rddZOreA08/HOwNL
 RsOQ+fcbS2OheGvNQz9Jx9QsFzEeCZgoYqldjFYG/EnkX8yG8upTfpoRZXHjUrzQy2tR
 pumg==
X-Gm-Message-State: APjAAAWzjOis0zbAs1IsK1z1sjQxuP9LwOhO9sZR0c5LW7t1xptn+Hc5
 H9Sb1ze57+zhJRAVJlM+r2NJFRZoNaUzL7EPvxuk9oUWIIxX1j8DSIkx99EorVBhGPcUV4TUPuo
 z4dDG6IKGdTy37OnH3Q==
X-Received: by 2002:ac8:607:: with SMTP id d7mr7573946qth.271.1581085525596;
 Fri, 07 Feb 2020 06:25:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqzmFBmC/C8aFTepE2yfJ9wB6lNLabovEOWo1q8396V/RXiRthP2BnpsoYobvSJMZLQVX0nzfQ==
X-Received: by 2002:ac8:607:: with SMTP id d7mr7573905qth.271.1581085525317;
 Fri, 07 Feb 2020 06:25:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id m204sm1407189qke.35.2020.02.07.06.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 06:25:24 -0800 (PST)
Date: Fri, 7 Feb 2020 09:25:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Green <green@moxielogic.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Michael Walle <michael@walle.cc>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Marek Vasut <marex@denx.de>, Jia Liu <proljc@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Huth <huth@tuxfamily.org>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v3 2/3] hw: Make MachineClass::is_default a boolean type
Message-ID: <20200207092450-mutt-send-email-mst@kernel.org>
References: <20200207130453.16666-1-philmd@redhat.com>
 <20200207130453.16666-3-philmd@redhat.com>
 <20200207091138-mutt-send-email-mst@kernel.org>
 <16ec9b38-94e4-bd2d-a47f-83a27289ab47@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <16ec9b38-94e4-bd2d-a47f-83a27289ab47@vivier.eu>
X-MC-Unique: vwPI4V3fP8mJW_wBRZfxNw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Fri, 07 Feb 2020 14:25:33 -0000

On Fri, Feb 07, 2020 at 03:22:19PM +0100, Laurent Vivier wrote:
> Le 07/02/2020 =E0 15:11, Michael S. Tsirkin a =E9crit=A0:
> > On Fri, Feb 07, 2020 at 02:04:52PM +0100, Philippe Mathieu-Daud=E9 wrot=
e:
> >> There's no good reason for it to be type int, change it to bool.
> >>
> >> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> >> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >=20
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >=20
> >> ---
> >> v3: new patch
> >> ---
> >>  include/hw/boards.h                      |  2 +-
> >>  hw/alpha/dp264.c                         |  2 +-
> >>  hw/cris/axis_dev88.c                     |  2 +-
> >>  hw/hppa/machine.c                        |  2 +-
> >>  hw/i386/pc_piix.c                        | 10 +++++-----
> >>  hw/lm32/lm32_boards.c                    |  2 +-
> >>  hw/m68k/mcf5208.c                        |  2 +-
> >>  hw/microblaze/petalogix_s3adsp1800_mmu.c |  2 +-
> >>  hw/mips/mips_malta.c                     |  2 +-
> >>  hw/moxie/moxiesim.c                      |  2 +-
> >>  hw/nios2/10m50_devboard.c                |  2 +-
> >>  hw/openrisc/openrisc_sim.c               |  2 +-
> >>  hw/ppc/mac_oldworld.c                    |  2 +-
> >>  hw/ppc/spapr.c                           |  2 +-
> >>  hw/riscv/spike.c                         |  2 +-
> >>  hw/s390x/s390-virtio-ccw.c               |  2 +-
> >>  hw/sh4/shix.c                            |  2 +-
> >>  hw/sparc/sun4m.c                         |  2 +-
> >>  hw/sparc64/niagara.c                     |  2 +-
> >>  hw/sparc64/sun4u.c                       |  4 ++--
> >>  hw/unicore32/puv3.c                      |  2 +-
> >>  21 files changed, 26 insertions(+), 26 deletions(-)
> >>
> ...
> >> diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
> >> index 5eb2d097b9..81a1748fad 100644
> >> --- a/hw/sparc64/niagara.c
> >> +++ b/hw/sparc64/niagara.c
> >> @@ -170,7 +170,7 @@ static void niagara_class_init(ObjectClass *oc, vo=
id *data)
> >> =20
> >>      mc->desc =3D "Sun4v platform, Niagara";
> >>      mc->init =3D niagara_init;
> >> -    mc->max_cpus =3D 1; /* XXX for now */
> >> +    mc->max_cpus =3D true; /* XXX for now */
>=20
> what happened here ^^^
>=20
> >>      mc->default_boot_order =3D "c";
> >>      mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("Sun-UltraSparc-T1")=
;
> >>  }
> >> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> >> index b7ac42f7a5..3c2c9d2eb0 100644
> >> --- a/hw/sparc64/sun4u.c
> >> +++ b/hw/sparc64/sun4u.c
> >> @@ -816,7 +816,7 @@ static void sun4u_class_init(ObjectClass *oc, void=
 *data)
> >>      mc->init =3D sun4u_init;
> >>      mc->block_default_type =3D IF_IDE;
> >>      mc->max_cpus =3D 1; /* XXX for now */
> >> -    mc->is_default =3D 1;
> >> +    mc->is_default =3D true;
> >>      mc->default_boot_order =3D "c";
> >>      mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("TI-UltraSparc-IIi")=
;
> >>      mc->ignore_boot_device_suffixes =3D true;
> >> @@ -841,7 +841,7 @@ static void sun4v_class_init(ObjectClass *oc, void=
 *data)
> >>      mc->desc =3D "Sun4v platform";
> >>      mc->init =3D sun4v_init;
> >>      mc->block_default_type =3D IF_IDE;
> >> -    mc->max_cpus =3D 1; /* XXX for now */
> >> +    mc->max_cpus =3D true; /* XXX for now */
>=20
> and here ^^
>=20
> Thanks,
> Laurent

Ooh good catch. Which probably means we don't have a unit test for these
...


