Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqdkS-0002K6-83
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 07:53:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gqdkM-0002Ie-5q
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 07:53:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gqdkK-0004Bq-7M
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 07:53:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37162)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gqdkE-00048N-BM; Mon, 04 Feb 2019 07:53:03 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68C3289ACC;
	Mon,  4 Feb 2019 12:53:00 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.175])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 254AE6ACE8;
	Mon,  4 Feb 2019 12:52:57 +0000 (UTC)
Date: Mon, 4 Feb 2019 12:52:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20190204125254.GI1905@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <1549282241-23535-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1549282241-23535-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 04 Feb 2019 12:53:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] ui/sdl_keysym: Remove obsolete SDL1.2
 related code
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
X-List-Received-Date: Mon, 04 Feb 2019 12:53:11 -0000

On Mon, Feb 04, 2019 at 01:10:41PM +0100, Thomas Huth wrote:
> sdl_keysym.h has only been included by sdl.c which has recently been
> removed recently with this commit:
>=20
>   0015ca5cbabe0b31d31610ddfaafd90a9e5911a4
>   ("ui: remove support for SDL1.2 in favour of SDL2")
>=20
> So we can drop this header file now completely, too.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: The file is now removed completely.
>=20
>  ui/sdl_keysym.h | 278 ------------------------------------------------=
--------
>  1 file changed, 278 deletions(-)
>  delete mode 100644 ui/sdl_keysym.h

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

