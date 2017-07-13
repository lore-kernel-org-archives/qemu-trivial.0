Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVgUV-0007BY-An
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 11:57:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dVgUS-000798-Jj
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 11:57:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dVgUP-0002Od-JR
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 11:57:20 -0400
Received: from mail-wm0-f48.google.com ([74.125.82.48]:36849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dVgUP-0002O9-DM
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 11:57:17 -0400
Received: by mail-wm0-f48.google.com with SMTP id 62so27864000wmw.1
	for <qemu-trivial@nongnu.org>; Thu, 13 Jul 2017 08:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qnv276cH6pwo+aHBYAIBiWNEEV0C5hhWsXANSlUYDGQ=;
	b=ew+CfrGWqR+FKiG7kX7VZUFk3ceI1S+tGhWN/IgtaF4SQtsce1G3XTYyJ9r8G1bxfu
	iUyanxwk28R/lkCsNPrsppVU3VhZR3FSIBDllqunex35lS/B0+XoAsW3YYjw2BaAfvXi
	H83ca6v3YmfkXdgZbmn7Z2308DLacf0S9k/Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qnv276cH6pwo+aHBYAIBiWNEEV0C5hhWsXANSlUYDGQ=;
	b=ks2IZTyVcgjtCT7IIkCfGmWPpcs3T8dCPwaPOcYQMgAxcLAibL7wL396VYyM8WhSyg
	kbROqatI9Kdcv/Rlgvqyyw+AXoc3QgdsTWgHCqH8zYXhDWG/mTn2RayhO8t6oEgv3Vn6
	twGTBv4lH5etMJnf7kZuKcQpjx/EOn2UCcqv3qVJZU7gru6VRPCRhCE6KfLAWQclArVM
	ZRJMNI7SndH3XSXNJLxvYYUGGQ8/j3avy4m+bIP4Ux8+anCCRd9WwSCH0Rbeh+Cx6lbK
	8DEYn9L/8ooBQzw+Kaxwwkiv9N/NE/Mkeyp75zBhsMSY95C92QvVGeYCMyCf8JqF/IPA
	/FcA==
X-Gm-Message-State: AIVw111AS0SR+mULTBsWqa6udXrm805o0adjiGeIRABsK1qtgJ+ZA80B
	+vjIDqabjPqNotetxEenrBBnQ4tgw0iC
X-Received: by 10.28.191.74 with SMTP id p71mr2461646wmf.45.1499961375931;
	Thu, 13 Jul 2017 08:56:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 13 Jul 2017 08:55:55 -0700 (PDT)
In-Reply-To: <cover.1499867930.git.mjt@msgid.tls.msk.ru>
References: <cover.1499867930.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jul 2017 16:55:55 +0100
Message-ID: <CAFEAcA-1ehg6oet1wa40r85mxzFzuMFdTo3REM=n-8AG0zgK5w@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.48
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/11] Trivial patches for
 2017-07-12 (#2)
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
X-List-Received-Date: Thu, 13 Jul 2017 15:57:21 -0000

On 12 July 2017 at 15:00, Michael Tokarev <mjt@tls.msk.ru> wrote:
> The same but without two patches from Eric Blake.
> Not resending all the patches, only the cover letter.
>
> The following changes since commit 6b06e3e49eb8c91cc286c16d6bf3181ac296f33d:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2017-07-10-v2' into staging (2017-07-10 16:12:47 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to a7a305aee1e9a74a3f4b263aa98babed795b1f0a:
>
>   include/hw/ptimer.h: Add documentation comments (2017-07-11 17:44:27 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2017-07-12
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

