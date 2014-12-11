Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XzBZl-0008Ns-6Y
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 16:47:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XzBZf-0008Nf-9a
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 16:47:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XzBZZ-0005US-Mr
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 16:47:03 -0500
Received: from mail-la0-f42.google.com ([209.85.215.42]:43043)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XzBZZ-0005UG-GE
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 16:46:57 -0500
Received: by mail-la0-f42.google.com with SMTP id gd6so5160274lab.15
	for <qemu-trivial@nongnu.org>; Thu, 11 Dec 2014 13:46:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EwYFk3UzwrzoRhz41F+IwoR75lJ/jIQrrkEAzz32XpM=;
	b=bpetMb64uKVsNnqxz2f+YfNODXJHKwDtyXBxYIckbV/q8cxfbKBtvPCOCfm9jyVqx8
	dWibUu3HK9eCjFSo0fyHAMNvtYE/kyypn4B40iy8tWtKwLJ2fiPLfFVbarP50gYp8sLi
	4tnv5FfUkCUqyiNj60+Gtjj/+Su2EO9KFaBNTasX8BhxytAa7zclrZ6Ti9ZIKGr+ajXJ
	Z9jKSErysWBVShKTLvH8KhswfPu3+9NaPxuI8DppvU68Vi0Fci9x7IBB35S36S2ArNLL
	jhjxg6xZxpDx2BfqNoL16ibFqt7USgcwXw7CCmPN05tBbjFGNXS9ekfjd4lrfL4OkxnI
	eTWg==
X-Gm-Message-State: ALoCoQmal8Irrd2ayTAy0+JGso3xtyQFkZuf5PE5pIwxDszvG8DYv+8/DwweajTP3DqUgi6IU7hg
X-Received: by 10.152.7.180 with SMTP id k20mr12449111laa.4.1418334416577;
	Thu, 11 Dec 2014 13:46:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.150.135 with HTTP; Thu, 11 Dec 2014 13:46:36 -0800 (PST)
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Dec 2014 21:46:36 +0000
Message-ID: <CAFEAcA_gBJmCqxN496u-5KaA0TO+=9wODwYnZa+6p7ekdCqt_Q@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.42
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/20] Trivial patches for
	2014-12-11
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
X-List-Received-Date: Thu, 11 Dec 2014 21:47:08 -0000

On 11 December 2014 at 18:15, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is the first pull request from trivial-patches tree for
> quite some time, I was quiet during 2.2 freeze period and here's
> what has been accumulated during the freeze.
>
> As usual, there are many small things from Gonglei and some good
> stuff from Marcus, plus some more from others, all pretty much
> trivial.
>
> Please pull.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 7fb8da2b8861795e0013e6ee97acd0363d868a35:
>
>   Open 2.3 development tree (2014-12-09 21:48:34 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2014-12-11
>
> for you to fetch changes up to 64baadc2726ae929660dd0c61a42e8d9f3ba1828:
>
>   Sort include/qemu/typedefs.h (2014-12-11 21:00:30 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2014-12-11
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

