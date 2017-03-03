Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjrs1-0001Uv-DG
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 13:24:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjrrz-0001Tz-2N
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:23:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjrry-0003XX-5B
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:23:59 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:37970)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjrrx-0003XG-V9
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:23:58 -0500
Received: by mail-wm0-x232.google.com with SMTP id t193so21817209wmt.1
	for <qemu-trivial@nongnu.org>; Fri, 03 Mar 2017 10:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BRBr1TuXxpOP+T0iaL88u6mjWngo2z/NTTh1+ApvMEU=;
	b=koszhhHj2pAi0sNqUXWc7DgDlGe2h9OIpkg34+FMZktywUsVLrd+QgODK7VDLhIna8
	iMlZmysO+JrhE5ypjikL2qm2ursX8v0wp7p9xUQFrh7tgJa+sGl5Uugy6oGVTwi39A9K
	zSgXOrWkYH/sDGFQXxbdg11uOGn3apXqsnN1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BRBr1TuXxpOP+T0iaL88u6mjWngo2z/NTTh1+ApvMEU=;
	b=cR/VMuNksUbz5JAmaEPGYyKBR9sWs32UZAZ35m0UKqDhqDtK7FGviYdTm/bOVihq5v
	3doTjdUstJ8+/xyZKeLYixNXfDEYoiDDPLulUpsPGQrL61/7Mp2UksVyntASdf1U8+vj
	YR+mDGJPhFLrg70Zg1/sPTSVmj2DYbD6SzwEpqaygGqeWKTnzpeiwOJK3MN54p9udGkm
	RN9q7xAyEJPd2qjAiSfIRBzwjIePpERkwizdeYifYrzdJAqphEdm+SIFLALhvO5KlygV
	q+lC8EB0lX+xpzsKVri9YZvZeJO+yy3KU1ZSIvT/LTwX1wWSeI163yCgbiNG1UqbNyo+
	e5Ig==
X-Gm-Message-State: AMke39lQARXKk95g7r0XI3ksvoOTjdX4C+5UMeN0pmGTDtAtUt4lGpHtu9dmmAMSg9pcGUVS+EQPD/UH2cVD87Zq
X-Received: by 10.28.157.67 with SMTP id g64mr4136435wme.111.1488565437088;
	Fri, 03 Mar 2017 10:23:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:23:36 -0800 (PST)
In-Reply-To: <7e582e5ca2aaa7b8b6c1f8a040562b099767ff81.1488504063.git.balaton@eik.bme.hu>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<7e582e5ca2aaa7b8b6c1f8a040562b099767ff81.1488504063.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:23:36 +0000
Message-ID: <CAFEAcA8n=k=i=FCoSPV=+8UczU-cGJcUHUUd488D1=eVBCxW0g@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-trivial] [PATCH v3 04/13] sm501: QOMify
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
X-List-Received-Date: Fri, 03 Mar 2017 18:23:59 -0000

On 3 March 2017 at 01:03, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Adding vmstate saving is not in this patch because the state structure
> will be changed in further patches, then another patch will add
> vmstate descriptor after those changes.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

