Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1if31f-0005Cn-FU
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 09:31:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1if31b-00057h-Js
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:31:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1if31W-00056m-J5
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:31:31 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22936
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1if31W-00054H-58
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576074688;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BFdNYQIyjvbayKmi//5UM3M2LBqK+D80GsKiRYvVMkY=;
 b=V5b1LSr8RrS0dw0DOi/k0RuIyjEmyDIFF1NY01zsEJFoS7ZmsMCbRvAPwHrkc0C9xFlymQ
 oJ1Xhbm0WXK591cv8ThGCm19zhkBszegfdW3VaHGKF3VLr+PIZfKxHiyIt/MgqPvXVwAB0
 jzlg1jg+tXLGydJFRekMA0Yo1jOArrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-6gxKeg_tPKSff984KcPhaQ-1; Wed, 11 Dec 2019 09:31:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87775113619B;
 Wed, 11 Dec 2019 14:31:26 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7D4E6016C;
 Wed, 11 Dec 2019 14:31:22 +0000 (UTC)
Date: Wed, 11 Dec 2019 14:31:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] build-sys: build vhost-user-gpu only if CONFIG_TOOLS
Message-ID: <20191211143119.GK955178@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <1576074210-52834-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1576074210-52834-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 6gxKeg_tPKSff984KcPhaQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Wed, 11 Dec 2019 14:31:37 -0000

On Wed, Dec 11, 2019 at 03:23:22PM +0100, Paolo Bonzini wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> vhost-user-gpu is always built and installed, but it is not part of the e=
mulator
> proper.  Cut it if --disable-tools is specified.

I don't feel like this is something that people would really
consider part of "tools" either.  This is something you'd
only ever use in conjunction with the emulators, so I don't
think controlling it with --disable-tools is appropriate.

A new --(enable|disable)-vhost-backends  arg looks more
desirable to me. Disabling the system emulators should
automatically imply --disable-vhost-backends by default
too

>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 53823c2..8d921c6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -321,14 +321,10 @@ HELPERS-y =3D
> =20
>  HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) =3D qemu-bridge-h=
elper$(EXESUF)
> =20
> -ifdef CONFIG_LINUX
> -ifdef CONFIG_VIRGL
> -ifdef CONFIG_GBM
> +ifeq ($(CONFIG_LINUX)$(CONFIG_VIRGL)$(CONFIG_GBM)$(CONFIG_TOOLS),yyyy)
>  HELPERS-y +=3D vhost-user-gpu$(EXESUF)
>  vhost-user-json-y +=3D contrib/vhost-user-gpu/50-qemu-gpu.json
>  endif
> -endif
> -endif
> =20
>  # Sphinx does not allow building manuals into the same directory as
>  # the source files, so if we're doing an in-tree QEMU build we must
> --=20
> 1.8.3.1
>=20
>=20

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


