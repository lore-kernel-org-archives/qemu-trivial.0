Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRg03-0008C4-Jg
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 11:14:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gRg01-0008Ax-FY
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 11:14:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gRg00-0000UQ-Ox
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 11:14:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gRfzw-0000RE-M0; Tue, 27 Nov 2018 11:14:04 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD47C308AA0F;
	Tue, 27 Nov 2018 16:14:03 +0000 (UTC)
Received: from redhat.com (ovpn-112-58.ams2.redhat.com [10.36.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 039D55C559;
	Tue, 27 Nov 2018 16:13:55 +0000 (UTC)
Date: Tue, 27 Nov 2018 16:13:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20181127161352.GK18381@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-21-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181125205000.10324-21-philmd@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 27 Nov 2018 16:14:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-3.1 20/25] MAINTAINERS: Add missing
 test entries to the Cryptography section
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
X-List-Received-Date: Tue, 27 Nov 2018 16:14:10 -0000

On Sun, Nov 25, 2018 at 09:49:55PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c73dde10a5..26727c1561 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1978,6 +1978,8 @@ F: crypto/
>  F: include/crypto/
>  F: tests/test-crypto-*
>  F: tests/benchmark-crypto-*
> +F: tests/crypto-tls-*
> +F: tests/pkix_asn1_tab.c
>  F: qemu.sasl

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

