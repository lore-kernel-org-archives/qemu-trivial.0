Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1egVpF-0007GA-CA
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jan 2018 08:19:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1egVpB-0007CE-MA
	for qemu-trivial@nongnu.org; Tue, 30 Jan 2018 08:19:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1egVpA-00038k-T8
	for qemu-trivial@nongnu.org; Tue, 30 Jan 2018 08:19:45 -0500
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:34645)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1egVpA-00037g-O5
	for qemu-trivial@nongnu.org; Tue, 30 Jan 2018 08:19:44 -0500
Received: by mail-oi0-x229.google.com with SMTP id k15so7759271oib.1
	for <qemu-trivial@nongnu.org>; Tue, 30 Jan 2018 05:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kS7vJyq5rWSGXNS6bQJAUGGAYMob585J5+HqjXxtPdY=;
	b=Bh1udXvV8dSKjiv4sOzgS3RoteQpAhFBYAlTsVnYCYk77T7Dp89Wk2z1Cq6fUGIRTp
	8t9rnShEUaZBpJcXowT9U8oC3H5AwVchPz5orIYLoV3KXij3g/0f16yi1fPMWBa2caa8
	Q1HHqXonzXVGgkFZqZjAIU5H8VtduX5aXg4u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kS7vJyq5rWSGXNS6bQJAUGGAYMob585J5+HqjXxtPdY=;
	b=maZ+rPQJzV01AZ/BuDXk1Fgzn3VDSzLnYKQTHZLWWuQsX8azdQhsQrIUa98XjoGT3p
	KY8vxfNeSn+qe2Jq/QHn+6BvimagM5Uc7wjjRBV8os4d1paX2aBL2Jj5LVEvjtsvNbeM
	ai/jVjBXbtBEZIun3EqOIU9m1O0fkh0fG58MTT5WjtlcOL1/Heodtqoe653xRht+3Yx7
	BmEgAZErBtCcFVWiBwODvCTo7Yno9fyd0RNqS4KbllMWHt8TMCI7zdE4BXRcYCuAwvYc
	lG0ktxkEHR/MOoFQgOjyqX86E6kG3e6CVDlYfu3rJOrcLfkDSCDo8yQY3d/MPZ4OHrkZ
	WRrg==
X-Gm-Message-State: AKwxytcAfalF+f5ASV/Ns/Yavt6ZYyTs6dcZgOuYzaOoFIyVGOc9MWP0
	AN86JGjG695kJBAfMFLQtZz0telTBsj1gHAi8UK+BA==
X-Google-Smtp-Source: AH8x227gMpwbR0iY1tK+m4noay9yqYWPOSLXSzlK/dRmuIX7K+xiyYRkImZS1FYgvb8Ov8Ysfoi7em8QtF43tZhxnck=
X-Received: by 10.202.26.13 with SMTP id a13mr3966150oia.8.1517318383821; Tue,
	30 Jan 2018 05:19:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Tue, 30 Jan 2018 05:19:23 -0800 (PST)
In-Reply-To: <20180130131716.5899D7456D5@zero.eik.bme.hu>
References: <20180130131716.5899D7456D5@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jan 2018 13:19:23 +0000
Message-ID: <CAFEAcA-ZQ7pnRCwuFj51pqdgjyBAz9S5hkLTczCSwq5Lmaompg@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sii3112: Change angle
 brackets to quotes in #include lines
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
X-List-Received-Date: Tue, 30 Jan 2018 13:19:46 -0000

On 30 January 2018 at 13:10, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> This matches what other files do for qemu includes
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

