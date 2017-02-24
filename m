Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chGt2-00065y-Dj
	for mharc-qemu-trivial@gnu.org; Fri, 24 Feb 2017 09:30:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chGsz-00061d-Me
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:30:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chGsz-0005d8-1u
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:30:17 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:37783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1chGsy-0005cX-S5
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:30:16 -0500
Received: by mail-wm0-x231.google.com with SMTP id v77so15806164wmv.0
	for <qemu-trivial@nongnu.org>; Fri, 24 Feb 2017 06:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rFxKTqnhJrmIj9+zrbUyp3dfrbzl76V2JSqjg5nNr+M=;
	b=NdULdXfff0fx8RiPciRIIlX0whno1Q42dWGhTvqDCi3wj3YtNERLi+cBwGQc8pLXdF
	VyRsbB2F3g+KPVwu8AWU+IKn51T+y1KZ7FWCI6DhezAkpKaGV08pmouhSNKc8UABmTg+
	A1p6Vvv1R/KnP0w1rA3yd1fzAF8xWte1pqV/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rFxKTqnhJrmIj9+zrbUyp3dfrbzl76V2JSqjg5nNr+M=;
	b=tLJupRX+lIZMj24blFgxFzXLJluO5tyifaz4+cO4eLKVq1SQcxPWR8PtVstl3WC1Sj
	aPq4KjJD5yttwbnaffdgEJrLnCOwq8n0uSGZAkLwVXFMi2VSQPhtJL9MrRRrYC0/mmYb
	ccTghY6xKEm5b6woU33C3I3Cl1z76j0ijruge79/KbZqLaFDh7lsTsDSXBzG7/18mQS1
	MPQkSUOxjWbF1EF3oLvNhbmmCNBr+CitBvn0CqvYn1I0nA8k9R7QFWQPXuMrt7aqqw26
	/KKMGGnUyG5g+I6C0q4ll+RoEqF2BtrSNa0jDSFtx42EmI3LS3k4JtVnEu3wE5rNP2NV
	ux+Q==
X-Gm-Message-State: AMke39mLQrswytKdrG/9aYUGULoKnshyzMn1nInzdNpYM0HoGNqOwozSatkVi73kSoc73jpSA3JU+loBu+V5nZvF
X-Received: by 10.28.189.135 with SMTP id n129mr2880224wmf.92.1487946615911;
	Fri, 24 Feb 2017 06:30:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 24 Feb 2017 06:29:55 -0800 (PST)
In-Reply-To: <5b3304341ddd333f929a6587e019c21a16a08c8e.1487522123.git.balaton@eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
	<5b3304341ddd333f929a6587e019c21a16a08c8e.1487522123.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 14:29:55 +0000
Message-ID: <CAFEAcA_SOSFTzGSXEnuqbS8A=9U=id6kY0x6CqNaaYGgA2KL1A@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/10] sm501: Fixed code
 style and a few typos in comments
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
X-List-Received-Date: Fri, 24 Feb 2017 14:30:18 -0000

On 19 February 2017 at 16:35, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/display/sm501.c          | 1132 ++++++++++++++++++++++---------------------
>  hw/display/sm501_template.h |   52 +-
>  2 files changed, 594 insertions(+), 590 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(checked the ignore-whitespace-only diff.)

thanks
-- PMM

