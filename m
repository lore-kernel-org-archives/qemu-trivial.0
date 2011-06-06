Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTXF1-00011t-GF
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jun 2011 06:41:03 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QTXEx-00010i-C5
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2011 06:41:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QTXEw-0006ui-2S
	for qemu-trivial@nongnu.org; Mon, 06 Jun 2011 06:40:59 -0400
Received: from mail-gx0-f173.google.com ([209.85.161.173]:65157)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QTXEs-0006u9-F5; Mon, 06 Jun 2011 06:40:54 -0400
Received: by gxk26 with SMTP id 26so1687472gxk.4
	for <multiple recipients>; Mon, 06 Jun 2011 03:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Dd8j5m6OyLsxUHq6xItIrnjhVC80Qa2Hdnv2wZxBtK4=;
	b=grf6raxrbZepywUU2IlwA4NgYLSrQngH3Agusy8MwBzroolSkvBnWgJ7280OtFmCbz
	WJm2BIlLBMzY/6aYucZFOqkoKjL3NNXDN9BQl51PAbqsPLYVTSIaK6ngR5GbcyqnrGT8
	/V3W8UjfDY3huwFQl1WrpxbOBDYhgVj1sFyRI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=ooNRxa/2jX0WkInqdwKAUBjCq9lPKd9qxYmszuyB+6ys0k9rtWazutVy/zKI8kB0do
	oFWASfJKWGUqz6KMwtNGvVeumcrpVz6sAvUuZsP8am8siTan0rsbNgd4t9TCh0aum6lD
	D8rtWA5vJss8pFb3bfZTB7I9tXWvLebxAo90M=
MIME-Version: 1.0
Received: by 10.236.183.5 with SMTP id p5mr5668162yhm.16.1307356853080; Mon,
	06 Jun 2011 03:40:53 -0700 (PDT)
Received: by 10.146.86.2 with HTTP; Mon, 6 Jun 2011 03:40:53 -0700 (PDT)
In-Reply-To: <1307246220-61006-1-git-send-email-cerbere@gmail.com>
References: <1307246220-61006-1-git-send-email-cerbere@gmail.com>
Date: Mon, 6 Jun 2011 11:40:53 +0100
Message-ID: <BANLkTikXxpk+1RH+JkqxTX-1hnDixYB_dg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexandre Raymond <cerbere@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Correct and standardize
 header guards in all header files
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
X-List-Received-Date: Mon, 06 Jun 2011 10:41:01 -0000

On Sun, Jun 5, 2011 at 4:57 AM, Alexandre Raymond <cerbere@gmail.com> wrote=
:
> diff --git a/balloon.h b/balloon.h
> index d478e28..4602d85 100644
> --- a/balloon.h
> +++ b/balloon.h
> @@ -11,8 +11,8 @@
> =A0*
> =A0*/
>
> -#ifndef _QEMU_BALLOON_H
> -#define _QEMU_BALLOON_H
> +#ifndef QEMU_BALLOON_H
> +#define QEMU_BALLOON_H
>
> =A0#include "monitor.h"
>
> @@ -30,4 +30,4 @@ int do_info_balloon(Monitor *mon, MonitorCompletion cb,=
 void *opaque);
> =A0int do_balloon(Monitor *mon, const QDict *params,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MonitorCompletion cb, void *opaque);
>
> -#endif
> +#endif /* QEMU_BALOON_H */

BALOON?

> diff --git a/darwin-user/qemu.h b/darwin-user/qemu.h
> index b6d3e6c..a426381 100644
> --- a/darwin-user/qemu.h
> +++ b/darwin-user/qemu.h
> @@ -175,4 +175,4 @@ static inline uint64_t get_int64_arg(int *i, CPUPPCSt=
ate *cpu_env)
> =A0}
> =A0#endif
>
> -#endif
> +#endif /* GEMU_H */

GEMU, looks like darwin-user/qemu.h typoed "QEMU"?

If you really want to do this, please use a script to convert the code
consistently without errors.  I don't have time to review long
error-prone patches that have no external benefit for QEMU, sorry.

Stefan

