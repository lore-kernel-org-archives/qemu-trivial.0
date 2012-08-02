Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwxEz-0000zy-EW
	for mharc-qemu-trivial@gnu.org; Thu, 02 Aug 2012 11:23:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SwxEw-0000pe-5H
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 11:23:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SwxEr-0004pI-D0
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 11:23:06 -0400
Received: from cantor2.suse.de ([195.135.220.15]:43307 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SwxEi-0004oL-VW; Thu, 02 Aug 2012 11:22:53 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id C64B8A341E;
	Thu,  2 Aug 2012 17:22:51 +0200 (CEST)
Message-ID: <501A9B48.1040709@suse.de>
Date: Thu, 02 Aug 2012 17:22:48 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1343896830-3503-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1343896830-3503-1-git-send-email-hpoussin@reactos.org>
X-Enigmail-Version: 1.5a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] qom: add missing
 'const' in documentation sample
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 15:23:07 -0000

Am 02.08.2012 10:40, schrieb Herv=C3=A9 Poussineau:
>=20
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

Acked-by: Andreas F=C3=A4rber <afaerber@suse.de>

/-F

> ---
>  include/qemu/object.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/qemu/object.h b/include/qemu/object.h
> index 8b17776..e0d326f 100644
> --- a/include/qemu/object.h
> +++ b/include/qemu/object.h
> @@ -65,7 +65,7 @@ typedef struct InterfaceInfo InterfaceInfo;
>   *     int reg0, reg1, reg2;
>   * } MyDevice;
>   *
> - * static TypeInfo my_device_info =3D {
> + * static const TypeInfo my_device_info =3D {
>   *     .name =3D TYPE_MY_DEVICE,
>   *     .parent =3D TYPE_DEVICE,
>   *     .instance_size =3D sizeof(MyDevice),

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

