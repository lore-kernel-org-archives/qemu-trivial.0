Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT1Yj-0002rr-GJ
	for mharc-qemu-trivial@gnu.org; Fri, 08 Nov 2019 05:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50179)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iT1Yh-0002rX-6y
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 05:32:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iT1Yf-0006xX-V2
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 05:32:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42796
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iT1Yf-0006xJ-R1
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 05:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573209121;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFHSXNJC5NT0kZ6nMuiwYQt36iFgQnx1dgvcXbrxwBA=;
 b=KZnAcwTBC91RRwl649OOmP5w0uv4PSTWneMPqqY7MIZJldTSB6wIvx32FcfATUv9v+wEfx
 rsAHfDnAW9/KHERyhn9hZ9GJElr7fZZgddUg4Fu3Ft8lRA7VqPz2ID+2MfQ69bBZ8XGgbx
 KOnn0RblniIj9hj0bZUapTwCPi7xo9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-SbahawIxOk229rDabHf5Dw-1; Fri, 08 Nov 2019 05:31:59 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 241BB800C72;
 Fri,  8 Nov 2019 10:31:58 +0000 (UTC)
Received: from redhat.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7420D6084E;
 Fri,  8 Nov 2019 10:31:50 +0000 (UTC)
Date: Fri, 8 Nov 2019 10:31:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH] configure: Check bzip2 is available
Message-ID: <20191108103147.GC182396@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20191108102805.8258-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191108102805.8258-1-philmd@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: SbahawIxOk229rDabHf5Dw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Fri, 08 Nov 2019 10:32:04 -0000

On Fri, Nov 08, 2019 at 11:28:05AM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> The bzip2 tool is not included in default installations.
> On freshly installed systems, ./configure succeeds but 'make'
> might fail later:
>=20
>     BUNZIP2 pc-bios/edk2-i386-secure-code.fd.bz2
>   /bin/sh: bzip2: command not found
>   make: *** [Makefile:305: pc-bios/edk2-i386-secure-code.fd] Error 127
>   make: *** Deleting file 'pc-bios/edk2-i386-secure-code.fd'
>   make: *** Waiting for unfinished jobs....
>=20
> Add a check in ./configure to warn the user if bzip2 is missing.
>=20
> Fixes: 536d2173b2b
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  configure | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/configure b/configure
> index efe165edf9..9957e913e8 100755
> --- a/configure
> +++ b/configure
> @@ -1851,6 +1851,13 @@ python_version=3D$($python -c 'import sys; print("=
%d.%d.%d" % (sys.version_info[0]
>  # Suppress writing compiled files
>  python=3D"$python -B"
> =20
> +# Some firmware binaries are compressed with bzip2
> +if has bzip2; then
> +  :
> +else
> +  error_exit "bzip2 program not found. Please install it"
> +fi

Nitpick, I'd phrase this as

   "The bzip2 program is required for building QEMU"

Either way though

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


