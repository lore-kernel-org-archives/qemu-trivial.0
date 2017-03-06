Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckpMz-0003zc-Ve
	for mharc-qemu-trivial@gnu.org; Mon, 06 Mar 2017 04:55:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckpMx-0003xQ-7z
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 04:55:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckpMw-0005un-9h
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 04:55:55 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:32825)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ckpMw-0005uV-2h
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 04:55:54 -0500
Received: by mail-wm0-x235.google.com with SMTP id v203so3143627wmg.0
	for <qemu-trivial@nongnu.org>; Mon, 06 Mar 2017 01:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OtDOkuuZrI6jxacSmkKDelYQ2dX+af8KI5RJoZgBcgs=;
	b=TMRf5A5r/fFX1j/XNMOrRyERZRwIOdmo7wAkaqYqQMcMzxIv650UaWdMrSBYNfdX24
	i71edM8/hR0JzmIE2Pz79ZGcgNcwCINr4OyGLkB2fI80Bgff8EtfynQ0KsZwa28zWJFO
	5XIqiyI8f1Dy1ZohJxzdPJ2O6ITTQhxK59TUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OtDOkuuZrI6jxacSmkKDelYQ2dX+af8KI5RJoZgBcgs=;
	b=IJLogpMmssORyl0OzWDJ0PW75XYgpLX4n2Mo6JcJj63AMjmGlqnjeKrOx3Jk8g0kZt
	Cwq9Gh1chH2TfdtQ24HNBQ/Hs2hczxyqSaP7I7DKswlZfFhvrawjljghOtt1mX0bu+Wo
	Wl2/RLShYHKmnwKJN2FqH+43IWydkOBoN7EMZnhMbRlfHODRJ7OnwIWcx3PP5jES7wRU
	J0n+Hs2yH+XhDvfgFENTVls3Nu9thKHOUeYr2hBcRIdvtR3z9vjQmQk5GedFiM6C6Uj9
	onC+8AFHJ72A5+eQICmonV5dgLkDSaIoGU7+wOOhOjsMYYNMRP9Tvx0L+2bjgJs+P70x
	Borw==
X-Gm-Message-State: AMke39kXkAnLjwA9k2JDIOD+ixPH/vuDhc3Fu4Uj3Wg6Azz6RBUicmK99ZQRuv3BuZ9h99HQb1O2CJlv3dcMuzYZ
X-Received: by 10.28.150.194 with SMTP id y185mr11026020wmd.92.1488794152882; 
	Mon, 06 Mar 2017 01:55:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 6 Mar 2017 01:55:32 -0800 (PST)
In-Reply-To: <4a30ecb4-77d0-795f-bf61-378546a8b034@redhat.com>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<cc6a20fc4a2748f24920c03ce64ae34af0f61799.1488504063.git.balaton@eik.bme.hu>
	<d5475df8-290b-07d4-d177-979d78850615@redhat.com>
	<CAFEAcA90FRxghG0ZdH7H9y2bDk2U9XO1TUJgx0MN+N=7LzO5pQ@mail.gmail.com>
	<4a30ecb4-77d0-795f-bf61-378546a8b034@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2017 09:55:32 +0000
Message-ID: <CAFEAcA8oWmN8tE66XsviXnBxtP5w+WLijXxsGk+6RwRquRo9Gw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Magnus Damm <magnus.damm@gmail.com>, 
	Aurelien Jarno <aurelien@aurel32.net>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 13/13] ppc: Add SM501
 device in config for ppc and ppcemb targets
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
X-List-Received-Date: Mon, 06 Mar 2017 09:55:56 -0000

On 6 March 2017 at 09:52, Thomas Huth <thuth@redhat.com> wrote:
> I guess we could do something like that on ppc, too (and ppc-softmmu.mak
> should likely include ppcemb-softmmu.mak), but
> that's something for QEMU 2.10 / 3.0 / whichever version will be next.

Yeah, definitely 2.10 material (so is this whole series, but
let's not tangle it up with an unrelated cleanup).

Minor caution: I forget whether we successfully fixed all
the annoying makefile bugs that meant that changing something
inside foo.mak didn't cause binaries that used bar.mak
that includes foo.mak to update. I *think* we caught all
those, though...

thanks
-- PMM

