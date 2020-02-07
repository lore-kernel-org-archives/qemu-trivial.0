Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j04M4-0003QB-Og
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 09:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46441)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j04M2-0003Kw-9C
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 09:11:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j04Ly-0003OY-0C
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 09:11:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49476
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j04Lx-0003O9-Sl
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 09:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581084689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o81+JWmLU/tFz7R4cIBaX3fO8pUbp9JTZdiL9GKDwS8=;
 b=VlCoSzNoSdLwKnHoVXJYu1IWkrCK3hWIQwhmwzHKH42md8soX/5bHoO7KGpdt4ErLgLZpT
 IahJOz4SPoD85wFD93Tp2R/nxewkCZEAGVytdnP1jsLKoIrcduuJLVHlgM3YzIjSlFuCW7
 XPYWQDh1pr8JvG3VnfLM9QXaAakXO9E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-GmTEqHcNM5mVWFSM8ZueAQ-1; Fri, 07 Feb 2020 09:11:25 -0500
Received: by mail-qk1-f200.google.com with SMTP id p3so1485004qkd.11
 for <qemu-trivial@nongnu.org>; Fri, 07 Feb 2020 06:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=r7HLC+pRyHdtI1HUnYeCh7nUdsYVlBwhAa0vgrpGZwE=;
 b=Yy5fpqyV03FYhFzIuAXwHe2hJ8jAJiWGSxouwMsQpO0yFtfMCnap3aiVQ3L5doS42r
 TmFO4N7ynS+ASIqJKePkH1log8wYvF7o0q8LlbI6MJFijw80Zz+bj+IbBMBB+vxeh4ZO
 Fv01nTvbeQDnQoODPcI8DQhoQkGrWsAMoNXlZLfAUq1og0Am8WiGUr6tXpckbRMHdkSR
 17kUb34Jsa3MBfO4hlLX+eGzmFTQ/xC5qC8NA0G1yRBM9QBmHdmYca0BdcKs50ZcNqD3
 wN8o1//JoZ2bVViivQ6mI45DeVed9D2hDbfH7Kli0z/55PsGWrbxb+56yDXOrcVP+qlA
 ASqw==
X-Gm-Message-State: APjAAAWgxakam8SMmfCUvQarr5dQFCsaTtVCoXZbQeLijOPHml77j2is
 VmEu/ZdGUCALKu93203F7/r6iokxuKYF081fwa2xeDrOY10n4imeom5TGoWRxP8F2x0l1AmOsw0
 +RbuFh3xRZCB74YqqWw==
X-Received: by 2002:ae9:f50c:: with SMTP id o12mr7535347qkg.42.1581084685173; 
 Fri, 07 Feb 2020 06:11:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqybFpSe7hEw7HPlsSHWTeTred/Bqbnh34A8vvhVkNG91NbRJEbUtCucDkm6pF0Z6PlJOt/FQw==
X-Received: by 2002:ae9:f50c:: with SMTP id o12mr7535300qkg.42.1581084684907; 
 Fri, 07 Feb 2020 06:11:24 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id d17sm1358069qkc.9.2020.02.07.06.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 06:11:24 -0800 (PST)
Date: Fri, 7 Feb 2020 09:11:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
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
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Huth <huth@tuxfamily.org>, Magnus Damm <magnus.damm@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v3 3/3] vl: Abort if multiple machines are registered as
 default
Message-ID: <20200207090427-mutt-send-email-mst@kernel.org>
References: <20200207130453.16666-1-philmd@redhat.com>
 <20200207130453.16666-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200207130453.16666-4-philmd@redhat.com>
X-MC-Unique: GmTEqHcNM5mVWFSM8ZueAQ-1
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
X-List-Received-Date: Fri, 07 Feb 2020 14:11:35 -0000

On Fri, Feb 07, 2020 at 02:04:53PM +0100, Philippe Mathieu-Daud=E9 wrote:
> It would be confusing to have multiple default machines.
> Abort if this ever occurs.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> v2: Use assert() instead of human friendly message (Marc-Andr=E9)
>=20
> Cc: Marc-Andr=E9 Lureau <marcandre.lureau@gmail.com>
> Cc: Laurent Vivier <laurent@vivier.eu>

Is it really worth adding counting logic just so we can assert?
There are a bunch of other places that deal with
default, like qmp query machines and find_default_machine.

> ---
>  vl.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/vl.c b/vl.c
> index 7dcb0879c4..b3e0f7af25 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2354,6 +2354,8 @@ static MachineClass *machine_parse(const char *name=
, GSList *machines)
>      GSList *el;
> =20
>      if (is_help_option(name)) {
> +        int default_count =3D 0;
> +
>          printf("Supported machines are:\n");
>          machines =3D g_slist_sort(machines, machine_class_cmp);
>          for (el =3D machines; el; el =3D el->next) {
> @@ -2364,7 +2366,9 @@ static MachineClass *machine_parse(const char *name=
, GSList *machines)
>              printf("%-20s %s%s%s\n", mc->name, mc->desc,
>                     mc->is_default ? " (default)" : "",
>                     mc->deprecation_reason ? " (deprecated)" : "");
> +            default_count +=3D !!mc->is_default;
>          }
> +        assert(default_count <=3D 1);
>          exit(0);
>      }
> =20
> --=20
> 2.21.1


