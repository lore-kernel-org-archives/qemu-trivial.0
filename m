Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XBiMt-0004ZA-Qb
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jul 2014 06:41:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XBiMn-0004Yu-0w
	for qemu-trivial@nongnu.org; Mon, 28 Jul 2014 06:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XBiMh-0000Qd-L2
	for qemu-trivial@nongnu.org; Mon, 28 Jul 2014 06:41:16 -0400
Received: from mail-lb0-f177.google.com ([209.85.217.177]:58487)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XBiMh-0000QO-Et
	for qemu-trivial@nongnu.org; Mon, 28 Jul 2014 06:41:11 -0400
Received: by mail-lb0-f177.google.com with SMTP id s7so5645481lbd.36
	for <qemu-trivial@nongnu.org>; Mon, 28 Jul 2014 03:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VzjlvNUjMvdVNtSCTD5BxkjBs84DcnCTBjEnDdCnCF0=;
	b=dwHltimoXrqQVCW3ar3AIizZ//BICLIsyg8b7rdC9oLIPiFct8DO1edEvf5fkpXXBu
	BomOrnoPs891GjxZYJGilrQuYboJFMpC7qtuiIIY7weC7LzKj2G2nRNLqlYz3B9PYJvm
	uc5UtGgs6x3Iqb2hD4XurDJ+SE8MXWmAk14g3Iu+5WEkowY5yNBHsBHU7I2HmaVWzqy3
	BorMlvpTMAiOqiWN6pqU8yN8dK178C1e3rxZfx09IgujecD0yXMUdtNHmJ+qvb3kfUm+
	GMHwjS1bteUxXkozRsnEyNCQVOBHWI3GueH86p4HcoQlSYYi89qNbm4pVuORGZeHl2ul
	fdjA==
X-Gm-Message-State: ALoCoQn0AagVXfhC0zRtcxH1pFlyzmVSmkRr+ZO+Sj6FoLq5EMVW/LAkFKylci0rLw24W81uKSv1
X-Received: by 10.152.6.170 with SMTP id c10mr34068077laa.9.1406544069998;
	Mon, 28 Jul 2014 03:41:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Mon, 28 Jul 2014 03:40:49 -0700 (PDT)
In-Reply-To: <1406359101-17791-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1406359101-17791-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jul 2014 11:40:49 +0100
Message-ID: <CAFEAcA8+7rb6M3p0g1OyN9uOXvm79jkqtPxa48jF+Znmg9tmYg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.177
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL for-2.1] Trivial patch for
	2014-07-26
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
X-List-Received-Date: Mon, 28 Jul 2014 10:41:22 -0000

On 26 July 2014 08:18, Michael Tokarev <mjt@tls.msk.ru> wrote:
> There's just one trivial patch this time, fixing another
> occurence of "allows to" in help text.  Please consider
> applying for 2.1.
>
> Thanks,
>
> /mjt
>
> The following changes since commit c60a57ff497667780132a3fcdc1500c83af5d5c0:
>
>   Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2014-07-25 16:58:41 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-07-26
>
> for you to fetch changes up to 2f47b403bd494b6717ef14c0d278d4b2d364b382:
>
>   qemu-options: fix another allows-to for -net l2tpv3 (2014-07-26 11:16:44 +0400)
>
> ----------------------------------------------------------------
> trivial patches for 2014-07-26
>
> ----------------------------------------------------------------
> Michael Tokarev (1):
>       qemu-options: fix another allows-to for -net l2tpv3
>
>  qemu-options.hx |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- PMM

