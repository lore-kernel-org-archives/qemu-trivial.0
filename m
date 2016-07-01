Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bJ0xh-0006ew-4y
	for mharc-qemu-trivial@gnu.org; Fri, 01 Jul 2016 12:06:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ0xe-0006bD-IC
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 12:06:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ0xc-0000DE-Gj
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 12:06:33 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:34778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ0xb-0000D5-Vp
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 12:06:32 -0400
Received: by mail-vk0-x232.google.com with SMTP id c2so159060823vkg.1
	for <qemu-trivial@nongnu.org>; Fri, 01 Jul 2016 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CvRg1NVjwh93AW1tX2XOM2/QCWQG5apINANBmugzAeU=;
	b=YCLMVbAcCj21QEttVQIRSZS8WkVkCWkq5XkrFSaXq8onTLusbfL++LtDVVK0VZSFBo
	6rAkYDfEHrMCurUb5AKYHqLyevBkLYFRxvDqK3EWyd1ebAPAONjetNUc6wEcCfFTyZeh
	6WOjk3Zb2rmzQUIeTGj6ZfiRbFmJWnqJVfo8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CvRg1NVjwh93AW1tX2XOM2/QCWQG5apINANBmugzAeU=;
	b=UkoNaUXDeT2fdEeiW/IPE2V7wmzLa+g7pcdHlP7nI2Q3in8dM7cSOyl0/fU2osDxVm
	EyS4exPybKdtUJtettDl/YTGVRp/lkRZwepaA2yZA8qM6kIp/0AkiffhHJDm4B43iX7t
	/VpxhRfDJifVOwX4PtPdBq7x1oNdqjlBHpkste7bQtB6e6977w3NDrgFw/oCr7l4eEHq
	tAwK8MYA1Se/KX0eD5iik2Jvdheke6/hM5N5pAZvOU6L8JTZjkNTRNBlEvBvQRUHEuaN
	TFSU6Xj+YZPTWeBiMbnaay/rnpnpSDcpTBrhzuv8vvlLYiVJiJJBm2pde6iJZagun3uE
	6kow==
X-Gm-Message-State: ALyK8tLoglp34oq9QPkGQNnCdkvxYe4HOulIR2fVRLRefLshQq/B0x8aoRizrI5shSIiOBqrEpfQXQoGLYcGJukp
X-Received: by 10.31.188.80 with SMTP id m77mr9561124vkf.30.1467389191536;
	Fri, 01 Jul 2016 09:06:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 1 Jul 2016 09:06:12 -0700 (PDT)
In-Reply-To: <6E700AE9-9FC8-4B5A-9065-1772A858EAAA@akamai.com>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
	<CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
	<6E700AE9-9FC8-4B5A-9065-1772A858EAAA@akamai.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2016 17:06:12 +0100
Message-ID: <CAFEAcA_vGgujpvUF2Mj+mzDXia5T24iaMSAjV5eYx5U0CaYezQ@mail.gmail.com>
To: "Wirth, Allan" <awirth@akamai.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Riku Voipio <riku.voipio@iki.fi>, 
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: fix signal()
 syscall on x86_64
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
X-List-Received-Date: Fri, 01 Jul 2016 16:06:35 -0000

On 1 July 2016 at 16:34, Wirth, Allan <awirth@akamai.com> wrote:
> Thanks for the feedback. I didn=E2=80=99t find that patch before when I s=
earched, so
> apologies for the duplicate submission.
>
> The proposed fix certainly does seem cleaner and more general. Does it
> imply though that this patch is incorrect? It fixes the emulation bug
> in my use case, and AFAICT does not introduce new emulation bugs.

Well, it depends what you mean by "incorrect". It's pretty common
in dealing with a large and old code base to find good opportunities
for small refactorings when you investigate a bug. If we allow bugs
to be fixed with the smallest and most expedient change, then
problems gradually pile up and the codebase becomes unmaintainable.
So we often ask patch submitters to do a bit of cleanup in the
process of fixing their bug.

In this case, fixing the bug in the way that I suggest will
fix it for all architectures, not just x86-64, improve the
code by deleting an #ifdef, and remove a trap that will otherwise
be waiting for the next new architecture that has support
contributed to it.

thanks
-- PMM

