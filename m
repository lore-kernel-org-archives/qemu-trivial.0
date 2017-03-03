Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjs2C-0007X1-40
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 13:34:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjs2A-0007VD-3K
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:34:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjs29-0007op-AX
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:34:30 -0500
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:34046)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjs29-0007oF-56
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:34:29 -0500
Received: by mail-wr0-x235.google.com with SMTP id l37so79439658wrc.1
	for <qemu-trivial@nongnu.org>; Fri, 03 Mar 2017 10:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=07IOtRBn08FnGtDg2kj1huPGIN2r/J7xWagD64/kHmg=;
	b=PM7JMdXo1OQrm6yeayyRxMJeyBy7FKtpxchE1+9tlClX3fqh09aJ4X3BcW0pDwOMB3
	+6VCxJ+pbPX8sbTqPdQfn7g9eGsEMbCvm+WLNDbPQGllE2VU/Kdnb+AmYJuC37vfTE2c
	hwzM1e242U5peKQjBrTtcI+0R6In4AaiS7Ivo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=07IOtRBn08FnGtDg2kj1huPGIN2r/J7xWagD64/kHmg=;
	b=BoyYgnrdg/RKpzZ9EIBubjV8MnUU3gvcj8N7oXRZ/ew6kwWPjuWJEU24k2l6vr2/jd
	DCpM9ageCKnn+uVujE9Brry04r1NLxC7pEHLr5XtPPIvBOnipqz9qydOBdSN8N7zFe4p
	cWppLCiUF2ErP39bAbOEtXuBrMy58Kh9lhEnnKLtn87/KrX7gM194ophrrAlpobjbGYa
	yE+tA09Z4wbPrjttNYYm9UvjI7DqksliviSEhMQMGEcoaKqvxGq9eNoHDGnGgCuWRaHA
	l4RIehCgwXAjlBGpijzQ5s6e0JuIx9gvGxgLnU8B5/iiAOgTxHEpmF8HTXHo5O9lyN79
	o3ug==
X-Gm-Message-State: AMke39mu0tFmz5d3ScHgNAX6xu8DTTdCx9a0VIN/vFHXpTs09ttFZ9l/Qbk4eIZgionmgc3Cd/TtFnTvs4eQIOu4
X-Received: by 10.223.169.45 with SMTP id u42mr3762127wrc.187.1488566068100;
	Fri, 03 Mar 2017 10:34:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:34:07 -0800 (PST)
In-Reply-To: <b819972a1e18972a95894c8ce91036200792062c.1488504063.git.balaton@eik.bme.hu>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<b819972a1e18972a95894c8ce91036200792062c.1488504063.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:34:07 +0000
Message-ID: <CAFEAcA-H8idiLw55T7g9buZEF8bqKb67Y2kcZ7t6i5vnKDMAuQ@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-trivial] [PATCH v3 12/13] sm501: Add vmstate descriptor
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
X-List-Received-Date: Fri, 03 Mar 2017 18:34:31 -0000

On 25 February 2017 at 23:53, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>
> v3: Added local_mem_size_index to vmstate, add vmstate for sysbus version too
>
>  hw/display/sm501.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 99 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

