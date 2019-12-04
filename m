Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1icTfM-0002CS-TA
	for mharc-qemu-trivial@gnu.org; Wed, 04 Dec 2019 07:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51479)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1icTfG-00027x-Ep
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 07:21:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1icTfC-0000Ls-OI
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 07:21:51 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32897
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1icTfC-0000Bh-F0
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 07:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575462108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3OnM5eaSxNefQQlb69I5DoqeGRL34Usqzt0Ta6j9ao=;
 b=Zf5Wq74AvTgIBBw792efu4hCYgKTQ+mgs5Hn1TYJj2mG6oVzFqxRNhQpFPfuFeXX7Ibys5
 Zj18HY9/Vo5ayYX8zX8ncNpeDRoQAADAnS65tgzZhsKlNvlWHFkqNCDGN9WX58arAo0z95
 vjXKNhWg6GhdrO+OMKkHr8lllDBNszA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-uw02SxsnNk6Lj4z_w0su_A-1; Wed, 04 Dec 2019 07:21:45 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DA5C1005300;
 Wed,  4 Dec 2019 12:21:44 +0000 (UTC)
Received: from work-vm (ovpn-117-217.ams2.redhat.com [10.36.117.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04C711001B0B;
 Wed,  4 Dec 2019 12:21:42 +0000 (UTC)
Date: Wed, 4 Dec 2019 12:21:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Han Han <hhan@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu
Subject: Re: [PATCH] Revert "qemu-options.hx: Update for reboot-timeout
 parameter"
Message-ID: <20191204122140.GI3325@work-vm>
References: <20191204085628.2892-1-hhan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191204085628.2892-1-hhan@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: uw02SxsnNk6Lj4z_w0su_A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
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
X-List-Received-Date: Wed, 04 Dec 2019 12:21:57 -0000

* Han Han (hhan@redhat.com) wrote:
> This reverts commit bbd9e6985ff342cbe15b9cb7eb30e842796fbbe8.

Patchew spotted you're missing the signed-off-by; please send one.

Dave

> In 20a1922032 we allowed reboot-timeout=3D-1 again, so update the doc
> accordingly.
> ---
>  qemu-options.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 65c9473b73..e14d88e9b2 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -327,8 +327,8 @@ format(true color). The resolution should be supporte=
d by the SVGA mode, so
>  the recommended is 320x240, 640x480, 800x640.
> =20
>  A timeout could be passed to bios, guest will pause for @var{rb_timeout}=
 ms
> -when boot failed, then reboot. If @option{reboot-timeout} is not set,
> -guest will not reboot by default. Currently Seabios for X86
> +when boot failed, then reboot. If @var{rb_timeout} is '-1', guest will n=
ot
> +reboot, qemu passes '-1' to bios by default. Currently Seabios for X86
>  system support it.
> =20
>  Do strict boot via @option{strict=3Don} as far as firmware/BIOS
> --=20
> 2.24.0.rc1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


