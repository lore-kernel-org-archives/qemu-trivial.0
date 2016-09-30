Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bq2pC-0000i1-SE
	for mharc-qemu-trivial@gnu.org; Fri, 30 Sep 2016 14:46:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bq2p8-0000eE-Or
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 14:46:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bq2p6-00010a-Mh
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 14:46:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40692)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bq2oy-0000w2-3m; Fri, 30 Sep 2016 14:46:08 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A6BC1E59;
	Fri, 30 Sep 2016 18:46:07 +0000 (UTC)
Received: from [10.3.116.116] (ovpn-116-116.phx2.redhat.com [10.3.116.116])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8UIk6Y3028858; Fri, 30 Sep 2016 14:46:06 -0400
To: Akanksha Srivastava <akanksha.dlf@gmail.com>, qemu-devel@nongnu.org
References: <1475257895-10762-1-git-send-email-akanksha.dlf@gmail.com>
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <9d317b1b-9020-be71-e852-06e2d5021724@redhat.com>
Date: Fri, 30 Sep 2016 13:46:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475257895-10762-1-git-send-email-akanksha.dlf@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Njp7iAC1NUovKuclMDjfCVnKIEA0oGcXf"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 30 Sep 2016 18:46:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] usb: Change *_exitfn return
 type from void to int
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
X-List-Received-Date: Fri, 30 Sep 2016 18:46:21 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Njp7iAC1NUovKuclMDjfCVnKIEA0oGcXf
Content-Type: multipart/mixed; boundary="7ashC9XP3vHdNednUUEiahfQvQAvHXhNo";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Akanksha Srivastava <akanksha.dlf@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Message-ID: <9d317b1b-9020-be71-e852-06e2d5021724@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] usb: Change *_exitfn return type from void
 to int
References: <1475257895-10762-1-git-send-email-akanksha.dlf@gmail.com>
In-Reply-To: <1475257895-10762-1-git-send-email-akanksha.dlf@gmail.com>

--7ashC9XP3vHdNednUUEiahfQvQAvHXhNo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/30/2016 12:51 PM, Akanksha Srivastava wrote:
> The *_exitfn functions cannot fail and should not be
> returning int.
> Suggested as a Bite-sized task
> Signed-off-by: Akanksha Srivastava <akanksha.dlf@gmail.com>
> ---
>  hw/usb/ccid-card-emulated.c | 4 ++--
>  hw/usb/ccid-card-passthru.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
> index 3213f9f..abb2773 100644
> --- a/hw/usb/ccid-card-emulated.c
> +++ b/hw/usb/ccid-card-emulated.c
> @@ -547,7 +547,7 @@ static int emulated_initfn(CCIDCardState *base)
>      return 0;
>  }
> =20
> -static int emulated_exitfn(CCIDCardState *base)
> +static void emulated_exitfn(CCIDCardState *base)
>  {
>      EmulatedState *card =3D EMULATED_CCID_CARD(base);
>      VEvent *vevent =3D vevent_new(VEVENT_LAST, NULL, NULL);
> @@ -564,7 +564,7 @@ static int emulated_exitfn(CCIDCardState *base)
>      qemu_mutex_destroy(&card->handle_apdu_mutex);
>      qemu_mutex_destroy(&card->vreader_mutex);
>      qemu_mutex_destroy(&card->event_list_mutex);
> -    return 0;
> +    return;
>  }

Ending a function that returns void with 'return' is redundant; just
drop the return statement altogether if it is the last thing that can be
reached.

> =20
>  static Property emulated_card_properties[] =3D {
> diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
> index 2eacea7..2bd9cb2 100644
> --- a/hw/usb/ccid-card-passthru.c
> +++ b/hw/usb/ccid-card-passthru.c
> @@ -364,9 +364,9 @@ static int passthru_initfn(CCIDCardState *base)
>      return 0;
>  }
> =20
> -static int passthru_exitfn(CCIDCardState *base)
> +static void passthru_exitfn(CCIDCardState *base)
>  {
> -    return 0;
> +    return;
>  }

And again.  Since the callback does nothing, do you even need it to
exist, or can you do further cleanups that allow the callback to be
optional if it would otherwise be a no-op?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--7ashC9XP3vHdNednUUEiahfQvQAvHXhNo--

--Njp7iAC1NUovKuclMDjfCVnKIEA0oGcXf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX7rLuAAoJEKeha0olJ0NqNwIH/RoCDwO9AwmWjWd5bDjwn9kb
gNsUf/AhLfiCJUQhzzTqex2WTkpnjZLgrxwh0j/Lao/LAqWhGZLL8BPpU64aHkR7
xS4AvjgThAKs4e8LPihloaA9mOxuv/+DtZ+0sRIjDMfL+2TxfyEZHJXPXETjXSc2
++7xTzguRUgIoKzpUHy3UlBpG7USDJeRUqH6Bxjo72cDaLvlgH+46ohfOVecIeoT
UBiDOeJnIZHc7IhTCDZRkMrU6u5dlgOjt5qaBgXJcURCdre9Ijn+YzgzngteKgj1
3NbhhezQJj7QdGlcb9lhownX4tcYMwKdRJ+lsFMP5hSMgX6FTrSFEB7hQjS3E+Y=
=jfx/
-----END PGP SIGNATURE-----

--Njp7iAC1NUovKuclMDjfCVnKIEA0oGcXf--

