Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjrpW-00005Q-Sq
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 13:21:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjrpU-00004q-5a
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:21:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjrpT-0002fk-6t
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:21:24 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:35332)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjrpS-0002fR-W4
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:21:23 -0500
Received: by mail-wm0-x230.google.com with SMTP id v186so21667688wmd.0
	for <qemu-trivial@nongnu.org>; Fri, 03 Mar 2017 10:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CwQIIXk5KlZWZL+Ila2fT1yyFPjxF3wDDn91Ts6H5V0=;
	b=OPYsdmk0gSyJZB6lEYbHqIwOl7lI4L/73uECLBlmyv0nfE1QU2dPnd/BO8yQtRipb+
	DSFJGwzOac8rAskmknCTkTXYclW4jkJcSVrwhABllpiVBIbCOYz2x3f2EJg6h4koEcpI
	wh7XIRGUMNgxYVXla8f4CMtNkCxXsqMTnarSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CwQIIXk5KlZWZL+Ila2fT1yyFPjxF3wDDn91Ts6H5V0=;
	b=mako62gTteriw7Liz/+TJJcSb9kNY+GCz4U04XTWQ+YmOSTGHm8GbMARhYT8qHR3f+
	PYPqXWmCAqofswoARNNY8UN7tQFbyJyo1Col7jP2TTktZKV5Z2//s0eOjUYfpRWNArgP
	q4ozVUaSfqxbPxx6t1YYd8v+aXRhs4h1txHpLk3nHeZtTil5Poj97XFcBU9xFi9vCLoa
	aKr2P/QFcHTkRsSutroaUHoybXhYMTI+hagjECg4r3EqtujuMJ1K0uFL1ZzRmU1YX3sW
	xP6tRLONlRjlQJPWDlneHUrLTYHTCIuW7YLio7RMuJ+LI7lzZvBE2M5OLRMdSDRlOn9r
	bAoQ==
X-Gm-Message-State: AMke39k/RFlsvQkU79/U332aIKBzP1wNDUGoAP65FN23xiiRTgvsiQbE0N5JojedwrDaa1qrlkCwCMth13HU3RSy
X-Received: by 10.28.157.67 with SMTP id g64mr4126954wme.111.1488565281789;
	Fri, 03 Mar 2017 10:21:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:21:01 -0800 (PST)
In-Reply-To: <0d2bc67f3e9bbed63e3074725bc5d234dc1d272f.1488504063.git.balaton@eik.bme.hu>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<0d2bc67f3e9bbed63e3074725bc5d234dc1d272f.1488504063.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:21:01 +0000
Message-ID: <CAFEAcA93+ZOSBwytLPtBgZ8DzPgwBrzpC0s1MZ0ff_KO+rb--A@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-trivial] [PATCH v3 02/13] sm501: Use defined constants
 instead of literal values where available
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
X-List-Received-Date: Fri, 03 Mar 2017 18:21:25 -0000

On 3 March 2017 at 00:21, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>
> v3: Fix initial value of misc_control register as Peter Maydell suggested
>     Also use M_BYTE constant from cutils.h
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

