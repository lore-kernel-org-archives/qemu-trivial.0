Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT25M-0008Sw-8R
	for mharc-qemu-trivial@gnu.org; Fri, 08 Nov 2019 06:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57625)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iT25I-0008SF-TV
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:05:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iT25G-0006Fl-Ib
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:05:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44248
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iT25F-00066s-9m
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573211133;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QKCahovK7Kq4ddTNQvVxg9K2BLVVX/HgM3FMJOLUTM=;
 b=W/yQ+uMLI79eZFRSZf62tnknJSro803+J65eVWZCsGH9vLODr0m3DFtHSiBv2VM0kPWVeN
 x4keRC6rkak/2itH2t2xTBsfdquS0dx3iRZWmAtv1bV17s92eMb0MZOoSU8/NrsNDPH/LJ
 9C/ENgbq778b+qB4dcM/jTePDwf696o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-ra0git6rOjmKpPaQkqThXw-1; Fri, 08 Nov 2019 06:05:30 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1ED8107ACC3;
 Fri,  8 Nov 2019 11:05:29 +0000 (UTC)
Received: from redhat.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6115D6B7;
 Fri,  8 Nov 2019 11:05:22 +0000 (UTC)
Date: Fri, 8 Nov 2019 11:05:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH] configure: Check bzip2 is available
Message-ID: <20191108110520.GG182396@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20191108102805.8258-1-philmd@redhat.com>
 <862eb773-609d-4250-b46b-d922fc5a86a7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <862eb773-609d-4250-b46b-d922fc5a86a7@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ra0git6rOjmKpPaQkqThXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 08 Nov 2019 11:05:46 -0000

On Fri, Nov 08, 2019 at 12:01:16PM +0100, Laszlo Ersek wrote:
> On 11/08/19 11:28, Philippe Mathieu-Daud=C3=A9 wrote:
> > The bzip2 tool is not included in default installations.
> > On freshly installed systems, ./configure succeeds but 'make'
> > might fail later:
> >=20
> >     BUNZIP2 pc-bios/edk2-i386-secure-code.fd.bz2
> >   /bin/sh: bzip2: command not found
> >   make: *** [Makefile:305: pc-bios/edk2-i386-secure-code.fd] Error 127
> >   make: *** Deleting file 'pc-bios/edk2-i386-secure-code.fd'
> >   make: *** Waiting for unfinished jobs....
> >=20
> > Add a check in ./configure to warn the user if bzip2 is missing.
>=20
> We've come full circle. Let me explain:
>=20
> >=20
> > Fixes: 536d2173b2b
>=20
> So this makes me kinda grumpy. If you look at the v3 posting of the patch=
 that would later become commit 536d2173b2b:
>=20
>   http://mid.mail-archive.com/20190321113408.19929-8-lersek@redhat.com
>=20
> you see the following note in the changelog:
>=20
>     - compress FD files with bzip2 rather than xz, so that decompression =
at
>       "make install" time succeed on older build OSes too [Peter]
>=20
> So I couldn't use xz because that was "too new" for some build OSes, but =
now we also can't take bzip2 for granted because that's "too old" for some =
other build OSes? This is ridiculous.

We're not saying bzip2 is too old / missing from the OS. Every OS we care
about has bzip2. The problem is that a minimal installation migt not have
installed it. This kind of problem is increasingly common with use of
minimal container images for example. So we're just ensuring we validate
that what we want is actuall present.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


