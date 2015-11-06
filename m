Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZuhMP-0007a8-Ph
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 08:47:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuhMK-0007V3-Fr
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:47:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuhMJ-0001Qt-LZ
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:47:16 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34718)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuhMJ-0001Qi-IF
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:47:15 -0500
Received: by vkgs66 with SMTP id s66so14250696vkg.1
	for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2015 05:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=d66zMKdCdvxUD7VvSUUBZ8m7iZQgmF25cdSd45S/Lr0=;
	b=GvPYnHdYVB7xByFeN9Y4vaYR7gFw5y00bfdJuMPSe9ZJvZEuF0VZtL2IBAA3wqr6aA
	VE8I+01oqk2mqGYHm2nRH6b2KaVjIuXRyEI4cN1ihTACO3jbneHS0ubNrKeWdFHsaGTa
	MRpm3+Ky/k8oJrQvseIMEEIiTuM1sXpiHk5omLunmf8uMYRiakh1MuhpeQS+npVfSMPq
	CDwcVDI0+AOI7PGPFsYStAtvSslKucvX2aBIqkTbuPNnOSwTnc0x5WGDdft5lvuNQ9NZ
	lMLHxfXXXDdQ5QqbQOb2n7d4MkmJnxtaImWP5F2BXqzhFd6tLto8PUJTEQ4bMOXbOO7i
	ythw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=d66zMKdCdvxUD7VvSUUBZ8m7iZQgmF25cdSd45S/Lr0=;
	b=WoHm1CPBx69BFIJAaCbDWUYd/6ggjWUEOCX98hZr6LLNB+K4nZHIfuH5//zodraWCy
	LZZpbVpzXcdEeXaV3Zh7MOi54G/PTKquHys/cd66Ol+xPU8j6QTGMgaFKz2zAP1E4KFZ
	ttRjImTpMGSG6hereSx3boN4e+pBepMrH3960Cyq7migs/DKAl1eHlRyQ0rS/JXE7qqK
	dijXS6K6juT94VgkEVAYLnw5d0x6N2M/T4hRiVQZo8mQRy/UvFxypPN4kIAkUgvHkM5F
	rbsZ5KcEuyvsF4VLw24hWOXWuRgzvA/223JaiIZcST2YksWbe0syV7lQv1p7hefEPpPf
	x1CQ==
X-Gm-Message-State: ALoCoQnl6XoKyv1PLd89KrdFEXXIZM+5ukFVelji7Rx9k9YlXeOj9v5NDDoO30yJeemFB35M3eSt
X-Received: by 10.31.54.86 with SMTP id d83mr13127760vka.139.1446817635156;
	Fri, 06 Nov 2015 05:47:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 6 Nov 2015 05:46:55 -0800 (PST)
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2015 13:46:55 +0000
Message-ID: <CAFEAcA_RApKQBc98prONwG+FSK25vSnn4Y_pkFrTOXGyt=jTGg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::229
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/24] Trivial patches for
	2015-11-06
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
X-List-Received-Date: Fri, 06 Nov 2015 13:47:20 -0000

On 6 November 2015 at 12:43, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Another trivial-patches merge request.  Lots of various small
> things all over.  Please consider merging/applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 9319738080faeb09876ce2017fcaea4937c475ee:
>
>   Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream-replay' into staging (2015-11-06 11:31:40 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-11-06
>
> for you to fetch changes up to bd54a9f9435c85de190a82019faef16c5ecf8e46:
>
>   tap-bsd: use user-specified tap device if it already exists (2015-11-06 15:42:38 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-11-06
>

Applied, thanks.

-- PMM

