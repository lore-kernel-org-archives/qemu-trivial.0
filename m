Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WelQz-00041D-0T
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 09:17:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WelQs-0003s4-O1
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 09:17:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WelQo-0003Vo-1n
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 09:17:18 -0400
Received: from mail-lb0-f181.google.com ([209.85.217.181]:51833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WelQn-0003Ve-RJ
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 09:17:13 -0400
Received: by mail-lb0-f181.google.com with SMTP id z11so3790552lbi.12
	for <qemu-trivial@nongnu.org>; Mon, 28 Apr 2014 06:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Zdq2mfzTP0bv9ycx5Lf+LZBfy6dXhKG4+J1EUQwKS8Y=;
	b=hhftU4HHJC2orOdyhVFA77E8aRXNjYvWUUI/4/YpO2ad2Js+OBkeRbaNeNLMfRthoD
	noTkTDHxOGU85yVRF2b4y2ozvK0n8m9HlbaldEYG1kTGIuXfc2AYvzVaES9QEUeaRBow
	Uj2pIYfJkn1ByvClVJgDNgB7ryds8Jfq0PqcrKMngqTcW5LQ9dKrgY7oFNUuofk1E7AT
	gf/KoOT2tM1EOuXfM5AsiAOmBkofH3hma4bGkxlCnCSP5cKgtrlicagOAgLvjLyxZ6Jz
	1Re4BNrpbwj/wxbqEf/st43ZbsRZ0n3RtmeOpAeltjfAT2lEWAyCEc2tJyLdgEN9d3eo
	+Sow==
X-Gm-Message-State: ALoCoQmP5lL69fAR1Z/RLUgoQnX3NoBeNCxGFXw4oN7T7/oCYxAFAcYm87CLddud47dG0O6p4Oio
X-Received: by 10.152.43.168 with SMTP id x8mr142436lal.60.1398691032505; Mon,
	28 Apr 2014 06:17:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Mon, 28 Apr 2014 06:16:52 -0700 (PDT)
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Apr 2014 14:16:52 +0100
Message-ID: <CAFEAcA9GSUYPMOUNafBkX-F7ETfV3xhjOeqGhc8pifxDOhwDyQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.181
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/18] Trivial patches for
	2014-04-28
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
X-List-Received-Date: Mon, 28 Apr 2014 13:17:23 -0000

On 28 April 2014 06:07, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's another trivial-patches pull request.  I removed all
> questionable or still-being-discussed patchses from there
> which accumulated recently.
>
> What's left are either code cleanups and rearrangements,
> spelling fixes or --help output improvements, adding Qemu
> logo file, one feature patch which's been waiting for too
> long (conversion of -m to QemuOpts), and several small
> bugfixes.
>
> One change I want to mention especially, it is this one:
>
>  slirp/smb: Move ncalrpc directory to tmp
>
> While slirp code has a maintainer, Jan Kiszka, he never commented
> on this change since initial patch submission back at Nov-2013,
> despite several subsequent pings.  The change _is_ trivial and
> fixes -smb with modern versions of samba.  We've been waiting
> for this (trivial) fix for too long.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 411f491e0af173cf8f39347574941bd26fbae381:
>
>   Merge remote-tracking branch 'remotes/rth/tags/tgt-axp-pull-20140424' into staging (2014-04-25 13:25:22 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-04-28
>
> for you to fetch changes up to b87b8a8b32518df9e5285f9b3d4f9d9a0c426a06:
>
>   slirp/smb: Move ncalrpc directory to tmp (2014-04-28 08:55:32 +0400)
>
> ----------------------------------------------------------------
> trivial patches for 2014-04-28

Applied, thanks.

-- PMM

