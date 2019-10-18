Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLS1z-00069a-S9
	for mharc-qemu-trivial@gnu.org; Fri, 18 Oct 2019 09:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48167)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iLS1x-00066u-9G
 for qemu-trivial@nongnu.org; Fri, 18 Oct 2019 09:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iLS1w-0002nU-28
 for qemu-trivial@nongnu.org; Fri, 18 Oct 2019 09:10:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44120)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1iLS1s-0002jg-HG; Fri, 18 Oct 2019 09:10:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B2BF084A5;
 Fri, 18 Oct 2019 13:10:51 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1338560A97;
 Fri, 18 Oct 2019 13:10:49 +0000 (UTC)
Date: Fri, 18 Oct 2019 14:10:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Kamil Rytarowski <kamil@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, eblake@redhat.com
Subject: Re: [PATCH v2] Do not use %m in common code to print error messages
Message-ID: <20191018131046.GG28271@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20191018130716.25438-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191018130716.25438-1-thuth@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 18 Oct 2019 13:10:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2019 13:10:58 -0000

On Fri, Oct 18, 2019 at 03:07:16PM +0200, Thomas Huth wrote:
> The %m format specifier is an extension from glibc - and when compiling
> QEMU for NetBSD, the compiler correctly complains, e.g.:
>=20
> /home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c: In function 'sigfd_ha=
ndler':
> /home/qemu/qemu-test.ELjfrQ/src/util/main-loop.c:64:13: warning: %m is =
only
>  allowed in syslog(3) like functions [-Wformat=3D]
>              printf("read from sigfd returned %zd: %m\n", len);
>              ^
> Let's use g_strerror() here instead, which is an easy-to-use wrapper
> around the thread-safe strerror_r() function.
>=20
> While we're at it, also convert the "printf()" in main-loop.c into
> the preferred "error_report()".
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Do not try to g_free() the strings
>=20
>  hw/misc/tmp421.c | 4 ++--
>  util/main-loop.c | 3 ++-
>  util/systemd.c   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

