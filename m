Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBevj-0002cX-AY
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2019 08:23:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hBevg-0002ax-Ia
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2019 08:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hBevf-0000wi-Fq
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2019 08:23:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35106)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1hBevc-0000qz-H2; Wed, 03 Apr 2019 08:23:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 323397D7D5;
	Wed,  3 Apr 2019 12:23:39 +0000 (UTC)
Received: from redhat.com (ovpn-112-56.ams2.redhat.com [10.36.112.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76BEE18B84;
	Wed,  3 Apr 2019 12:23:31 +0000 (UTC)
Date: Wed, 3 Apr 2019 13:23:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20190403122328.GQ25150@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20190403121620.5228-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190403121620.5228-1-philmd@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 03 Apr 2019 12:23:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] sockets: Fix stringop-truncation warning
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
X-List-Received-Date: Wed, 03 Apr 2019 12:23:45 -0000

On Wed, Apr 03, 2019 at 02:16:20PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> Compiling with clang-8 fails with:
>=20
>     CC      util/qemu-sockets.o
>   util/qemu-sockets.c: In function 'unix_connect_saddr':
>   util/qemu-sockets.c:925:5: error: 'strncpy' specified bound 108 equal=
s destination size [-Werror=3Dstringop-truncation]
>        strncpy(un.sun_path, saddr->path, sizeof(un.sun_path));
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   util/qemu-sockets.c: In function 'unix_listen_saddr':
>   util/qemu-sockets.c:880:5: error: 'strncpy' specified bound 108 equal=
s destination size [-Werror=3Dstringop-truncation]
>        strncpy(un.sun_path, path, sizeof(un.sun_path));
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Per the unix socket manpage:
>=20
>   UNIX(7)
>=20
>   Pathname sockets
>   When binding a socket to a pathname, a few rules should be observed f=
or maximum portability and ease of coding:
>   *  The pathname in sun_path should be null-terminated.
>   *  The length of the pathname, including the terminating null byte, s=
hould not exceed the size of sun_path.
>=20
> Reduce the length of the unix socket path by 1 to hold the NUL byte.

Note it just says "should", not "must" here. IOW, there is no requirement
to NUL terminate and so we should not artifically require that at QEMU
level either. If mgmt apps want to have NUL termination then they can
just pass a shorter path to QEMU to start with.

I've proposed the fix for the warning you mention here:

  https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg07759.html


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

