Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hByXg-0005mD-Aq
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2019 05:20:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hByXd-0005kM-D7
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 05:20:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hByXb-0001X1-G0
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 05:20:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56386)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1hByXT-0001DR-BS; Thu, 04 Apr 2019 05:20:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4EDC23078AAF;
	Thu,  4 Apr 2019 09:20:02 +0000 (UTC)
Received: from redhat.com (ovpn-112-55.ams2.redhat.com [10.36.112.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFB0E5C8B9;
	Thu,  4 Apr 2019 09:20:00 +0000 (UTC)
Date: Thu, 4 Apr 2019 10:19:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20190404091957.GL10471@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20190404091725.20595-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190404091725.20595-1-dgilbert@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 04 Apr 2019 09:20:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] configure: fix pam test warning
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
X-List-Received-Date: Thu, 04 Apr 2019 09:20:14 -0000

CC trivial

On Thu, Apr 04, 2019 at 10:17:25AM +0100, Dr. David Alan Gilbert (git) wr=
ote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> The pam test generates a warning on Fedora 29 with -O3 compilation
> because the headers declare that the pam_conversation pointer to
> pam_start must be non-NULL.  Change it to use the same 0 initialised
> structure as we actually use in qauthz.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  configure | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

>=20
> diff --git a/configure b/configure
> index 1c563a7027..73f7ad2be0 100755
> --- a/configure
> +++ b/configure
> @@ -2946,9 +2946,9 @@ if test "$auth_pam" !=3D "no"; then
>  int main(void) {
>     const char *service_name =3D "qemu";
>     const char *user =3D "frank";
> -   const struct pam_conv *pam_conv =3D NULL;
> +   const struct pam_conv pam_conv =3D { 0 };
>     pam_handle_t *pamh =3D NULL;
> -   pam_start(service_name, user, pam_conv, &pamh);
> +   pam_start(service_name, user, &pam_conv, &pamh);
>     return 0;
>  }
>  EOF

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

