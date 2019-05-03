Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMUQt-0003WX-Be
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 05:24:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hMUQq-0003UX-PI
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 05:24:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hMUQp-0008Mj-Jl
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 05:24:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1hMUQm-0008Kc-NV; Fri, 03 May 2019 05:24:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A182730ADBD0;
	Fri,  3 May 2019 09:24:35 +0000 (UTC)
Received: from redhat.com (ovpn-112-52.ams2.redhat.com [10.36.112.52])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAE695C689;
	Fri,  3 May 2019 09:24:27 +0000 (UTC)
Date: Fri, 3 May 2019 10:24:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"alistair23@gmail.com" <alistair23@gmail.com>,
	"kraxel@redhat.com" <kraxel@redhat.com>,
	"riku.voipio@iki.fi" <riku.voipio@iki.fi>,
	"laurent@vivier.eu" <laurent@vivier.eu>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190503092424.GB17905@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20190503004021.13814-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190503004021.13814-1-alistair.francis@wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 03 May 2019 09:24:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3] hw/usb/hcd-xhci: Fix GCC 9 build
 warning
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
X-List-Received-Date: Fri, 03 May 2019 09:24:42 -0000

On Fri, May 03, 2019 at 12:42:04AM +0000, Alistair Francis wrote:
> Fix this build warning with GCC 9 on Fedora 30:
> hw/usb/hcd-xhci.c:3339:66: error: =E2=80=98%d=E2=80=99 directive output=
 may be truncated writing between 1 and 10 bytes into a region of size 5 =
[-Werror=3Dformat-truncation=3D]
>  3339 |             snprintf(port->name, sizeof(port->name), "usb2 port=
 #%d", i+1);
>       |                                                                =
  ^~
> hw/usb/hcd-xhci.c:3339:54: note: directive argument in the range [1, 21=
47483647]
>  3339 |             snprintf(port->name, sizeof(port->name), "usb2 port=
 #%d", i+1);
>       |                                                      ^~~~~~~~~~=
~~~~~
> In file included from /usr/include/stdio.h:867,
>                  from /home/alistair/qemu/include/qemu/osdep.h:99,
>                  from hw/usb/hcd-xhci.c:21:
> /usr/include/bits/stdio2.h:67:10: note: =E2=80=98__builtin___snprintf_c=
hk=E2=80=99 output between 13 and 22 bytes into a destination of size 16
>    67 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVE=
L - 1,
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>    68 |        __bos (__s), __fmt, __va_arg_pack ());
>       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> This is the onl patch left if my original series "Fix some GCC 9 build
> warnings" that hasn't either been accepeted into a maintainers tree or
> fixed by someone else.
>=20
>  hw/usb/hcd-xhci.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index ec28bee319..a15b103b65 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -3321,6 +3321,8 @@ static void usb_xhci_init(XHCIState *xhci)
> =20
>      usb_bus_new(&xhci->bus, sizeof(xhci->bus), &xhci_bus_ops, dev);
> =20
> +    g_assert(usbports <=3D MAX(MAXPORTS_2, MAXPORTS_3));
> +
>      for (i =3D 0; i < usbports; i++) {
>          speedmask =3D 0;
>          if (i < xhci->numports_2) {

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

but it looks like Gerd already sent a pull request with my patch for
this from a few weeks back

https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg00543.html

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

