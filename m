Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dziVp-0006ko-Vr
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2017 08:10:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dziVn-0006jX-P2
	for qemu-trivial@nongnu.org; Wed, 04 Oct 2017 08:10:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dziVi-0007fo-6c
	for qemu-trivial@nongnu.org; Wed, 04 Oct 2017 08:10:51 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:56752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dziVb-0007aY-4W; Wed, 04 Oct 2017 08:10:39 -0400
Received: by mail-oi0-x243.google.com with SMTP id v9so6971462oif.13;
	Wed, 04 Oct 2017 05:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Vqw3iTDVsKrO9Xl0p7Fvz1U9frjY24i7a0pT4f/uZKM=;
	b=sxCGbvSQvJyoboCHJYmFVpAaIoQg5fWvkALsfR2QmTFzrYJ86TQlHgAqQfVtpF1xJe
	pk8usQUTA9JGn5bEamb+AvX1SrfUmqt4WiKVDLufKInSxc/Kj4XqX5Ub3thZ5OSoG36M
	vz7ZCVqrQhZkGEFhXA1WrEAE5+3LqgMwthMLYCv07Db8xHmgxviEgY7CHRTHiJ37adRw
	eCN7j+b0f37UHuMaphSmdQ2oJ5TXnfpiJCRHFnAsCsJMNod6OxUeLahaAYluarWVyGaL
	IwvAxC0mLrs5uWbN22RNiB+M5uMnd03MnY4YDIsGmuBLNe0HQRhJMyPszFoEI1Xjgte7
	epoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Vqw3iTDVsKrO9Xl0p7Fvz1U9frjY24i7a0pT4f/uZKM=;
	b=iYoetpniI9SWnmabLVzl1LsqDkl3hdiI1eFY+gqF2Sw33p7g2bGBkDevqirlQ60MOY
	WRBMc0HPxW1FLHolIX/CJJ4ccUOPNyASOsVOCtA5iS+9+F3psCyx7XGWdLZds1bW4rLy
	dD7VOHs5HMp13QpvcCzbC/83ak//gMka9WQBD/Ef9xWVQHo5d4zxB633Yj+J2ridRclj
	qdvH8YaTZEOMMh97jJ5cHupHbnxXb4vX+bxfXj1m23+xaKc+7kU9zEdaEciefRRmb31M
	EIochjzLOb59tmxVbHiGLEfNS+nhpB8Mk+/wfMP8sF9AKoRhbpbmjwH6cu6u0AF3zuhk
	rICw==
X-Gm-Message-State: AMCzsaUUxrsyzakVPD5vNc30aq72SGN1IpvkEeFnlk8lpxOQqpxwTQaC
	hL3DO+g/0FMWdQrOW4QwwOzF/uQ5MwKhJJAzZ6o=
X-Google-Smtp-Source: AOwi7QATkRUly2cglKtGFMzGHjCvHJV265Dbrf595y+Z20e2oWCAioUFeznfSsX4iBsOI9NRT3XIWbXCg2wZiKiuXhQ=
X-Received: by 10.202.73.14 with SMTP id w14mr3221977oia.258.1507119038396;
	Wed, 04 Oct 2017 05:10:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.17.154 with HTTP; Wed, 4 Oct 2017 05:10:36 -0700 (PDT)
In-Reply-To: <20171002152552.27999-28-armbru@redhat.com>
References: <20171002152552.27999-1-armbru@redhat.com>
	<20171002152552.27999-28-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 4 Oct 2017 14:10:36 +0200
Message-ID: <CAJ+F1CLManx1hv5vEuHC+J6R-GLJiUC2XWOti0nwakBDDAoEhw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>, 
	qemu trival <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC PATCH 27/32] os-posix: Drop
 misleading comment
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
X-List-Received-Date: Wed, 04 Oct 2017 12:10:52 -0000

CC qemu-trivial

On Mon, Oct 2, 2017 at 5:25 PM, Markus Armbruster <armbru@redhat.com> wrote=
:
> Comments explaining why we include a header tend to go bad.  This
> one's almost comical: not only doesn't qemu-options.hx use
> MAP_POPULATE anymore (since commit ef36fa1, v2.0.0, 2013), even the
> include it applies to got moved away in commit 02d0e09 (v2.7.0).
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  os-posix.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/os-posix.c b/os-posix.c
> index 92e9d85215..b9c2343b1e 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -25,7 +25,6 @@
>
>  #include "qemu/osdep.h"
>  #include <sys/wait.h>
> -/*needed for MAP_POPULATE before including qemu-options.h */
>  #include <pwd.h>
>  #include <grp.h>
>  #include <libgen.h>
> --
> 2.13.6
>
>



--=20
Marc-Andr=C3=A9 Lureau

