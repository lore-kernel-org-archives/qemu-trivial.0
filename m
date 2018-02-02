Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ehcmK-0003vL-1A
	for mharc-qemu-trivial@gnu.org; Fri, 02 Feb 2018 09:57:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1ehcmH-0003sh-TA
	for qemu-trivial@nongnu.org; Fri, 02 Feb 2018 09:57:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1ehcmG-0001fH-Qh
	for qemu-trivial@nongnu.org; Fri, 02 Feb 2018 09:57:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40402)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1ehcmA-0001YV-Qz; Fri, 02 Feb 2018 09:57:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 503AEC03674D;
	Fri,  2 Feb 2018 13:37:32 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-169.brq.redhat.com
	[10.40.204.169])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47D0E77D48;
	Fri,  2 Feb 2018 13:37:30 +0000 (UTC)
To: Shravan Rajinikanth <shravan2x@utexas.edu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <be898714-bffb-7fdf-0b91-e3c276559fc7@redhat.com>
Date: Fri, 2 Feb 2018 14:37:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="eZXqLa86VdqzCXcM2PheLQD9sCCVMmimv"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 02 Feb 2018 13:37:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-img: Fixed grammatical
 error in dump_human_image_check
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
X-List-Received-Date: Fri, 02 Feb 2018 14:57:23 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eZXqLa86VdqzCXcM2PheLQD9sCCVMmimv
Content-Type: multipart/mixed; boundary="mWI70zzteN82vShgTZrN8MAeHRuZKgsdX";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: Shravan Rajinikanth <shravan2x@utexas.edu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <be898714-bffb-7fdf-0b91-e3c276559fc7@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qemu-img: Fixed grammatical error in
 dump_human_image_check
References: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
In-Reply-To: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>

--mWI70zzteN82vShgTZrN8MAeHRuZKgsdX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2017-12-02 23:37, Shravan Rajinikanth wrote:
> Signed-off-by: Shravan Rajinikanth <shravan2x@utexas.edu>
> ---
>  qemu-img.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/qemu-img.c b/qemu-img.c
> index 68b375f..bea9268 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -580,7 +580,7 @@ static void dump_human_image_check(ImageCheck *chec=
k, bool quiet)
>          if (check->leaks) {
>              qprintf(quiet,
>                      "\n%" PRId64 " leaked clusters were found on the i=
mage.\n"
> -                    "This means waste of disk space, but no harm to da=
ta.\n",
> +                    "This means disk space is wasted, but data is safe=
=2E\n",
>                      check->leaks);
>          }

Sorry, somehow I never applied this.  (Maybe I thought it would go
through trivial...)

Applied to my block tree:

https://github.com/XanClic/qemu/commits/block

Max


--mWI70zzteN82vShgTZrN8MAeHRuZKgsdX--

--eZXqLa86VdqzCXcM2PheLQD9sCCVMmimv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFGBAEBCAAwFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlp0aZkSHG1yZWl0ekBy
ZWRoYXQuY29tAAoJEPQH2wBh1c9AvFAH/3sRKKws4yVA23nAYpoIbrlKnhq4EKTs
KkMNiAWg9iOE5ZIJUgOxsp7TkWCqG1vbbpptP28Nu9OpbzW8KqqsikKtzZeHcxxf
ywCVGQwy7h4ixhDypzHylxPjjvNjvjPzj9Dx9FHu/zH42hto3NdVGw+6nn4RdOxF
nmcIDia+0tJUDGzjP+sLBn/n7RrokZesuw7gRq2LW5fmAplXjyuQet1VTw9P8WsK
Up9fWsngIr6XlBIevTNcYuZrulseoSd1niwackz55T6BYbLHNUE+655krsnFKCtz
G+/0JkhpNomA4WO21WeCbVxcIkUndCx2Ff+oyOJODa9jjETXc6vRzyY=
=6Ao1
-----END PGP SIGNATURE-----

--eZXqLa86VdqzCXcM2PheLQD9sCCVMmimv--

