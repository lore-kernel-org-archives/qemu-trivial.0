Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYdEk-0006ir-DB
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2017 13:33:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cYdEi-0006cR-0u
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 13:33:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cYdEh-0004ky-8P
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 13:33:00 -0500
Received: from mail-ua0-x236.google.com ([2607:f8b0:400c:c08::236]:34348)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cYdEh-0004ko-3G
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 13:32:59 -0500
Received: by mail-ua0-x236.google.com with SMTP id 35so279302162uak.1
	for <qemu-trivial@nongnu.org>; Tue, 31 Jan 2017 10:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FPUr+5m8z0XyP18Er7U3NLWfXEhnIiE3bCtIuBAHAjc=;
	b=hq8pSm9ASa97J5CNOi2BJoh4vni4UAarqotNoiv4I5JnJro/f8LBZsH67oVXjO36mm
	nj6d05H3tTzQZXV4lP/u1wZQau92/uCB6YbSwU2H61ztelSCNQGMeMd88tUJkJiDvRRh
	Rhsavc9jC5c885jIa3/McGM0Drtvyc+aRO82E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FPUr+5m8z0XyP18Er7U3NLWfXEhnIiE3bCtIuBAHAjc=;
	b=hynxdULxmzpQ+tCmubJcM1NnE1pJerveA3/r214w9VBVu50nnzQ1/DIjXtsi97X3z6
	1YbbFybx5wrCXXE3v5BBqfin/+YtDsjNTzxnyj8tU5hyThyHXinjhqVu4UWuy7Uqs+ou
	wu8daBBKcxrSTfUw+prf7xf8yyWXc1h6lprK4r8TPMTZVoZfdqbqUhm8ralXoXK0iDdJ
	a59sRv/hHIflUQlU8vW3vIn6x72EwyJwU4rKmF2SP8CFeexdNAh9uddWI6VncGjt2aOO
	rVTPEQx26gGdBcpqNbhZOGzz5CUBLNFrWGs5aH4B3fWc58AYOW7YHb07OSNun1k9m7BR
	sbxw==
X-Gm-Message-State: AIkVDXLwsajHKE2yRZpFpOL5ORytQC55oDme354sLwGzt/wSHnxElPX8aT+KMhVsfSU2aWBw+ToZsJYzwo7oZztt
X-Received: by 10.159.49.27 with SMTP id m27mr6784200uab.137.1485887578425;
	Tue, 31 Jan 2017 10:32:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.2 with HTTP; Tue, 31 Jan 2017 10:32:38 -0800 (PST)
In-Reply-To: <20170131181124.GF20303@redhat.com>
References: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
	<87wpdbw2ki.fsf@dusky.pond.sub.org>
	<CAFEAcA-Ggv2VGszZg0Ld3-1wm=hVe8w=4ZcQ7TDRHf5Puq88ug@mail.gmail.com>
	<20170131181124.GF20303@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Jan 2017 18:32:38 +0000
Message-ID: <CAFEAcA_utwK=JxC7aa9chZa2DjuGkBfGAYrEfXVo86pZ5u5-zg@mail.gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::236
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop QEMU_GNUC_PREREQ()
 checks for gcc older than 4.1
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
X-List-Received-Date: Tue, 31 Jan 2017 18:33:01 -0000

On 31 January 2017 at 18:11, Daniel P. Berrange <berrange@redhat.com> wrote:
> On Tue, Jan 31, 2017 at 06:00:13PM +0000, Peter Maydell wrote:
>> We have attributes which we wrap in QEMU_ macros already
>> even though they always expand to the same thing:
>> QEMU_NORETURN and QEMU_ALIGNED. I'm happy to leave these
>> to follow that pattern. (If you wanted to send a patch
>> series that uninlined all of those then I wouldn't hugely
>> object to it, but I think it touches enough files that it's
>> a separate thing from removing the #if guards that this
>> patch does.)
>
> The other option is just to replace QEMU_WARN_UNUSED_RESULT with
>
>   #define QEMU_WARN_UNUSED_RESULT  G_GNUC_WARN_UNUSED_RESULT
>
> and convert code to use G_GNUC_WARN_UNUSED_RESULT directly until we
> can kill the QEMU specific define. There's no benefit to QEMU having
> its own defines that duplicate stuff already covered by our min
> required glib - G_GNUC_WARN_UNUSED_RESULT was added in 2.10 for
> example.

I wouldn't object to that either, but again it ought to be
a different patch or patch series to this one...

thanks
-- PMM

