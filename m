Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VsGyW-00067n-5D
	for mharc-qemu-trivial@gnu.org; Sun, 15 Dec 2013 14:03:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VsGyQ-00060Y-Ff
	for qemu-trivial@nongnu.org; Sun, 15 Dec 2013 14:03:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VsGyI-0000qh-Hv
	for qemu-trivial@nongnu.org; Sun, 15 Dec 2013 14:03:30 -0500
Received: from mail-pd0-f180.google.com ([209.85.192.180]:52950)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VsGyI-0000qT-Bl
	for qemu-trivial@nongnu.org; Sun, 15 Dec 2013 14:03:22 -0500
Received: by mail-pd0-f180.google.com with SMTP id q10so4456597pdj.11
	for <qemu-trivial@nongnu.org>; Sun, 15 Dec 2013 11:03:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=bEjYbqejBGPaeklzNlS5Q5KcCTf5tuOGR3cBbUseKgs=;
	b=QJh8lFFwHdiNLtXaT5nLXwSJBIbunn4UPBqoDDD/vQNcs2xKmefxa+G1v5ZGAMPSAL
	+1kdxZOmT2fbBQkoFHSXbrMSbZW/L8+aFJ7CkWWEshEMVek+AKFHRNYks7tMpF3M3qSi
	yuQYsLm1wtkGb3+Yfsc8/0YOrcTBkLAYFcnVnNfysy3bUiJOe0fPZ1jXsirCxPx/TZGL
	lYGBg1Dk98Q2jX/N+bZ+LnpIasyuC9sR3TA/ORcDdYpqQh+7TVrleIReXXlNHLsqcdjM
	GZgM4PvSnror9RBFELuXgFkOo8Ls24lsISgVHiAArOSWwhj8EZZYH63BujRc4Yx7KP3v
	K9MQ==
X-Gm-Message-State: ALoCoQl+dtfG8z4kVwHwSmTwt6NYUbCtY3aGkMA/LQHSOdp7labsqtVZkguro4/JSVOU42Mr8GwX
X-Received: by 10.66.160.2 with SMTP id xg2mr15720847pab.23.1387134201456;
	Sun, 15 Dec 2013 11:03:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.70.82.227 with HTTP; Sun, 15 Dec 2013 11:03:01 -0800 (PST)
In-Reply-To: <52ADFA17.2000109@suse.de>
References: <1368475464-3116-1-git-send-email-green@moxielogic.com>
	<8761qqn496.fsf@moxielogic.com> <52ADFA17.2000109@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 15 Dec 2013 19:03:01 +0000
Message-ID: <CAFEAcA91BoCgAR5ahoFWWWEOzWjwzW0vmv2Ei9NprUwR6T4VKg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.180
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Anthony Liguori <aliguori@amazon.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] ping.. Re: [PATCH moxie] Fix bug in
	tlb_fill.
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
X-List-Received-Date: Sun, 15 Dec 2013 19:03:35 -0000

On 15 December 2013 18:51, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> Am 15.12.2013 05:10, schrieb Anthony Green:
>> This patch still needs to be applied.  There was some follow-up
>> discussion on this patch back in May, but none of it negates the fact
>> that this patch needs to be applied.
>
> It introduces a tab, please fix.
>
> Apart from that I believe I reported some inconsistencies between
> targets in that function, so "all targets except moxie do it conditional
> to FOO" may be a convincing explanation independent of the bug you were
> discussing that may or may not be otherwise workaroundable.

I dug out the thread where you did that (which turns out to be
private mail and not qemu-devel). In follow up to that RTH and I
agreed that it definitely is a bug and this patch is the correct fix.

> And since this is purely in target-moxie I would suggest to simply send
> a pull as target maintainer once you have someone trustworthy's
> Reviewed-by and it doesn't break `make check`, similar to how it's done
> for OpenRISC.

Yes, this makes sense to me, especially since Anthony has a number
of other moxie patches on list at this point.

thanks
-- PMM

