Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etCjH-0002Xf-Qk
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 08:34:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etCjE-0002UZ-O7
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:34:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etCjD-0007GK-Qa
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:34:04 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:34364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1etCjD-0007Ff-Ks
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 08:34:03 -0500
Received: by mail-ot0-x244.google.com with SMTP id n74so18325039ota.1
	for <qemu-trivial@nongnu.org>; Tue, 06 Mar 2018 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=EIlLh1YBZVwhcmg3X+6aJk37cuMVBxg0Gggjo4B+wfI=;
	b=i2ewObXgR51csKtMVapNseQb8mH/eMgBA6S2RihCs0z9cZzogBhlXD89f9YJ/rUNI6
	c7XBjCM4Ms4Zybxd71HN2399S8/wF1mVKotdvJLBmTQ15ai6G2SkkTmFFwMYY8WVU/4n
	Y7PZ6lXMFiSKlwF3bYXAn7uD+Z795wDimB/BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EIlLh1YBZVwhcmg3X+6aJk37cuMVBxg0Gggjo4B+wfI=;
	b=jnzEyhTMQcryfr4+Gl6d5InNcovckGOuGIKFPuzTNY+ECvDwvysc1aJu42GpTZQtlp
	f+GHcWv0gsOQGTdMfJpU5C4v3xLfjYIKZze3v4xWAkCKhZ1bQy0zooqdFkAQFbpEFKzg
	U4pNsh6mnOPG4EEv6QR4ezW8qzMzRdeqxzSY6g5n/npZnnXGnbmuqAViQX/iTV1UOp2a
	a7JAsyuaeCwDWDLsce17SuquF+l3Kzo+XNKZRmkY21XzdlRIlXBtp9dFKfc/PJxY4+K3
	V18IF/YRu4JkkOPvNLFfYAMHqkFF6F1vrzGhbteR14yJse7OQ1dBIS7PNsGGd+pcLZac
	lGJQ==
X-Gm-Message-State: AElRT7FCF0R1xzM2pk9gQTWcztEiyzFoZ61nPFGnAVFAdfeYU/iMLxkJ
	3zUUc1RivKOfe0eTNGnMcj2KxqXs00reCEtwioZafQ==
X-Google-Smtp-Source: AG47ELsUv2Ah2oHX8ZxWQ0QsckcF7Om0/C7+5nIO+oeGcwiYk3brnAJQZPUH9BVd6Kb0vNz+xg9pNJH6EHclsoH3Q3U=
X-Received: by 10.157.69.152 with SMTP id x24mr12272488ote.126.1520343242878; 
	Tue, 06 Mar 2018 05:34:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 6 Mar 2018 05:33:42 -0800 (PST)
In-Reply-To: <20180306132430.32110-1-berrange@redhat.com>
References: <20180306132430.32110-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Mar 2018 13:33:42 +0000
Message-ID: <CAFEAcA95xt-9MJHcRC7WovEB3W259_eFD7Q8v_pG5rGh3L7oCg@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-trivial] [PATCH] misc: don't use hwaddr as a type in
 trace events
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
X-List-Received-Date: Tue, 06 Mar 2018 13:34:06 -0000

On 6 March 2018 at 13:24, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wro=
te:
> Use types that are defined by QEMU in trace events caused build failures
> for the UST trace backend:
>
>   In file included from trace-ust-all.c:13:0:
>   trace-ust-all.h:11844:206: error: unknown type name =E2=80=98hwaddr=E2=
=80=99
>
> It only knows about C built-in types, and any types that are pulled in
> from includs of qemu-common.h and lttng/tracepoint.h. This does not
> include the 'hwaddr' type, so replace it with a uint64_t which is what
> exec/hwaddr.h defines 'hwaddr' as. This fixes the build failure
> introduced by
>
>   commit 9eb8040c2d2b38e1a40bb6129b1b668fa178fcab
>   Author: Peter Maydell <peter.maydell@linaro.org>
>   Date:   Fri Mar 2 10:45:39 2018 +0000
>
>     hw/misc/tz-ppc: Model TrustZone peripheral protection controller
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---

Oops.

> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -92,8 +92,8 @@ tz_ppc_cfg_sec_resp(int level) "TZ PPC: cfg_sec_resp =
=3D %d"
>  tz_ppc_irq_enable(int level) "TZ PPC: int_enable =3D %d"
>  tz_ppc_irq_clear(int level) "TZ PPC: int_clear =3D %d"
>  tz_ppc_update_irq(int level) "TZ PPC: setting irq line to %d"
> -tz_ppc_read_blocked(int n, hwaddr offset, bool secure, bool user) "TZ PP=
C: port %d offset 0x%" HWADDR_PRIx " read (secure %d user %d) blocked"
> -tz_ppc_write_blocked(int n, hwaddr offset, bool secure, bool user) "TZ P=
PC: port %d offset 0x%" HWADDR_PRIx " write (secure %d user %d) blocked"
> +tz_ppc_read_blocked(int n, uint64_t offset, bool secure, bool user) "TZ =
PPC: port %d offset 0x%" HWADDR_PRIx " read (secure %d user %d) blocked"
> +tz_ppc_write_blocked(int n, uint64_t offset, bool secure, bool user) "TZ=
 PPC: port %d offset 0x%" HWADDR_PRIx " write (secure %d user %d) blocked"


If the type isn't "hwaddr" then HWADDR_PRIx is the wrong
format string macro -- those should change to PRIx64.

thanks
-- PMM

