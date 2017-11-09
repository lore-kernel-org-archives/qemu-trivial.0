Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCp2q-0002sM-W9
	for mharc-qemu-trivial@gnu.org; Thu, 09 Nov 2017 10:47:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eCp2o-0002qT-SG
	for qemu-trivial@nongnu.org; Thu, 09 Nov 2017 10:47:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1eCp2o-0002N7-22
	for qemu-trivial@nongnu.org; Thu, 09 Nov 2017 10:47:06 -0500
Received: from mail-vk0-x241.google.com ([2607:f8b0:400c:c05::241]:54606)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1eCp2m-0002MJ-AJ; Thu, 09 Nov 2017 10:47:04 -0500
Received: by mail-vk0-x241.google.com with SMTP id b18so1921536vkd.11;
	Thu, 09 Nov 2017 07:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZHkpXSfLN436bcutddkYibfSt4Jspg5PUboF2+Gyk8o=;
	b=GhI3mk2EQk3MHPRaUsF3BSHPmOxeiJ0oTcl0An5G/uwLG2zo4OY/ymCw+poxhhz2PL
	IpAyFHnVEnKk3X3wuV4Gj0/Y+4jrZ1hgxsH5og5yVATin6LTXIHpYBfDZsUmAMKy42Co
	+ZMr91Od/PDK7UFKJsa3hKJ9Th9MaNaX4nzPV92wcVAohawR3HUR18CMwm+/SUi54vaE
	q18883jQxXpJD68qDdaiy7z/5uV+Fc81mINefW2pPYPN3uWOyFj1JEdQOanr7nImoymQ
	brbHo9kTMTcnL7yMLGC9/6vzQIjaik143qYP0Kk6SBgXoG+FFtSqfAXPdLPZHLE3dojr
	vtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZHkpXSfLN436bcutddkYibfSt4Jspg5PUboF2+Gyk8o=;
	b=RY6IUbV/ZE9RL8xMoMZ0ebNwIqE0hVm1qVlsW6CTlBhymA260/M641ioTzr1g9Pqqc
	zxO6TW71ujbebqCvKE/C83SiIUAQiN6WDYziiNnh983CLq74xo9KYu4j8woBYFi+UJHP
	zPnGaMr4T19fsV/70jvn6nEKih82LZVCJKeu1RQVi4sfINkiFy8Dbdk9iN3EbpArif/p
	coP65dTKIgUnCQqy8kddZb2Etq7hpTf1uWWPQTYnzzNMnrmlAFX8YKi0RCl9roFSBjo2
	Vw3yz8djj3j8zEVwScobK7LqXJq7v+GEFZ65kxiKjKeiJJM2JgcSqnjW5pVMiwIn6nXL
	/vOw==
X-Gm-Message-State: AJaThX7T6IfPHW1C/iDVSh+RcgK6LLk2c6c2eiLJxEvTjIfe2QCHK07K
	CDyYFEC7XsqmQbNdl6nHjtQKrR3hv719j7wVcZY=
X-Google-Smtp-Source: AGs4zMamjJ/5FO8gJUHn3b8usIaFOa3WcOUFZSTz0bjJJZQPFS/I16wzniWk9CtzILATLYoZwkx+w1bs7jVdCkCqtZ0=
X-Received: by 10.31.1.137 with SMTP id 131mr714072vkb.50.1510242423565; Thu,
	09 Nov 2017 07:47:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.27.129 with HTTP; Thu, 9 Nov 2017 07:47:02 -0800 (PST)
In-Reply-To: <20171109121903.24510-1-googuy@gmail.com>
References: <20171109121903.24510-1-googuy@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 9 Nov 2017 16:47:02 +0100
Message-ID: <CAJ+F1CKtoqXWP8ORZd52b3EKv=BjFX5DO-xksTkkd_ZNG9fhZQ@mail.gmail.com>
To: Vicente Jimenez Aguilar <googuy@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add missing parameters to
 mon option documentation
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
X-List-Received-Date: Thu, 09 Nov 2017 15:47:07 -0000

Hi

On Thu, Nov 9, 2017 at 1:19 PM, Vicente Jimenez Aguilar
<googuy@gmail.com> wrote:
> Documentation missed 'mon' option's 'pretty' and 'default' parameters
>
> Signed-off-by: Vicente Jimenez Aguilar <googuy@gmail.com>
> ---
>  qemu-options.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 3728e9b4dd..72cf48a8e5 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3477,9 +3477,9 @@ Like -qmp but uses pretty JSON formatting.
>  ETEXI
>
>  DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
> -    "-mon [chardev=3D]name[,mode=3Dreadline|control]\n", QEMU_ARCH_ALL)
> +    "-mon [chardev=3D]name[,mode=3Dreadline|control][,pretty[=3Don|off]]=
[,default[=3Don|off]]\n", QEMU_ARCH_ALL)
>  STEXI
> -@item -mon [chardev=3D]name[,mode=3Dreadline|control]
> +@item -mon [chardev=3D]name[,mode=3Dreadline|control][,pretty[=3Don|off]=
][,default[=3Don|off]]

"default" is deprecated since commit 06ac27f (2.4.0). It does nothing
anymore, so should probably not be documented.

"pretty" was added in commit 39eaab9ac2a82f. You write some
documentation for it based on the commit message perhaps?

thanks

>  @findex -mon
>  Setup monitor on chardev @var{name}.
>  ETEXI
> --
> 2.14.1
>
>



--=20
Marc-Andr=C3=A9 Lureau

