Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chHGv-0003Yd-PS
	for mharc-qemu-trivial@gnu.org; Fri, 24 Feb 2017 09:55:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chHGt-0003WV-8J
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:55:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chHGs-00019w-K4
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:54:59 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:34857)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1chHGs-00019R-EC
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:54:58 -0500
Received: by mail-wm0-x22d.google.com with SMTP id v186so16467548wmd.0
	for <qemu-trivial@nongnu.org>; Fri, 24 Feb 2017 06:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HHnf8a0kdOWoUmPj6DxhZQ3upsQ78t45aXCbSngfgcY=;
	b=bRR3JSfPX0FcB5Akaaidx0ybZyud1MpxFbzjz3GU7DxVmajqGY+4h5YGFqSjyxyzMg
	yz+FgnEdgb/eQ6lIVIJZmYpu9Vr4FQT40Jd20309if1bpQxrW/xy07waXz7fsSuhdJ52
	qFD/ZqNudXaYK9F6BWEk8uAeLFkdf+qKt+B7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HHnf8a0kdOWoUmPj6DxhZQ3upsQ78t45aXCbSngfgcY=;
	b=bGbtCEVl00jGrT55GYg3ENfUJLP4XP4/AK6Z9TPLtylAWvZtS9GmcxmxGjBU19s1e9
	W7vFhADI8By69K4Mj/r3p5NN2Spsj/ClgdMXY7xL6ZqBX6pM024FwbIdM4e8zQv8SGdy
	8hhKqh8VSZYnyz8KuV/6DIUgEe6vlo+4j6c723YDCIp2fZb0oC6FS97YWBUNwSO/NKeL
	Rvc3vgMyozHjs4mgL4BcSGwvohyf4pN/8/I4QOuz6ztuBIgKgoRuc3dEvBTUXrHDZZh3
	an+a22DePvrJYOzIENMAjDZknk/bir2/6ydn1+dOmp2U805LDu0vyxhGHNYVvj36ZRMD
	ehaQ==
X-Gm-Message-State: AMke39mLq+271KhmKOt5jdzBeCi0iF8ldzswNSOZo+Pt7iaywosqcoHvhJr5r3rjnP4GuO8KF1JEAtLWS+WUyyBr
X-Received: by 10.28.4.10 with SMTP id 10mr3151573wme.142.1487948097285; Fri,
	24 Feb 2017 06:54:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 24 Feb 2017 06:54:36 -0800 (PST)
In-Reply-To: <8936f97ffdf6fe9a71a300113019bfdba0ecef23.1487522123.git.balaton@eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
	<8936f97ffdf6fe9a71a300113019bfdba0ecef23.1487522123.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 14:54:36 +0000
Message-ID: <CAFEAcA9m8Yjwjn_B5aBZmWVwXXVj7-BQ1_d76ED4bg3cAWw=bw@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 09/10] sm501: Add some more
 missing registers
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
X-List-Received-Date: Fri, 24 Feb 2017 14:55:00 -0000

On 19 February 2017 at 16:35, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Write only to allow clients to initialise these without failing
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

What's the point in write-only register values?

What does the real hardware do here?

If the registers are writes-ignored, there's no need to store
the data written into the state struct; if the registers are
reads-as-written then implement them that way.

(If they get state struct fields the vmstate needs to be
updated accordingly, as does reset.)

thanks
-- PMM

