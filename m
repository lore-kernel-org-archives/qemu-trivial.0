Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBfwN-00033f-ED
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2019 09:28:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1hBfwL-00033D-4d
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2019 09:28:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1hBfwK-0002wm-6u
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2019 09:28:29 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34111)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1hBfwJ-0002vu-Tz
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2019 09:28:28 -0400
Received: by mail-wr1-f67.google.com with SMTP id p10so21391763wrq.1
	for <qemu-trivial@nongnu.org>; Wed, 03 Apr 2019 06:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lpreuDSoBZS6Obue/dZIe4DhGyEC/AexRLPyWuz+GZ8=;
	b=LadFwFbLYXqOUDAKh9CJkxzenTe7R5ZVR5PnFPig89aQqBx6kZcuGA7nbK9c/MqjLY
	Zo4bu6bK6JUuJynEfdFncZc0k4l0WXPbnoHytBOt11dqdggxd4j2VQI19UxYPm2GYnYJ
	jodB/XTxDUuySI6tGhiz2pr5ELsXMn2xI8IGuMJSmpKU2ix6+LPKzKzEqbYpbUrD7Ui3
	pXBLTs7WQI731A0qDbiXQPhpwauUN224zkrhmVAIW5V2y11QYzx+WWWAoRnzP5z970jU
	F5YY1Ukn49QYOScOJhMXa/g1ST5/uXETaE81QD01NHqr3zBn8QZp1g4IQ4ohxnnbcCHB
	9/ng==
X-Gm-Message-State: APjAAAUujWQ7vgyIBovJeVf9ghJnsTmwOZmU70/aeuThTKPO/BL6PlKO
	X7aZugg65Ct8rx2QKTJM3Gm/xnUUMZtdIaBK2NMxRA==
X-Google-Smtp-Source: APXvYqws2APGIAJSyoJEBFhXLtrqnXsKzsobny+NSI3yj7ZsrMYNPhyIjBI3mQhHXm2AGQ8ZIinzq/YPKSDdo2GHvlo=
X-Received: by 2002:a5d:494c:: with SMTP id r12mr38047941wrs.250.1554298105825;
	Wed, 03 Apr 2019 06:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190403121620.5228-1-philmd@redhat.com>
	<20190403122328.GQ25150@redhat.com>
In-Reply-To: <20190403122328.GQ25150@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Wed, 3 Apr 2019 15:28:14 +0200
Message-ID: <CAP+75-UwjDEciweEeAdxYUw_gZFjjSxXkyBX_oq_RCE+Axm4Hg@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
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
X-List-Received-Date: Wed, 03 Apr 2019 13:28:30 -0000

On Wed, Apr 3, 2019 at 2:23 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> On Wed, Apr 03, 2019 at 02:16:20PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Compiling with clang-8 fails with:
> >
> >     CC      util/qemu-sockets.o
> >   util/qemu-sockets.c: In function 'unix_connect_saddr':
> >   util/qemu-sockets.c:925:5: error: 'strncpy' specified bound 108 equal=
s destination size [-Werror=3Dstringop-truncation]
> >        strncpy(un.sun_path, saddr->path, sizeof(un.sun_path));
> >        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   util/qemu-sockets.c: In function 'unix_listen_saddr':
> >   util/qemu-sockets.c:880:5: error: 'strncpy' specified bound 108 equal=
s destination size [-Werror=3Dstringop-truncation]
> >        strncpy(un.sun_path, path, sizeof(un.sun_path));
> >        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Per the unix socket manpage:
> >
> >   UNIX(7)
> >
> >   Pathname sockets
> >   When binding a socket to a pathname, a few rules should be observed f=
or maximum portability and ease of coding:
> >   *  The pathname in sun_path should be null-terminated.
> >   *  The length of the pathname, including the terminating null byte, s=
hould not exceed the size of sun_path.
> >
> > Reduce the length of the unix socket path by 1 to hold the NUL byte.
>
> Note it just says "should", not "must" here. IOW, there is no requirement
> to NUL terminate and so we should not artifically require that at QEMU
> level either. If mgmt apps want to have NUL termination then they can
> just pass a shorter path to QEMU to start with.
>
> I've proposed the fix for the warning you mention here:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg07759.html

Oh I missed it, thanks for pointing it.

Regards,

Phil.

