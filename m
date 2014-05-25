Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoUTV-0002Hr-K3
	for mharc-qemu-trivial@gnu.org; Sun, 25 May 2014 05:12:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WoUTP-0002EM-Et
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 05:12:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WoUTJ-0003by-TM
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 05:12:07 -0400
Received: from mail-la0-f49.google.com ([209.85.215.49]:54119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WoUTJ-0003bn-NI
	for qemu-trivial@nongnu.org; Sun, 25 May 2014 05:12:01 -0400
Received: by mail-la0-f49.google.com with SMTP id pv20so5045828lab.22
	for <qemu-trivial@nongnu.org>; Sun, 25 May 2014 02:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Jwz29hRmgKA79X4sdx9tU4TS/kZ6uiXq4FWxzNjH8PM=;
	b=Zmftg5ad1TuuMiFHJLHUcaGafrvlQm/fmk6fq8K4L87RGundSYQkL9sMTib3g3fTWr
	Z2OUXRfox6dYUgLGdXrHdFWGyHPgh9+BeavK/UbfsFzChjUQ5x+wGIUNFsMWqYhKhnwo
	LquwVCdNT8E14ryMgV0n64MNoKtkruk9kmdgwdP3E6/D1CEL8mJsGA849syKoTi0L0Ro
	7+b5I5Ox+TxwSgdtejk9ZOofcPwqPdzMXwIXYMrQwQgTqyYT8Q7S6rnQEO6SnZys1Ojd
	sb2tk7Ir24YbZnXdR+ooqLcOme/znQxn59M9oNjch27oQ0Vn0QVoYb+4Hgjj5pSWLLoa
	0hmg==
X-Gm-Message-State: ALoCoQngrBTaDBVWlKrV/gFuMKllLbm15GvEDoWEwBfrXqOFrLYzOChbG1Sfb1g/K6hjTPG1Fnf8
X-Received: by 10.152.20.168 with SMTP id o8mr24546lae.78.1401009120853; Sun,
	25 May 2014 02:12:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Sun, 25 May 2014 02:11:40 -0700 (PDT)
In-Reply-To: <20140525012151.GI1904@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
	<CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
	<20140525012151.GI1904@beta.private.mielke.cc>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 May 2014 10:11:40 +0100
Message-ID: <CAFEAcA95424yXi1yobV5R3jt5t-69H36XRv8kDAyK7Dvx0bJ2w@mail.gmail.com>
To: Dave Mielke <dave@mielke.cc>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.49
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] patch: add delay=<msecs> suboption
	to -display curses
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
X-List-Received-Date: Sun, 25 May 2014 09:12:12 -0000

On 25 May 2014 02:21, Dave Mielke <dave@mielke.cc> wrote:
> [quoted lines by Peter Maydell on 2014/05/25 at 01:04 +0100]
>>Why is this a problem only for the curses UI frontend, and not for
>>any of the other UIs which might send key events?
>
> One reason is that most UIs send key events as they receive them from the
> keyboard, one at a time, whereas the curses UI gets a single key event from
> curses and then sends all of the scancodes which it takes to represent that
> key. In other words, a single key event from curses could result in as many as
> 10 actual key events needing to be passed along - both the press and release
> for the actual key plus up to four modifiers (shift, control, alt, altgr).

Ah, I see. Still, I think it makes more sense for the queue and delay
to be in the common key handling code, not in the curses frontend
specifically.

thanks
-- PMM

