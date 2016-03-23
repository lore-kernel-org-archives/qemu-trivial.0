Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ailmI-0000ll-2T
	for mharc-qemu-trivial@gnu.org; Wed, 23 Mar 2016 12:37:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ailmE-0000hw-Ti
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 12:36:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ailmA-0004Fr-Tg
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 12:36:58 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:35637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ailm9-0004Fb-Mk
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 12:36:54 -0400
Received: by mail-vk0-x231.google.com with SMTP id e6so26425708vkh.2
	for <qemu-trivial@nongnu.org>; Wed, 23 Mar 2016 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ASQgjwbhAs4B6oHm9p1MI8+k3yObAYfl0e/ZV2Bxe+U=;
	b=UlNBd0W05dqHHU3OltQMXoWm0AzX2DSvvaIK1qZ8E6YW8THOuE6KPAEVW+B2mfh28o
	nYfuJnwRdk4wqQqq0zDAp9AdtmZnZwLQPVF05kuDeEIwKov6zhcAOBZQ1qGA4QUTDxAW
	jzJC8wrAXdR5dBw0hRrQvH5D3vrlrFVMhJj94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ASQgjwbhAs4B6oHm9p1MI8+k3yObAYfl0e/ZV2Bxe+U=;
	b=IfdmoHNNM3BJG6geriKH06gGHKCpnyUQxH4f9NHJHGoai+XlgJWqf0zOX5tPw4u3IO
	/bO/dn1iALZNhUcrrZp4idbtEeU5tw2oaR+HgSWT9SOID7oHcnDlO7RR6VRq1t/qznbY
	a+zdJtExtN3Ixjfq7A/M3mR7HjTSImVw4Wore1wivVWn48Gh30hmogEYKg7GAmnJDG3U
	icjUwg4+GJZrHwgnb8l3RAuErurQ3iQLItPwKrAye3Xm2eOYMt8KUt3BKdrtcvcZomMU
	AZAcnLROWd71to4+gtXoya23J2DXbs1OY6JNKDRQJCEQVMHs2v4IgfYzZcV+hMdNCjuP
	c1bg==
X-Gm-Message-State: AD7BkJIT1dDGsTs60jlK2kFOZdvOy+B1+LLsltmSgnsqfw+Cm+AzxZR3//AP0Oaj7MsVVczGyJoK0Kv2Tfqf3CAi
X-Received: by 10.31.52.147 with SMTP id b141mr2091464vka.82.1458751013257;
	Wed, 23 Mar 2016 09:36:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 23 Mar 2016 09:36:33 -0700 (PDT)
In-Reply-To: <1458745197-17973-1-git-send-email-sw@weilnetz.de>
References: <1458745197-17973-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Mar 2016 16:36:33 +0000
Message-ID: <CAFEAcA_d14UThiOF4sh7T1VK54Zi3wOmBfKwQxUgEPOagT3RdA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Juan Quintela <quintela@redhat.com>,
	QEMU Developer <qemu-devel@nongnu.org>, Amit Shah <amit.shah@redhat.com>,
	Peter Chubb <peter.chubb@nicta.com.au>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Dmitry Fleytman <dmitry@daynix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Leon Alrae <leon.alrae@imgtec.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] Fix some typos found by codespell
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Mar 2016 16:37:00 -0000

On 23 March 2016 at 14:59, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> I hope that it is fine not to split this in lots of
> small patches.

> --- a/qga/channel-win32.c
> +++ b/qga/channel-win32.c
> @@ -77,7 +77,7 @@ static gboolean ga_channel_prepare(GSource *source, gin=
t *timeout_ms)
>      }
>
>  out:
> -    /* dont block forever, iterate the main loop every once and a while =
*/
> +    /* don't block forever, iterate the main loop every once and a while=
 */

Should be "once in a while".

>      *timeout_ms =3D 500;
>      /* if there's data in the read buffer, or another event is pending,
>       * skip polling and issue user cb.

> --- a/util/timed-average.c
> +++ b/util/timed-average.c
> @@ -8,9 +8,9 @@
>   *   Beno=C3=AEt Canet <benoit.canet@nodalink.com>
>   *   Alberto Garcia <berto@igalia.com>
>   *
> - * This program is free sofware: you can redistribute it and/or modify
> + * This program is free software: you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License as published by
> - * the Free Sofware Foundation, either version 2 of the License, or
> + * the Free Software Foundation, either version 2 of the License, or
>   * (at your option) version 3 or any later version.
>   *
>   * This program is distributed in the hope that it will be useful,

...I wonder how we ended up with a license boilerplate with typos;
they're almost always just cut-n-pasted from another copy...

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


thanks
-- PMM

