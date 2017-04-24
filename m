Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d2coO-0002oE-Nt
	for mharc-qemu-trivial@gnu.org; Mon, 24 Apr 2017 08:09:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d2coM-0002n7-QB
	for qemu-trivial@nongnu.org; Mon, 24 Apr 2017 08:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d2coL-0004ky-Fk
	for qemu-trivial@nongnu.org; Mon, 24 Apr 2017 08:09:46 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:38209)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d2coL-0004kN-9P
	for qemu-trivial@nongnu.org; Mon, 24 Apr 2017 08:09:45 -0400
Received: by mail-wm0-x233.google.com with SMTP id r190so65633669wme.1
	for <qemu-trivial@nongnu.org>; Mon, 24 Apr 2017 05:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aIwJgYr0Ru/r8I/W9AhTgq2/3x/QHqAvpTCru374erQ=;
	b=kPI0+5yEw06Pohosvo3CA0APyMUISagA/divxnMNK83PK/iQuB2dJS594XCuVUW7w3
	qKvz8fuvL/GKKsR86X2XHB3FgdRPZbjdgObaWQGi8B/fKzEiILsORJJIfrO9hZNbILSN
	fHjjKbHqqVZ5nvKm+J10mgXZovj62zB3BjgwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aIwJgYr0Ru/r8I/W9AhTgq2/3x/QHqAvpTCru374erQ=;
	b=PR8LZbDbq5PZnzzxAZWsR03XExEvkZ3RPAHD33yD/FE6Jy8PhIKb9GPolBYAfFz/Yp
	Kyn56qfb6wteZrdJoG4kkoqYt83wWBxDdamVORM1p0KqntHTW+PfO0aNCDNgQ/T0Q4Bt
	Lq9nIFD9xCzgscVmvYaClL6OuHnbTszcj28RZLRTd4D+euWiLSdHEqRljTTkzgiGCOOL
	qJckxoVXFnWWSVz89VpgSTQZiPVV+S32B93AIuREfcpFQbijC7V2H3VG97yGa49Co+AL
	y/Vm8zQnJUfxS8DNFvofUK5AOd9elXF/qonrcQNydLAc1EtkJBL51+PegN8EM5xudOBW
	YBxg==
X-Gm-Message-State: AN3rC/4Gfbl9h47+4Eq+dLmBAtLXWaorqfjP+Cv3epVqoEq9HR3Pe5tp
	Bqu8rZeQ1IgZWcSSVn/hn19VXvR65VTs
X-Received: by 10.28.57.138 with SMTP id g132mr9065576wma.92.1493035784170;
	Mon, 24 Apr 2017 05:09:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Mon, 24 Apr 2017 05:09:23 -0700 (PDT)
In-Reply-To: <cover.1492787889.git.balaton@eik.bme.hu>
References: <cover.1492787889.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Apr 2017 13:09:23 +0100
Message-ID: <CAFEAcA8zdKvg-y=kGGNH9x4s_Z9CSgu3gP8_GW8JANj74i2h0Q@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-trivial] [PATCH v7 00/13] Improvements for SM501 display
 controller emulation
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
X-List-Received-Date: Mon, 24 Apr 2017 12:09:48 -0000

On 21 April 2017 at 16:18, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> v7: Define default values for some variables to avoid an (invalid)
>     warning from gcc 6 or 7 as suggested by Aurelien Jarno.
>
> BALATON Zoltan (13):
>   sm501: Fixed code style and a few typos in comments
>   sm501: Use defined constants instead of literal values where available
>   sm501: Add missing arbitration control register
>   sm501: QOMify
>   sm501: Get rid of base address in draw_hwc_line
>   sm501: Add emulation of chip connected via PCI
>   sm501: Fix device endianness
>   sm501: Fix hardware cursor
>   sm501: Misc clean ups
>   sm501: Add support for panel layer
>   sm501: Add some more missing registers
>   sm501: Add vmstate descriptor
>   ppc: Add SM501 device in ppc softmmu targets default configs

Thanks for working through the code review process on this one.
Since SH4 is only 'odd fixes' and Aurelien has tested the code,
I've applied it directly to git master.

thanks
-- PMM

