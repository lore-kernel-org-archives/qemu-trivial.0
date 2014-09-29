Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XYYRj-00063S-Mf
	for mharc-qemu-trivial@gnu.org; Mon, 29 Sep 2014 06:44:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XYYRd-000637-1z
	for qemu-trivial@nongnu.org; Mon, 29 Sep 2014 06:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XYYRV-0000mN-04
	for qemu-trivial@nongnu.org; Mon, 29 Sep 2014 06:44:41 -0400
Received: from mail-la0-f42.google.com ([209.85.215.42]:49112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XYYRU-0000l0-Px
	for qemu-trivial@nongnu.org; Mon, 29 Sep 2014 06:44:32 -0400
Received: by mail-la0-f42.google.com with SMTP id mk6so1438646lab.15
	for <qemu-trivial@nongnu.org>; Mon, 29 Sep 2014 03:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jiRVd6yDdOTPmnvvEdbw6V8Y8DLjrIbPqnUlCX1H8qI=;
	b=iJgWQfuQce4f4hNEScjrpckTgfi7dstgmSkzOIEEc8ySdHccCKvg8ViPEXh0lJc08l
	8q3NyuwxYgLcqpsP9HXwyeFB2Qg6lwxtEXnDdriLZaR2v0YVfvoKfgM2wTtRKOY2exNL
	xjcH+i5If6UpfK2dmz49LmDXxDllPoHsHqzW4jH2Y3QNr8mLoRdPR4HuHxGlIhcg/gKF
	b7+T81rkNTSsBudBkLthbzLEzuWBwKMT3AzKsIgavIhfcRpArIUcWZUo3Ri7sD4F16E/
	zcqG8fJURi7eo2FKM4sj7rgQmZeSeADaIamVWRtLO4WkupOAQ1m8Egg0RWObod7lyRKG
	0FVw==
X-Gm-Message-State: ALoCoQnitwcChLz5bAVMrNRK5MmevdWOGvHGAVLKlwXKR3tqyvyryuS/lzeyt2EgFYoL3fWB7uQD
X-Received: by 10.112.72.10 with SMTP id z10mr7905918lbu.87.1411987466758;
	Mon, 29 Sep 2014 03:44:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Mon, 29 Sep 2014 03:44:06 -0700 (PDT)
In-Reply-To: <1411752976-29051-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1411752976-29051-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Sep 2014 11:44:06 +0100
Message-ID: <CAFEAcA8r7hVBZ1+XDtpjmj+cZigAs8ngLoShpZGWzqi2OJvDmA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.42
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/12] Trivial patches for
	2014-09-26
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
X-List-Received-Date: Mon, 29 Sep 2014 10:44:45 -0000

On 26 September 2014 18:36, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here goes another trivial-patches pull request.  Cleanups,
> travis.yml changes, coding style changes and a little
> bugfix for stable (avoiding running qom test twice).
>
> Please consider applying/pulling.
>
> Thanks,
>
> /mjt
>
> The following changes since commit da1c4ec88ad50c2b73d5fe960c373693f7337cc9:
>
>   Merge remote-tracking branch 'remotes/stefanha/tags/tracing-pull-request' into staging (2014-09-26 12:26:07 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-09-26
>
> for you to fetch changes up to e5048d15ce6addae869f23514b2a1f0d4466418a:
>
>   os-posix: report error message when lock file failed (2014-09-26 21:21:09 +0400)
>
> ----------------------------------------------------------------
> trivial patches for 2014-09-26
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

