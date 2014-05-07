Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wi75g-0005h5-Do
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2014 15:01:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wi75a-0005aW-75
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 15:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wi75U-0001PP-PP
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 15:01:10 -0400
Received: from mail-lb0-f181.google.com ([209.85.217.181]:63427)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wi75U-0001P9-IT
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 15:01:04 -0400
Received: by mail-lb0-f181.google.com with SMTP id u14so2003937lbd.40
	for <qemu-trivial@nongnu.org>; Wed, 07 May 2014 12:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=du/sRwLUQo4DKXzEEiTlkD6or9K/xUI4a3UYB9pGon0=;
	b=PqWenrpIRSSaeRjZ1uMc02RZGuUGRtq77fc12efEuJQ+7wGfCf/9mb2ipGFCMapS6q
	GZFMrLZ4TRVreIyQ99hJpULaEPuGjqghtzD6Za/NXsT3FSvSMiJZC2GQQgrXxwipVpsA
	OhvoWMr8FnOjePRenVl6TNKk8nTvjuXP8cjsF3OZjFl1TNkEX8LBfCNevYaMoiTIBE4f
	Ihrtt3svJ/HOymY/Psfj56GknTbdx0UtHXgkyuHSVJtUlsYfbLQOAN0lfg3zIY197kZr
	bOVeyCdUMUlXgMG/igHp/WA1OcJmKD5aBXsh4eParbHoOgJcADRJFWXFV+EyNUtX0Pal
	DQNQ==
X-Gm-Message-State: ALoCoQmlORooUtkecJbIMgRmzHeN0t9l7s9ElwgeXINW2JCgDEH07LRQUZmE42GQ0NcjbWNxwJWO
X-Received: by 10.112.154.102 with SMTP id vn6mr4377544lbb.55.1399489263150;
	Wed, 07 May 2014 12:01:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Wed, 7 May 2014 12:00:42 -0700 (PDT)
In-Reply-To: <1399482202-22544-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399482202-22544-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 May 2014 20:00:42 +0100
Message-ID: <CAFEAcA_AUJfAgdHP=6wE9dv9aowXVS+aOwvPhP4SaR0YbNMF8Q@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.181
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/21] Trivial patches for
	2014-05-07
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
X-List-Received-Date: Wed, 07 May 2014 19:01:15 -0000

On 7 May 2014 18:03, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Another pull request for trivial patches.  It is the same as previous
> (2014-05-05) but without the problematic Makefile patch.
>
> So I'm not resending all the individual patches, as they're the same.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 8d1dc5d188b84a2b2aeb9bd39fddb3d2c67be60c:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20140507' into staging (2014-05-07 16:06:38 +0100)
>
> are available in the git repository at:
>
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-05-07
>
> for you to fetch changes up to 8e25c274ae5830cf879fa5d2d7f98f4d6f5aecfa:
>
>   libcacard: remove unnecessary EOL from debug prints (2014-05-07 21:00:44 +0400)

Applied, thanks.

-- PMM

