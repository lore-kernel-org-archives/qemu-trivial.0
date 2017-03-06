Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckpyI-0002hq-Dv
	for mharc-qemu-trivial@gnu.org; Mon, 06 Mar 2017 05:34:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckpyG-0002h6-Gz
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 05:34:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckpyF-0000Ty-0S
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 05:34:28 -0500
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:34029)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ckpyE-0000Tc-Rb
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 05:34:26 -0500
Received: by mail-wm0-x229.google.com with SMTP id 196so17441226wmm.1
	for <qemu-trivial@nongnu.org>; Mon, 06 Mar 2017 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0UlSssOJWbZyoQnJ5IVwyOugNYBzaMRwyodXiDfixf8=;
	b=JLjxW89/CQtjRnQpWywVnCef9wil4RongBD31Fry3nhy4KXwrxoi/FUgwSNRTFdJBy
	I2TmpxWh1QwqRC2H4+8cHEGByxaoa8wjS8rMtundEVwnPk86gNsi9h/Xxlui/wTqZEMV
	LyA/oNzWMI2lboBHRbM/wDjcaHofJ8kZmZhS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0UlSssOJWbZyoQnJ5IVwyOugNYBzaMRwyodXiDfixf8=;
	b=an4+gy4rI5dXELwTJl57QvKF//6ev5s87VjwhHuZhKhA6fV3b27zFigoU98+q4yVCa
	traa5YhOXQQkDT0x09oxK65nXp410eD1B2d61/7DBUJ3AfSreE5c4O5GTeA/jNSQFR8f
	YTpepQavfYUqaXrKu2wo/c8oiKTssLuxWM23vuZ02hZmnCjB78oRsJXMFUBNh2MLMjun
	DRrkXkqsEEE1zbEX8aJnO7fFJ0YRA9/E0UDdPHSP3uwaiiQy/Gkyv2SuDGINvA+5s3+q
	JUKyMKgjMzKNrUgYuoDywdCqt1rmqmiOgzc4jv8FmLQOYC1KEv+TKsUtoylyXiIp99M1
	6uWA==
X-Gm-Message-State: AMke39kOPgYv7WiKNNSMWTA5suWEBYBrTFomD9Ljhhwm1kKdk/CYS3Ja6gjSBgcfRU18f0ftPFhZIslJIyl4Hhrd
X-Received: by 10.28.172.68 with SMTP id v65mr12416551wme.111.1488796465835;
	Mon, 06 Mar 2017 02:34:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 6 Mar 2017 02:34:05 -0800 (PST)
In-Reply-To: <4bd61f7ecdba6f205e30f0b712c65036951f1375.1488665935.git.balaton@eik.bme.hu>
References: <cover.1488665935.git.balaton@eik.bme.hu>
	<4bd61f7ecdba6f205e30f0b712c65036951f1375.1488665935.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2017 10:34:05 +0000
Message-ID: <CAFEAcA_PY09pjLdQ4Kb2w-cywJUPRsLo5Wq9WPbVeR2-LHY+cw@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-trivial] [PATCH v4 06/13] sm501: Add emulation of chip
 connected via PCI
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
X-List-Received-Date: Mon, 06 Mar 2017 10:34:29 -0000

On 25 February 2017 at 18:31, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Only the display controller part is created automatically on PCI
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

