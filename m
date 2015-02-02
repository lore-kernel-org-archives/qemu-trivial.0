Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIIR1-00034W-8R
	for mharc-qemu-trivial@gnu.org; Mon, 02 Feb 2015 09:57:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YIIQz-00031n-0p
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 09:57:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YIIQv-0001Zq-S1
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 09:57:04 -0500
Received: from mail-la0-f53.google.com ([209.85.215.53]:47412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YIIQv-0001ZV-Lu
	for qemu-trivial@nongnu.org; Mon, 02 Feb 2015 09:57:01 -0500
Received: by mail-la0-f53.google.com with SMTP id gq15so41620507lab.12
	for <qemu-trivial@nongnu.org>; Mon, 02 Feb 2015 06:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=d+OHwKj5xcPjrWpQ5l/pdnqvjhuAmUOVM7r2aQ7Zv/U=;
	b=RmYioSxsYIjwxiECofqeDMvv+kMExL2QPv7IqcZ1dwrq0QaIU+hnvCZOKTx7g+oTkT
	Tz7kr+iRUjo9RXBn6OAihe+rcuU1yzJbWkDzojjDhJdbSJgMnvgUr7TgtqfDuliJyAwH
	Yz5ZRCa4o9C1IeKR90wGLXCJ8Lriw3JU/zCva2dxht3Qn3hOfCWQ5g1GX9QA0Us32Zc7
	K1xocfbCW/NwjdWUNVBbcTYef4u8Qz7P1Viny47HAE4f4iL5iHIfMdz+SVqY1vkPN5i/
	I9GKg5NspnVuxeEPcmzCkNSqwSrj4aAsn9pFxOyEDze27vbGSmdJgjhDUbtc/f5lNOgr
	P7Lg==
X-Gm-Message-State: ALoCoQlHgEY05yl4rtIMux6fRRdXCYHF7NNXzvizthQ7ZZub6tUGEP7Qt1YiDATYpZI3CJARw00d
X-Received: by 10.112.85.11 with SMTP id d11mr19912801lbz.100.1422889020603;
	Mon, 02 Feb 2015 06:57:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.141.97 with HTTP; Mon, 2 Feb 2015 06:56:40 -0800 (PST)
In-Reply-To: <54CF811A.1020405@partner.samsung.com>
References: <54CF336A.7080205@partner.samsung.com>
	<54CF33FD.5020003@partner.samsung.com>
	<CAFEAcA8fz+Dy3DGSWX3xne+k=egx=PznB0STrGGtbYGT0D=CPQ@mail.gmail.com>
	<54CF811A.1020405@partner.samsung.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Feb 2015 14:56:40 +0000
Message-ID: <CAFEAcA8YkS3=QPQrWeW4w-sZ24ixCaKEFRy23um5tYxABt8YKg@mail.gmail.com>
To: Maxim Ostapenko <m.ostapenko@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.53
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Slava Garbuzov <v.garbuzov@samsung.com>, Riku Voipio <riku.voipio@iki.fi>,
	Yury Gribov <y.gribov@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Fix ABI incompatibility between
 Qemu-aarch64 and Linux Kernel in signal handling.
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
X-List-Received-Date: Mon, 02 Feb 2015 14:57:06 -0000

On 2 February 2015 at 13:52, Maxim Ostapenko
<m.ostapenko@partner.samsung.com> wrote:
> Peter,
>
> thank you for review and sorry for sign. I've updated the patch, is it ok
> now?

The code looks ok, but...

> From 5b035df58f9f17e64b35311b6b5f55097c7f8ce1 Mon Sep 17 00:00:00 2001
> From: Max Ostapenko <m.ostapenko@partner.samsung.com>
> Date: Mon, 2 Feb 2015 12:03:20 +0400
> Subject: [PATCH] linux-user: wrong TARGET_SI_PAD_SIZE value for some
> targets.
>
> Fix TARGET_SI_PAD_SIZE for S390X, SPARC, ALPHA and AARCH64 according to
> Linux Kernel 3.19 c59c961ca511dc7ee2f4f7e9c224d16f5c76ca6e revision.

Your signed-off-by line should go here, in the commit message
(one blank line, then the signoff; look at other commits in
git to see how this should look).

Also that part about s390x/sparc/alpha/aarch64 in the commit
message isn't accurate now the code has changed.

It's also best to send new versions of a patch as complete
new emails, not as followups to the previous one. That way
automated tools for tracking and downloading patches from
the mailing list will function correctly.

thanks
-- PMM

