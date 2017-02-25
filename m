Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chf8Q-0006e2-5a
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2017 11:23:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chf8N-0006bo-Dw
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 11:23:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chf8M-0005Jv-Mq
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 11:23:47 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:36662)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1chf8M-0005Jf-HK
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 11:23:46 -0500
Received: by mail-wm0-x22e.google.com with SMTP id v77so34196409wmv.1
	for <qemu-trivial@nongnu.org>; Sat, 25 Feb 2017 08:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CEgc+V+7jtqcU6PpOcBfRuEu09McwYdvG+VMi+7Anis=;
	b=AHMLDpLTqHlnLpq7RdeqAIFzILWNCs5L8JFqJFtz9zABUerwpPLl8ld4HCBzVP4sZA
	FNqhj6jFD0Un0jml9ZvUCSrMyS3Px+EIwcPWq9nom97dO04Ne4AYSQvG66olgZz0uwTU
	o2Bf5H5PlOqWcLoBgiZpR6iGCzBcfcqnrqbP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CEgc+V+7jtqcU6PpOcBfRuEu09McwYdvG+VMi+7Anis=;
	b=QA0B4Ifqfy8dl5sJjdQeSdZJihJMknNFrZoXDzJVo6CU2F2u+wwNdJGboK3Uhd71qn
	0SEr6HK9k4RpkU4F99w0CxtoOAddFjaDOj3lufMUrTKFeliEALZqfNKUVSCs7bs3M0N1
	Pvosx5BEKg5HiKCOZOOdT5QHiJ+dxoU30cLJhF7uW8vUrDpKTG6QS8AifGa1LfqPqpaF
	Xk7IvCTIzm+yNCAC8T3ntv6W96TW6i28e3g8Ua6KCru3vR3uFHYXqdlLBVBKZLXA73ZJ
	mqOD6b/S4JgtjowbaJa8ZK1n4YRWQytDlELa0B2Jn2+EWerSTGqyu3oIee1cZrgSd2VF
	7Aag==
X-Gm-Message-State: AMke39ldU97RlOdVbfTHcVzFwxQCKNzQZX+u5juQgfwTPDwRF8MF+3F/2ktV8QmQxlwtw6+gvODl5zEdFFiNurWK
X-Received: by 10.28.189.135 with SMTP id n129mr6933192wmf.92.1488039825526;
	Sat, 25 Feb 2017 08:23:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Sat, 25 Feb 2017 08:23:25 -0800 (PST)
In-Reply-To: <alpine.BSF.2.20.1702242135160.76443@zero.eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
	<e87856482b30803a17c5af8124dad9454c0bed86.1487522123.git.balaton@eik.bme.hu>
	<CAFEAcA8jd10oqz6R4RDC5pOrsXxOMft9q0sghBUqvVpduJ3K1Q@mail.gmail.com>
	<alpine.BSF.2.20.1702242135160.76443@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Feb 2017 16:23:25 +0000
Message-ID: <CAFEAcA_AoCPUGxrC434x1EvOpPOogK7XERRZfPCcSspb9dW+Hw@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 08/10] sm501: Add support
 for panel layer
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
X-List-Received-Date: Sat, 25 Feb 2017 16:23:48 -0000

On 24 February 2017 at 20:38, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Fri, 24 Feb 2017, Peter Maydell wrote:
>> Please don't change variable names in the middle of a patch that's
>> adding new functionality, it makes the patch harder to review.
>
>
> Where should I do it then? Again another patch?

Yes. Either make it its own patch, or drop the change altogether.
Anything that makes the core "this is making a bug fix or
adding new functionality" patch bigger by adding unnecessary
code change to it makes that patch harder to review.
(Conversely a patch that's just "change this variable name"
is trivially easy to review.)

thanks
-- PMM

