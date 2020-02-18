Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zgY-0005tA-Gj
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 05:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46625)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zgU-0005kR-Gz
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:00:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zgT-0005t0-DD
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:00:54 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49618
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zgT-0005sW-83
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 05:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582020052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCqgGp0NZnHeZdA6hXWAMbRUH3lpJdGCnsLTUxoeLQI=;
 b=WCuB3HUyl42jk/BTg41ktW41bIaHwBrVApBLKgMwsR8zNJRqO7KlWMXmuIDesmMkoE3XTv
 HHMnII5ZzbcnB2W86RfkMyePsFYXnSpRcwntkxR1eg416d8H/dslney9IuHyLq8u8g+uY9
 WGgwl74y3wbSCgYLQ72EbopGFMQjeVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-cp5tjIznPh6FRxdS8lVNjQ-1; Tue, 18 Feb 2020 05:00:51 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01CA8800D48;
 Tue, 18 Feb 2020 10:00:49 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1372060C81;
 Tue, 18 Feb 2020 10:00:31 +0000 (UTC)
Date: Tue, 18 Feb 2020 10:00:29 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Justin Terry <juterry@microsoft.com>
Subject: Re: [PATCH RESEND 11/13] target/i386/whpx: Remove superfluous
 semicolon
Message-ID: <20200218100029.GN3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-12-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-12-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: cp5tjIznPh6FRxdS8lVNjQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Tue, 18 Feb 2020 10:00:56 -0000

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: 812d49f2a3e
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> Cc: Justin Terry (VM) <juterry@microsoft.com>
> ---
>  target/i386/whpx-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/i386/whpx-all.c b/target/i386/whpx-all.c
> index 3ed2aa1892..35601b8176 100644
> --- a/target/i386/whpx-all.c
> +++ b/target/i386/whpx-all.c
> @@ -511,7 +511,7 @@ static void whpx_get_registers(CPUState *cpu)
>      /* WHvX64RegisterPat - Skipped */
> =20
>      assert(whpx_register_names[idx] =3D=3D WHvX64RegisterSysenterCs);
> -    env->sysenter_cs =3D vcxt.values[idx++].Reg64;;
> +    env->sysenter_cs =3D vcxt.values[idx++].Reg64;
>      assert(whpx_register_names[idx] =3D=3D WHvX64RegisterSysenterEip);
>      env->sysenter_eip =3D vcxt.values[idx++].Reg64;
>      assert(whpx_register_names[idx] =3D=3D WHvX64RegisterSysenterEsp);
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


