Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1JvN-0005yp-EC
	for mharc-qemu-trivial@gnu.org; Thu, 20 Apr 2017 17:47:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1JvL-0005xI-58
	for qemu-trivial@nongnu.org; Thu, 20 Apr 2017 17:47:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1JvK-00024x-5w
	for qemu-trivial@nongnu.org; Thu, 20 Apr 2017 17:47:35 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:36049)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d1JvJ-00023z-VY
	for qemu-trivial@nongnu.org; Thu, 20 Apr 2017 17:47:34 -0400
Received: by mail-wm0-x22a.google.com with SMTP id o81so3066219wmb.1
	for <qemu-trivial@nongnu.org>; Thu, 20 Apr 2017 14:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JPQWioTjdVZsY1oPw5/7C8yAnhV/I22MljkOMpJv6pI=;
	b=VWBKFW45zWZC+RuAU2puP4tDN47L8l4uVyFqEU+F3LDv0LBdJ34CYsMrY0abpD8vjO
	f0dfRO3TnHQOFaRyiI9NKmuN8+QzTQHqZO47br9AR9V85GihWcnOIpvzsAszOwN7TIQa
	jhRPHcK9639rXicgZbouslpsZjYXSPtjolja4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JPQWioTjdVZsY1oPw5/7C8yAnhV/I22MljkOMpJv6pI=;
	b=ZGBwWAhSod6hF+zP3kA2QRUPsRIjG6+GdxVWUZ1lRmnqobmQx9qd332u31cFJkbVP2
	94QrHUMlIuGD/3pPN3xZ2JPyAiuSMvJvQlUhsFJGzOjUcnj4FdqDWkgMyotJ2EVnhyZE
	8lnRFtyMguiNHq0WpdwXB/itXu8XsYD06DBQz6i8ESf9jlsKKvYR6EuS7i1dBvzAUaZU
	f6IKYGYGcWiPRBmxIBQhXOtBJRj8Jb8+yVF7oa3OBwV8Y+FELdjvcyE5p1x+JknrpeDo
	A7l1J2GfAzGzVAaC0qDrVhjtZ6tAMu7WbhTOiGMTZK1PIsUsz3gHV/Jo3wFqQRNRCfLj
	3xCQ==
X-Gm-Message-State: AN3rC/5/uzot+PF5xsfoOeRXTgVMCqkfIiDLq5QUKW67pO5iIkrmF4rN
	0LLXdn+wwMSQk7jDwyCM/l/jcKiKSYMh
X-Received: by 10.28.34.130 with SMTP id i124mr5027544wmi.111.1492724852829;
	Thu, 20 Apr 2017 14:47:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Thu, 20 Apr 2017 14:47:12 -0700 (PDT)
In-Reply-To: <33474e1b82c6459604edec522cee585ccdb871ee.1492721026.git.balaton@eik.bme.hu>
References: <cover.1492721026.git.balaton@eik.bme.hu>
	<33474e1b82c6459604edec522cee585ccdb871ee.1492721026.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Apr 2017 22:47:12 +0100
Message-ID: <CAFEAcA-Q7PaT0ejkXHCTnUkfsOHUg8HdY7KtYc0Bo7On3+oDhg@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-trivial] [PATCH v5 07/13] sm501: Fix device endianness
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
X-List-Received-Date: Thu, 20 Apr 2017 21:47:36 -0000

On 20 April 2017 at 21:43, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> We only emulate the sysbus device in its default LE mode and PCI is LE
> as well so specify this for registers and framebuffer memory.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---

I think it's worth a comment to the effect of:

Note that though the Linux kernel driver has code which
claims to handle both big and little endian, it is obviously
bogus for 16 bit and cannot be trusted as a source of
information on the framebuffer pixel format. This is
our best guess about device behaviour based on the specs.

(so if we find ourselves wondering about this mismatch
in a couple of years time at least we'll know why this
end is the way it is.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

