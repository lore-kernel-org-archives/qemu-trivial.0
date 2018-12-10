Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWPAU-0006Lu-2V
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2018 12:16:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gWPAR-0006KT-Me
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2018 12:16:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gWPAQ-0002k5-UX
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2018 12:16:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36894)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gWPAM-0002iF-Ie; Mon, 10 Dec 2018 12:16:22 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B481E308A959;
	Mon, 10 Dec 2018 17:16:21 +0000 (UTC)
Received: from redhat.com (ovpn-112-59.ams2.redhat.com [10.36.112.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 383CC105959A;
	Mon, 10 Dec 2018 17:16:19 +0000 (UTC)
Date: Mon, 10 Dec 2018 17:16:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20181210171617.GR20272@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20181207170733.129532-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181207170733.129532-1-eblake@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 10 Dec 2018 17:16:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] maint: Grammar fix to mailmap
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
X-List-Received-Date: Mon, 10 Dec 2018 17:16:28 -0000

On Fri, Dec 07, 2018 at 11:07:33AM -0600, Eric Blake wrote:
> Make the sentence read better.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  .mailmap | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


>=20
> diff --git a/.mailmap b/.mailmap
> index ed8faa57192..b8e08297c90 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -34,6 +34,6 @@ Justin Terry (VM) <juterry@microsoft.com> Justin Terr=
y (VM) via Qemu-devel <qemu
>=20
>=20
>  # Also list preferred name forms where people have changed their
> -# git author config, or having utf8/latin1 encoding issues.
> +# git author config, or had utf8/latin1 encoding issues.
>  Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>  Reimar D=C3=B6ffinger <Reimar.Doeffinger@gmx.de>
> --=20
> 2.17.2
>=20

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

