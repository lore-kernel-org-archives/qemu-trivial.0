Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6YQR-0006lD-Ke
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 04:49:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1e6YQL-0006iR-Ra
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 04:49:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1e6YQL-0002Se-5r
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 04:49:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50682)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1e6YQG-0002QC-Q3; Mon, 23 Oct 2017 04:49:24 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75FAF2A0E;
	Mon, 23 Oct 2017 08:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 75FAF2A0E
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=kraxel@redhat.com
Received: from sirius.home.kraxel.org (ovpn-117-195.ams2.redhat.com
	[10.36.117.195])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF8C760462;
	Mon, 23 Oct 2017 08:49:21 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
	by sirius.home.kraxel.org (Postfix) with ESMTP id E5A9C4FD7B;
	Mon, 23 Oct 2017 10:49:15 +0200 (CEST)
Message-ID: <1508748555.16488.4.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>, BALATON
	Zoltan <balaton@eik.bme.hu>, David Gibson <david@gibson.dropbear.id.au>
Date: Mon, 23 Oct 2017 10:49:15 +0200
In-Reply-To: <1508493233-1166-1-git-send-email-thuth@redhat.com>
References: <1508493233-1166-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 23 Oct 2017 08:49:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw/display/sm501: Fix comment in
 sm501_sysbus_class_init()
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
X-List-Received-Date: Mon, 23 Oct 2017 08:49:33 -0000

On Fri, 2017-10-20 at 11:53 +0200, Thomas Huth wrote:
> The "cannot_instantiate_with_device_add_yet" flag has been renamed
> to "user_creatable" a while ago.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
> =C2=A0hw/display/sm501.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 6eddac9..7f18224 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1758,7 +1758,7 @@ static void sm501_sysbus_class_init(ObjectClass
> *klass, void *data)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dc->reset =3D sm501_reset_sysbus;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dc->vmsd =3D &vmstate_sm501_sysbus;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Note: pointer property "chr-state" may=
 remain null, thus
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* no need for dc->cannot_instantiate_wit=
h_device_add_yet =3D
> true;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* no need for dc->user_creatable =3D fal=
se;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> =C2=A0}
> =C2=A0

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


