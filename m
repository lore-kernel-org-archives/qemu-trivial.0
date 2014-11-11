Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoDv2-0002Zn-MV
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 11:03:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XoDuv-0002ZO-Eo
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 11:03:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XoDuq-0001Pu-PB
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 11:03:41 -0500
Received: from mail-la0-f42.google.com ([209.85.215.42]:46287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XoDuq-0001Pm-IO
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 11:03:36 -0500
Received: by mail-la0-f42.google.com with SMTP id gq15so9829971lab.15
	for <qemu-trivial@nongnu.org>; Tue, 11 Nov 2014 08:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xSCqhhMdtP6p9CI6Z14jzQkUCVRqjGk6EQYWPDc60jo=;
	b=FN8aRf8FqPKny0BU0/DKL8YvSsFGp2dnUGI0bGVDNotVpoiedXsEI1R0zPl7QJhJpd
	arFpHF5DDNlEFxGWjCg4pkcZwNBISJbfSma5baGqMhpsyAl4ZBDD8hEJDeYY4H6cTHKW
	KqWltmysd0BApZZPZL13CBl/WgezM3E4ZsAIn3nOT4IQ4OX3oSBUAUdo4Ks0vPGckVPZ
	+Caqty34L9O7lq0PuvZSGfu6dFrhoyw5JpAJLZIPVdhGftHzysy4dh7VXiPPQ9W9+eNu
	7C+ohfcvpDw1qv0sbPNSoLwiOmL6upmbb3bf8zuBdj3vlxmsIeiusN719QmPR3jfvE8o
	SCUQ==
X-Gm-Message-State: ALoCoQmKQGIBNVHttSowmlvpP4jXE3f4Mz1nPoonJseQ47S9LMzpkV9/xGiZzK05N+iLVBI0pgwu
X-Received: by 10.153.6.9 with SMTP id cq9mr10267602lad.79.1415721815346; Tue,
	11 Nov 2014 08:03:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.150.135 with HTTP; Tue, 11 Nov 2014 08:03:14 -0800 (PST)
In-Reply-To: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
References: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Nov 2014 16:03:14 +0000
Message-ID: <CAFEAcA8TUOMx-NmoxGBHQb1Bx=x3ZWB=B4L0yt5rFrvWxG6Oag@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.42
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/11 for-2.2] Trivial
	patches for 2014-11-11
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
X-List-Received-Date: Tue, 11 Nov 2014 16:03:47 -0000

On 11 November 2014 14:46, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's another week's trivial patches pull req, for 2.2 release.
> There's nothing exciting in there, but some patches are worth to
> mention.
>
>   4/11: numa: make 'info numa' take into account hotplugged memory
>     this one has been pinged several times, and the numa
>     maintainer agreed to push it using other tree.  It can
>     be considered a bugfix for `info numa' output (not taking
>     some memory into account), and while somewhat large for
>     -trivial, it is actually rather trivial
>
>   5/11: gdbstub: Add a missing case of signal number translation in gdbstub
>     a bugfix to allow gdb debugging
>
>   7/11: coroutine-sigaltstack: Change jmp_buf to sigjmp_buf
>     this one is a bugfix discussed today
>
> Please consider applying/pulling.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 7135781f65f1267a72bf554ee2b7bd605f9e59aa:
>
>   Merge remote-tracking branch 'remotes/mjt/tags/pull-trivial-patches-2014-11-02' into staging (2014-11-03 14:55:17 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2014-11-11
>
> for you to fetch changes up to 705be728c0b5546da10d8ef4239a112d1616bb97:
>
>   block: Fix comment for bdrv_co_get_block_status (2014-11-11 17:36:19 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2014-11-11
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

