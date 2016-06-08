Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAdnW-0001M7-52
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 09:45:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAdnU-0001KM-Im
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:45:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAdnN-0001MC-2j
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:45:28 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:34900)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAdnM-0001Ly-Ul
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:45:20 -0400
Received: by mail-vk0-x235.google.com with SMTP id d127so11603021vkh.2
	for <qemu-trivial@nongnu.org>; Wed, 08 Jun 2016 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=adAJuswXycydVE+/kyBppUNedZHVDxp5xK2Ex+xCnuU=;
	b=PZGucASiYNPyYjiD7kwju653JIBS+wx4+9QLal5nrvf6EnWftxdI4Y+9g29jSnRQP5
	vv31cG1uVUE2buiE575IoJUCWMO3tloomgS5o79HGrCYHLnwcNJ4gRy5syzwti4n8hym
	Fqawr1l18/7hJWxu6PXTzJf5PdGs8b48b8EO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=adAJuswXycydVE+/kyBppUNedZHVDxp5xK2Ex+xCnuU=;
	b=WdcMvraqX3XkYdKIK6UECyKvKf9Icflw9bn7xjb7uWU1BbsmP2+kjciH8Ceja/Dl1X
	vW3XytAprKZyLLSxyIRjgYNL9f2Z5H9Y2Zc48pM6Dsf9A7UOcQ99IEC0uhAudvk+fj3j
	Rzm7zyb468bXfgL6CQnta4EZ1SXzsa0i599L22ZbxIRZj3G2Uuuq8JnSTPxN+sc4+w9T
	fzzvZtB9oaCPndh+cixDPQ3wQyJYJhcTGfQ4JcfNIqbvzbbpSfvdB9ZWXuRuzKjzcX16
	LmOQfqzBLNSVz0rez+epvE+/PEyfIjOUTTb47DY9TOcgb2tUxmZNjjU8Ml2DElAx4Qh2
	YEzA==
X-Gm-Message-State: ALyK8tI5uPM1ZqsZ1x7ExG0otdVWOgR+gmqhXIKNkR3HEtxguyj28RXBAH/3oBuSWeef5iEp8SIQfl9YTTfd8kMM
X-Received: by 10.176.6.97 with SMTP id f88mr1954838uaf.38.1465393520419; Wed,
	08 Jun 2016 06:45:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Wed, 8 Jun 2016 06:45:01 -0700 (PDT)
In-Reply-To: <cover.1465379116.git.mjt@msgid.tls.msk.ru>
References: <cover.1465379116.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Jun 2016 14:45:01 +0100
Message-ID: <CAFEAcA9t-9YrmffpWxrKF=G2ZUXOHXZMqOgAF3nj9BVA3btSjA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/50] Trivial patches for
 2016-06-08
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
X-List-Received-Date: Wed, 08 Jun 2016 13:45:29 -0000

On 8 June 2016 at 10:47, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's yet another attempt to process -trivial queue.
> 3rd is the best, it looks like :)
>
> I dropped one more patch from the series, per request
> from author, "docs: Fix a couple of typos in throttle.txt".
>
> Not resending anything this time, as the queue is just one
> patch shorter now.
>
> Thanks, and sorry for the noize.
>
> /mjt
>
> The following changes since commit 79cecb3520606c55f427752c0a7a4add8afe2413:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2016-06-07 15:30:25 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2016-06-08
>
> for you to fetch changes up to a2997a1307da24d2e77b656e1a1984d10a39dcdc:
>
>   hbitmap: Use DIV_ROUND_UP (2016-06-08 12:45:07 +0300)
>

Sorry, I'd already applied the earlier version before I saw
this; feel free to send a revert patch to undo the commit that
shouldn't have been applied.

thanks
-- PMM

