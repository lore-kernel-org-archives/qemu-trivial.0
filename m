Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cQZOg-0006eO-Da
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2017 07:49:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cQZOd-0006cg-LY
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 07:49:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cQZOc-00008G-Jn
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 07:49:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42972)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cQZOX-0008VZ-8J; Mon, 09 Jan 2017 07:49:49 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1176C057FA4;
	Mon,  9 Jan 2017 12:49:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v09Cnj7D029945
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 9 Jan 2017 07:49:46 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3337911386A2; Mon,  9 Jan 2017 13:49:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <1483194856-14079-1-git-send-email-hpoussin@reactos.org>
Date: Mon, 09 Jan 2017 13:49:44 +0100
In-Reply-To: <1483194856-14079-1-git-send-email-hpoussin@reactos.org>
	(=?utf-8?Q?=22Herv=C3=A9?=
	Poussineau"'s message of "Sat, 31 Dec 2016 15:34:16 +0100")
Message-ID: <8737gsl7o7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 09 Jan 2017 12:49:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: disable default cdrom
 when using explicitely scsi-hd
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
X-List-Received-Date: Mon, 09 Jan 2017 12:49:57 -0000

Herv=C3=A9 Poussineau <hpoussin@reactos.org> writes:

> 'ide-hd', 'ide-cd' and 'scsi-cd' devices already disable default cdrom.
> Make it the same for 'scsi-hd'.
>
> That way, we can add/replace the device on lun=3D2 without using -nodefau=
lts.

Yes, but it might upset existing usage that relies on the default
CD-ROM.  In my opinion, making your needs explicit is better than
relying on defaults, but that doesn't mean we can change the defaults
unthinkingly.  Definitely not qemu-trivial.

Opinions on the change?

> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> ---
>  vl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/vl.c b/vl.c
> index d77dd86..da97fe2 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -223,6 +223,7 @@ static struct {
>      { .driver =3D "ide-hd",               .flag =3D &default_cdrom     },
>      { .driver =3D "ide-drive",            .flag =3D &default_cdrom     },
>      { .driver =3D "scsi-cd",              .flag =3D &default_cdrom     },
> +    { .driver =3D "scsi-hd",              .flag =3D &default_cdrom     },
>      { .driver =3D "virtio-serial-pci",    .flag =3D &default_virtcon   },
>      { .driver =3D "virtio-serial",        .flag =3D &default_virtcon   },
>      { .driver =3D "VGA",                  .flag =3D &default_vga       },

