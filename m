Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W8shG-0003Ut-9i
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jan 2014 09:34:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W8shA-0003UZ-1q
	for qemu-trivial@nongnu.org; Thu, 30 Jan 2014 09:34:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W8sh5-0007xa-5s
	for qemu-trivial@nongnu.org; Thu, 30 Jan 2014 09:34:19 -0500
Received: from mail-lb0-f172.google.com ([209.85.217.172]:58354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W8sh4-0007xO-Vg
	for qemu-trivial@nongnu.org; Thu, 30 Jan 2014 09:34:15 -0500
Received: by mail-lb0-f172.google.com with SMTP id c11so2595434lbj.17
	for <qemu-trivial@nongnu.org>; Thu, 30 Jan 2014 06:34:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+sDU9cmYvx/WcFPqT7YWEJJZPGHlWYeO3iZNivw5DwA=;
	b=BjiLro5dcKY47oiQWFmUdgvSgXSTQsu4A4jAaq3RKa2iSq7TMeGeMFs1t4LaRmjTuB
	kO8rh13ClTXPlhwdpPf4y6g1ykV4diD71DJWZm8ck/riksMlq8ZDupsGaEFevexoAh0P
	Io85LG7cLTXHvAfK4aZBPVL5pOsd7jHwlzhHG6c2mKS8ogl+5frQ1nArgWp8sqSPbUjl
	+zZsaFBQ2AQWgohz33d57xfZjTpZbuXBDc7Uu7RKjAt9wlM7QRLrT0RztrVzxSlAJ2zr
	zYomo7NVQ7tLcGLWgq11Y8s40nbJMUK1rGQkWgSO4//CBWLaTvUugxI2qyuB74VGppVo
	aRkA==
X-Gm-Message-State: ALoCoQlfo6K8/7vphlqqKdB8+YIadriLcdlev8VPWHpGqTpqKEswOoF1taWWIBPPuiTM9v+NrhEE
X-Received: by 10.112.160.161 with SMTP id xl1mr133673lbb.71.1391092453722;
	Thu, 30 Jan 2014 06:34:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.199.162 with HTTP; Thu, 30 Jan 2014 06:33:53 -0800 (PST)
In-Reply-To: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jan 2014 14:33:53 +0000
Message-ID: <CAFEAcA9ANB2FSTVQgcQLw=O3w4PbnE0XdtvQUzDQbgs8aO3n4Q@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.172
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/11] Trivial patches for
	2014-01-16
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
X-List-Received-Date: Thu, 30 Jan 2014 14:34:25 -0000

On 16 January 2014 17:35, Michael Tokarev <mjt@tls.msk.ru> wrote:
> There's nothing exciting in there, but we have some small bugfixes here and
> there, and a few cosmetic changes too.
>
> This is my first signed pull request too, based on my regular GnuPG key which
> I use to sign Debian packages.
>
> Please pull.

Thanks, applied. You'll see that gpg is a bit alarmist in
the merge commit message because we don't have a strong enough
web of trust between us yet (see also commit 4cddc7f44 for
earlier instances of that in our history).

thanks
-- PMM

