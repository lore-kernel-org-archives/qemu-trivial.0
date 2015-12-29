Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aDuiT-0006iX-RH
	for mharc-qemu-trivial@gnu.org; Tue, 29 Dec 2015 08:53:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDuiQ-0006e5-ED
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 08:53:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDuiP-0007RE-7y
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 08:53:30 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33455)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDuiP-0007R8-1D
	for qemu-trivial@nongnu.org; Tue, 29 Dec 2015 08:53:29 -0500
Received: by mail-vk0-x229.google.com with SMTP id a188so193045347vkc.0
	for <qemu-trivial@nongnu.org>; Tue, 29 Dec 2015 05:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=X2IrMumT5sWlB3Me8cdFszmiBw6Ehga2kUWEiWkANNk=;
	b=etn4j5eiyrB5dCOe59GDONhKnBCAJ2SEFjcVImHnt/OFT4GG19uF9u+IOVJjLeEZwZ
	Llfw6W+noLpLdcLjaR8aZDAP/Z3SFFkJQnjznIItVQuOONgh+F/U0yhYz1fONh7avjPu
	Z5a89yzil2D/nrPiINWI1jpmnuREPX4QIVdf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=X2IrMumT5sWlB3Me8cdFszmiBw6Ehga2kUWEiWkANNk=;
	b=JXYXT90z8nFq+RXhYonI10JFRVeEx6vLyPvgJfB1m1OCzpnP2sNf18UNzzjwjTiDlB
	phM5u/Jj3Bg0wVb54dY3jWdzKzBssE8qnnxWd0fb5VOQdDmlix2StynHYA32E16IgrU2
	QTGiRkrZbcX+0hGQ6kdJxfpp9MGV0Ug7TX7JsaJB21x9dRdySAauJntaS4yIKZnR5nuQ
	twwSaF5UXTKBkdI74dHy8ZDdjfdEDX1FLoFqw3pEuhoqnUBbvsVyqNdHAoUOnvYAQB9l
	QFXvhIS3N93Epra9jbGlofP009z80mKh33VBkVTKVYR7b3VZarjUqdKkCDHRf+LYSbPA
	Rhmw==
X-Gm-Message-State: ALoCoQnp/8sQoZVgDIblRtzYCso+WMd6QIHQlKDMTmh2OcTbOzpe5QnS88hhyjI40K3ekqRRw/qSZ+xhyuFTbn5E/j61uCz4/3YMK4OclKuPJWqdXnDrsBY=
X-Received: by 10.31.131.203 with SMTP id f194mr38846168vkd.90.1451397207556; 
	Tue, 29 Dec 2015 05:53:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 29 Dec 2015 05:53:07 -0800 (PST)
In-Reply-To: <1451382219-5159-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1451382219-5159-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Dec 2015 13:53:07 +0000
Message-ID: <CAFEAcA-KDp7FdXA=8P8ZiVXBJGKP7XR8GeP3vPiQwP-xk+2EpA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] unicore32: convert
 get_sp_from_cpustate from macro to inline
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
X-List-Received-Date: Tue, 29 Dec 2015 13:53:31 -0000

On 29 December 2015 at 09:43, Michael Tokarev <mjt@tls.msk.ru> wrote:
> All other architectures define get_sp_from_cpustate as an inline function=
,
> only unicore32 uses a #define.  With this, some usages are impossible, fo=
r
> example, enabling sigaltstack in linux-user/syscall.c results in
>
> linux-user/syscall.c: In function =E2=80=98do_syscall=E2=80=99:
> linux-user/syscall.c:8299:39: error: dereferencing =E2=80=98void *=E2=80=
=99 pointer [-Werror]
>   get_sp_from_cpustate(arg1, arg2, get_sp_from_cpustate((CPUArchState *)c=
pu_env));
>                                        ^
> linux-user/syscall.c:8299:39: error: request for member =E2=80=98regs=E2=
=80=99 in something not a structure or union

I think this is a bug in the macro implementation (lack of
brackets around the macro argument on its RHS) rather than
a macro being impossible to use for this, but I agree that
the inline function is better both for consistency with other
targets and as a style issue.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

