Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZvLC-0007wc-Pf
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 04:37:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1dZvLA-0007up-De
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 04:37:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1dZvL9-0003jK-K5
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 04:37:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52292)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1dZvL7-0003gK-2r; Tue, 25 Jul 2017 04:37:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07CF461E7C;
	Tue, 25 Jul 2017 08:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 07CF461E7C
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=berrange@redhat.com
Received: from redhat.com (ovpn-117-158.ams2.redhat.com [10.36.117.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55C0860602;
	Tue, 25 Jul 2017 08:37:06 +0000 (UTC)
Date: Tue, 25 Jul 2017 09:37:01 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Message-ID: <20170725083701.GD26394@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-10-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170724182751.18261-10-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 25 Jul 2017 08:37:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 09/35] ui/vnc: fix
 leak of SocketAddress **
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
X-List-Received-Date: Tue, 25 Jul 2017 08:37:17 -0000

On Mon, Jul 24, 2017 at 03:27:25PM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
> Extract the (correct) cleaning code as a new function vnc_free_addresse=
s() then
> use it to remove the memory leaks.
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  ui/vnc.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

