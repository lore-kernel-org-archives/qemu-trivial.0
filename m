Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vup4S-0002Uy-F5
	for mharc-qemu-trivial@gnu.org; Sun, 22 Dec 2013 14:52:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vup4M-0002Ui-Ig
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 14:52:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vup4I-0003Rm-9B
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 14:52:10 -0500
Received: from mail-pb0-f54.google.com ([209.85.160.54]:53034)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vup4I-0003Rg-2h
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 14:52:06 -0500
Received: by mail-pb0-f54.google.com with SMTP id un15so4535079pbc.41
	for <qemu-trivial@nongnu.org>; Sun, 22 Dec 2013 11:52:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=M+3Ua00nl3qTeMoBEvVG8E1g3lTtUqasmSI29c3TNxo=;
	b=mLJwCtfmJZtdjSZbJgUQOpCr/d9j6o63Yzlwwv7eYZMzwPf4I2+CW8fvkRKMO68DZN
	xzjC1Ixn8jc3qpFjMQV7ZjOPY6JbYvlu5vL5HfUei5RbUcT/9bOK1KmGPRTN2y/ssn71
	ekLQJzHlXIbQuVyGBtVuFVER3rSzLFh6+iTtRpGC9IEHHHejhvQnNRaEgMsQYIBlzmKv
	HIUShfklr4CyuapAd/0wxzY6ZdKA9LToQdfXz1jrjdpEJV5ECGKW3yM8oHhgC7HXEVBr
	SvaPMJuo1g0gXfX3RbCAR4eDdptbsf+1oy2cFcOGLH11OiIGccILQdsR/8gXiKCKJWtT
	qzlA==
X-Gm-Message-State: ALoCoQkJA6K65Qboh7GL6izTuF6WFNM1oez0pSgpgbHBgys8J38yWzfr0A7CpSlpTNzZU28AnHiW
X-Received: by 10.68.143.231 with SMTP id sh7mr22055255pbb.7.1387741925253;
	Sun, 22 Dec 2013 11:52:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.70.82.227 with HTTP; Sun, 22 Dec 2013 11:51:45 -0800 (PST)
In-Reply-To: <1387741325-14588-1-git-send-email-sw@weilnetz.de>
References: <1387741325-14588-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 22 Dec 2013 19:51:45 +0000
Message-ID: <CAFEAcA_VhncPTXGVXVdXP94kE-sPz+j3Vpc_8koFcxbX4do1xw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.54
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v3] mainstone: Fix duplicate array values
	for key 'space'
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
X-List-Received-Date: Sun, 22 Dec 2013 19:52:15 -0000

On 22 December 2013 19:42, Stefan Weil <sw@weilnetz.de> wrote:
> cgcc reported a duplicate initialisation. Mainstone includes a matrix
> keyboard where two different positions map to 'space'.
>
> QEMU uses the reversed mapping and does not map 'space' to two different
> matrix positions.
>
> Some other keys are either missing or might be mapped wrongly (cf. Linux
> kernel code). Don't fix these until someone can test them with real
> hardware, but add TODO comments.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

