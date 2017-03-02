Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjWug-000676-Hp
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 15:01:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjWue-00065r-49
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:01:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjWud-0006yH-FQ
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:01:20 -0500
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:35683)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjWud-0006xZ-9E
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 15:01:19 -0500
Received: by mail-wr0-x233.google.com with SMTP id g10so60341463wrg.2
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 12:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DgAbcOi4vdFj5/mCZi3qIRRrk3cQfZxMF/oP9h1Mot4=;
	b=RcpqhvdzRFrJ4TTY96akBU7HVUHb8VnGhmJDE4X+5g1X3tjwQ24DlB7aeHTX3DcCG+
	3aOIBdUxYsqx/D4dEytA8RZ+A37CyV3E+9f+mkg5oEnoFfHajX9x4jb643CY3HxdpKy/
	pPXPXZwyuhcbid249BL/lhZf0H70ho2QAqFqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DgAbcOi4vdFj5/mCZi3qIRRrk3cQfZxMF/oP9h1Mot4=;
	b=poo1Cm7uh4tFmhhM4a1H7aOL/hESzegXTk3PgqILudpYr34wPSzh4DIc1Vl8joLi43
	vjw/yI4vrR28yTvwGLRpTzt4zV3meMaGjCxLFnduCvWlWCjyhimAjvXP0TMF62i1Ofln
	Bxxc9WP3pf3ciRKQI/+QUmP3rfyQ2xI12VkYMuNZf6o5cgltbp4EEMAcjDuBbShB6Ohg
	z2uLKyuykwSqPi/UpmdluJ8robHY88dTuTvswBQuKKMGeG9E1pdipYRHC5z03xeiEYxH
	s2YNlDuexbg0esEwSWX19cJl/C07yja4U1GQWiwrhjQ3QsIjw4ovPN2L/Jqhr1yTR0pi
	kGMg==
X-Gm-Message-State: AMke39n0wtf36UsHjpbabYPNW6ZEaITVN/8NvSJGevTkqLmH4PQt5KJr1mwhh6oE1x72tZuv1OVXlvb8WN3n7Q+G
X-Received: by 10.223.169.45 with SMTP id u42mr13336311wrc.187.1488484878130; 
	Thu, 02 Mar 2017 12:01:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 12:00:57 -0800 (PST)
In-Reply-To: <db1b69270ca4d2335e6fb2455ee56552373757fc.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<db1b69270ca4d2335e6fb2455ee56552373757fc.1488068248.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 20:00:57 +0000
Message-ID: <CAFEAcA_kzNEfkg56CFE=x-GqQTV-fpXjGXxvwoPoZS1HNVTnww@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 12/14] sm501: Implement
 reading 2D engine registers
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
X-List-Received-Date: Thu, 02 Mar 2017 20:01:21 -0000

On 25 February 2017 at 21:47, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Clients normally only write to these registers, nothing is known to
> ever read them but they are documented as read/write so allow clients
> to also read the values.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/display/sm501.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)

Oh, the read code is in a separate patch? Please put all the handling
for a particular register in the same patch. If you think the
resulting patch is too long you can split it into several patches
each of which handles a group of registers if you like (but it
probably isn't necessary).

thanks
-- PMM

