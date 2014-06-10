Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuPH4-0007pA-UB
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:51:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WuPGy-0007e8-B2
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:51:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WuPGs-00016P-1C
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:51:44 -0400
Received: from mail-lb0-f181.google.com ([209.85.217.181]:54020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WuPGr-00015J-RE
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:51:37 -0400
Received: by mail-lb0-f181.google.com with SMTP id q8so4138818lbi.12
	for <qemu-trivial@nongnu.org>; Tue, 10 Jun 2014 09:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DOP0GAEcyXqf5zg272XAUjU2kECL8FX7kjwcuJhBQss=;
	b=L1sBDH+EFpf7BrWemlD+URIrHBJd3geTswjAAZ8GV4IJgVU7LCpMGF85/mwIXCzoad
	69tW0amxz32xURH3laNCTnikNsxvIujh36Kg460v2pfWqnzn58ILYN5fpq59ZoUVRkfq
	Qo/Yhw6UvkESIXR7g6Ng/EaCfPCRweUKNxE607EyJWRPZEZSRCBDeDi7dTxnClgsOLdN
	oDGaKhFnCcn0fsy9w2uQFIOI+hwgDRpSVR1GJv9QllWl/wtmBeX7CbZGxsmtg8OQaNlA
	ey/9ExXAZ4SXSoyFmVTCp6kiq1xH5zxH7AxCFFrDLo7b7z91QVuVa/ssNPcu0o/gsFPK
	tNDw==
X-Gm-Message-State: ALoCoQlmNmZacTnbkinzFnH4f+0bLCkNqh8VaOG1X9koKTcZr/41MrccDHtknQj/hKcHMF8mQzPv
X-Received: by 10.152.18.133 with SMTP id w5mr2447284lad.60.1402419096713;
	Tue, 10 Jun 2014 09:51:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Tue, 10 Jun 2014 09:51:16 -0700 (PDT)
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jun 2014 17:51:16 +0100
Message-ID: <CAFEAcA8xiqVe3TTua7U_KD_EnMi25hfTuprHPEOQfDQ__QDr5g@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.181
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/25] Trivial patches for
	2014-06-10
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
X-List-Received-Date: Tue, 10 Jun 2014 16:51:49 -0000

On 10 June 2014 17:08, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Another trivial-patches pull request.
>
> Lots of small things all over this time.  Mostly by Peter Maydell ;)
>
> There's one sort-of questionable patch by myself - fixing error message
> in virtio.c, which is "shiny new", but I think such a really trivial
> thing is fine ;)
>
> Please consider pulling.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 3334e929ae2d01e47c3e64757ee7fcf975cede94:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/pull-console-20140610-1' into staging (2014-06-10 12:06:17 +0100)
>
> are available in the git repository at:
>
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-06-10
>
> for you to fetch changes up to 1a2858995d283ddad4a745460d1cc770a9b93fc1:
>
>   virtio.c: fix error message (2014-06-10 20:07:01 +0400)
>
> ----------------------------------------------------------------
> trivial patches for 2014-06-10
>

Applied, thanks.

-- PMM

