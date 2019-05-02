Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMFzw-0006fP-7o
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2019 13:59:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hMFzt-0006dZ-3s
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 13:59:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hMFzr-0007H4-U4
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 13:59:53 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:44119)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hMFzp-0007Eg-DU; Thu, 02 May 2019 13:59:49 -0400
Received: by mail-lj1-x243.google.com with SMTP id c6so3000386lji.11;
	Thu, 02 May 2019 10:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0VjxVOcl1MoOa25ngfW6povCoOwAh1Uz2h223Jsfveg=;
	b=o+bZE39uTlc3z4OBMv1o/SG4EajNPpCx6SaJRA4Typg0QxWULGDG1zO3RFAC4F53IO
	/TzkJrLnLsWyszvDXafdFuGQ5JwlmMBsbR699JI5VEekFKptQ3iGLjekpBoDFsjUy1vr
	O2aoXm/k/MwKFCTI4WEhW4deO8omTvoL/SqG+lqY+1+NTEYE0f9I9oEV+muRZhCJAXNT
	HPCZw6ZAe4YfQmI0hmVGVdUK2w0Oyt0V9HBySRY6xN6Lar7uzeK4J0LWNuQVNJgVEgHL
	dtROrS1/vkikVNGsyWhUYEjc6ZZqzd6viNEMdaWAZdHCG3X+Mz89J8fc34bfaFvRRUAd
	pFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0VjxVOcl1MoOa25ngfW6povCoOwAh1Uz2h223Jsfveg=;
	b=XJfkf8HA+ajuBzsevUyHdwTbxmyFVuFAg6dY0MKLe7C2Ow6YHzty+ta419HvfySrRR
	3Sn2KaOTjksKr6AMxWuqf5asN0VawHQGcuVTePfUJ6Sakc/iyH+cGOBIuTtglIC+YYID
	NUVjUjk3h9l1WyniB6tYDxLK8+lsgY76HgtveJtGYosPJJJEJX5pboZ7AVMRKhUR+Qdf
	o649z/odVLb3kPvDgkc8hm0DRhxbYOdUxFBh/GdkRZFVlnL6Thp5TpFj1IeI3OgzURg0
	n1Jy8uLB6AKgK0Te0oxWTZzGy1Vnt4aEJ+CKx77pZK0l4KJo9fxYw3tHv95MzxFsj5Qb
	m3CA==
X-Gm-Message-State: APjAAAVyOuxznE/ROqrBEOKubGFMA4X9XBGbdlHtuQ+7hLfDdkIIZbNn
	fajbvTondCT/l1VcLjpXcRnop3Nr0Bw/7aivtGM=
X-Google-Smtp-Source: APXvYqwFP3CS4RNu6cOUDOqvInOQYFk6IRMQv4yb+MZTlzSXwQw7uCRsNUKgw07gJnpA/fwD3hMw5ZUNPJp1HKk1tRk=
X-Received: by 2002:a2e:2b8c:: with SMTP id r12mr2829457ljr.115.1556819987480; 
	Thu, 02 May 2019 10:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1556666645.git.alistair.francis@wdc.com>
	<002f222d86322a66276de39cb29796acffe384c1.1556666645.git.alistair.francis@wdc.com>
	<20190501094140.GO29808@redhat.com>
In-Reply-To: <20190501094140.GO29808@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 May 2019 10:57:51 -0700
Message-ID: <CAKmqyKOOw5A24vmrv7x5z8jiRMRBYdqPL5udbUk4NHEbDTBksQ@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kraxel@redhat.com" <kraxel@redhat.com>, 
	"riku.voipio@iki.fi" <riku.voipio@iki.fi>,
	"laurent@vivier.eu" <laurent@vivier.eu>, 
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-trivial] [PATCH v2 1/5] util/qemu-sockets: Fix GCC 9
 build warnings
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
X-List-Received-Date: Thu, 02 May 2019 17:59:54 -0000

On Wed, May 1, 2019 at 2:41 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Tue, Apr 30, 2019 at 11:28:22PM +0000, Alistair Francis wrote:
> > Fix this warning when building with GCC9 on Fedora 30:
> > In function =E2=80=98strncpy=E2=80=99,
> >     inlined from =E2=80=98unix_connect_saddr.isra.0=E2=80=99 at util/qe=
mu-sockets.c:925:5:
> > /usr/include/bits/string_fortified.h:106:10: error: =E2=80=98__builtin_=
strncpy=E2=80=99 specified bound 108 equals destination size [-Werror=3Dstr=
ingop-truncation]
> >   106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (=
__dest));
> >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
> > In function =E2=80=98strncpy=E2=80=99,
> >     inlined from =E2=80=98unix_listen_saddr.isra.0=E2=80=99 at util/qem=
u-sockets.c:880:5:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  util/qemu-sockets.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > index 9705051690..8c3322958f 100644
> > --- a/util/qemu-sockets.c
> > +++ b/util/qemu-sockets.c
> > @@ -829,7 +829,7 @@ static int unix_listen_saddr(UnixSocketAddress *sad=
dr,
> >      struct sockaddr_un un;
> >      int sock, fd;
> >      char *pathbuf =3D NULL;
> > -    const char *path;
> > +    const char *path QEMU_NONSTRING;
> >
> >      sock =3D qemu_socket(PF_UNIX, SOCK_STREAM, 0);
> >      if (sock < 0) {
> > @@ -922,7 +922,7 @@ static int unix_connect_saddr(UnixSocketAddress *sa=
ddr, Error **errp)
> >
> >      memset(&un, 0, sizeof(un));
> >      un.sun_family =3D AF_UNIX;
> > -    strncpy(un.sun_path, saddr->path, sizeof(un.sun_path));
> > +    memcpy(un.sun_path, saddr->path, MIN(strlen(saddr->path), sizeof(u=
n.sun_path)));
> >
> >      /* connect to peer */
> >      do {
>
> I think my proposed fix for this file is preferrable as it avoids
> repeated strlen calls
>
>   https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg02124.html

That's fine with me, I have dropped this patch.

Alistair

>
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

