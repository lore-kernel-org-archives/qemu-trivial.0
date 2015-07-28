Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZK3uP-0003Zt-Ou
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jul 2015 08:23:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZK3uM-0003Xt-SX
	for qemu-trivial@nongnu.org; Tue, 28 Jul 2015 08:22:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZK3uJ-0003PI-Cc
	for qemu-trivial@nongnu.org; Tue, 28 Jul 2015 08:22:58 -0400
Received: from mail-vn0-f48.google.com ([209.85.216.48]:34148)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZK3uJ-0003Ot-8l
	for qemu-trivial@nongnu.org; Tue, 28 Jul 2015 08:22:55 -0400
Received: by vnds125 with SMTP id s125so42031820vnd.1
	for <qemu-trivial@nongnu.org>; Tue, 28 Jul 2015 05:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kM7wcy6CPWSGt45EIAkIq0iNxUPafkroQ5Zar6GbruY=;
	b=X6iumv8ttlz6pmiYEERFOJA5bGqzB7VwW5JmYiU4hva3aK+Hk3l5QE2KxuGFpDmiHV
	APL7a+4PVQmWDtisbkIMcVLxOc1BVhiFaNKG+RK0EUaWfzqSzRsABAP4lUTM51a0+kZh
	lwQ3pb4oR+ch2vDsTheRD208FFUAONJvmuTa2w68YGqn20urkCXc3NC8e5/1M9DfD5uE
	AuU4FRobLbIHSdYwX1hgzf6Y8hzAy4LvOB2GF03/qM5JBr488DusgZ1uIEVoSP1JGef+
	O3+rsmmSKKJMayZPAqP4QIDSpaMp/L0YXll9APHDLa/2Ouf2IOyeLk/cbjv5Mzh64M3z
	YL1Q==
X-Gm-Message-State: ALoCoQmQxB89lujt5IX9+1jU46MNosLMZHxfvMZdr8WwXczj669gW0yBbNFe6Kh26PKsZ/EhKFX1
X-Received: by 10.52.166.18 with SMTP id zc18mr40818660vdb.41.1438086174855;
	Tue, 28 Jul 2015 05:22:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 28 Jul 2015 05:22:35 -0700 (PDT)
In-Reply-To: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
References: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2015 13:22:35 +0100
Message-ID: <CAFEAcA89mRwP8j0Z5me+08s7FErMW5_OKSfW7m2BTRAA=8FYYg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.48
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL for-2.4 00/10] Trivial
	patches for 2015-07-27
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
X-List-Received-Date: Tue, 28 Jul 2015 12:23:00 -0000

On 27 July 2015 at 20:54, Michael Tokarev <mjt@tls.msk.ru> wrote:
> There are a few patches from the trivial queue which are, I think,
> suitable for 2.4.  These are fixing or adding docs/comments, are
> minor/trivial cleanups, or small bugfixes.
>
> Please consider applying for 2.4.
>
> The rest of the trivial tree will be pushed once 2.5 development
> window will be open, hopefully  I will be able to do that by when.
>
> /mjt
>
> The following changes since commit edec47cfef96209987cb7922286cb384916aae02:
>
>   main-loop: fix qemu_notify_event for aio_notify optimization (2015-07-27 17:12:19 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-07-27
>
> for you to fetch changes up to 226d007dbd75ec8d0f12d0f9e1ce66caf55d49e4:
>
>   gdbstub: Set current CPU on interruptions (2015-07-27 22:46:16 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-07-27

Applied, thanks.

-- PMM

