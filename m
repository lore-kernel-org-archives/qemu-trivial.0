Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZuMW6-0007rb-Ds
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2015 10:31:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuMW3-0007nt-PX
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 10:31:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuMVy-000366-Rd
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 10:31:55 -0500
Received: from mail-yk0-x231.google.com ([2607:f8b0:4002:c07::231]:36619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuMVy-00035w-Kc
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 10:31:50 -0500
Received: by ykba4 with SMTP id a4so136538278ykb.3
	for <qemu-trivial@nongnu.org>; Thu, 05 Nov 2015 07:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=f+KjdLhlQ05hPuv6xJMO6mq5opdmPDZQ26HehNkKdlI=;
	b=APLdhti6Cnj9R+bMeNCGG5HbF27hfs+TXAdKYwQIFrpmjaIpJJEQyMTnk7/FIz/yhO
	N7iNZ8r8ntREQK2R428zXS5W/01dSQZkPXyfE7NgJAu012V4euvGvXSJayXBkYl0FOUx
	FEsA6xaKGrrUS6ConzTKi0wuqw1CFrqvcKBZA/x2vBVX/UDHMqMxX9zAc7N9j25QQD1a
	hpSylZD2bOW8O+Ur6oiZF7GqN6Tr0b3bczdB+IR0hkBfHv/boPkgeIqcDU4qAflZeOOc
	YPKDp/chzteoXbdtpb9Qvii5kAWPdnOcQzOIpqh5kYr8+ZIrY6HJ7ManKOFhVhD2siOR
	z0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=f+KjdLhlQ05hPuv6xJMO6mq5opdmPDZQ26HehNkKdlI=;
	b=ey5lzt/3oddEVJBqapxqSRe36zu9aK73/X1mRqMrAcljIYaxVEoXZmw2xT716Errz6
	AjOQ7s7pPJWJmqb1emDlrTb4kYLIPUdkUMLlyDHvR/24kqJacbWgGdaUL6PtR4bOj4s3
	iy5NPsitdzXphxcwgS5IpfXrOp8doLkWk0On/aCFYcx6YW7upOlZNcSU8dgyH/IYNIir
	4OqmtwglISC2aUcASzadiNrYKCi3CHm6Lj57fuI6mYtRPrqcVjowKgBljfPfNsqVFTYP
	OnjYDlhVgKvTJiZfUCpzy+2wDE0gv75FyJnjNfUpblGuJ+c1iDqM1ffSE8IeNh3r492G
	VjLQ==
X-Gm-Message-State: ALoCoQkbpu08gni6PbR6ZVbOeEEKxAYBG/AkJZDTIdZTYTjj3Oiqq4PU4pB24f3qEv5oxtNEW96R
X-Received: by 10.31.107.81 with SMTP id g78mr1728238vkc.6.1446737510244; Thu,
	05 Nov 2015 07:31:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 5 Nov 2015 07:31:30 -0800 (PST)
In-Reply-To: <1446736357-17610-1-git-send-email-wei@redhat.com>
References: <1446736357-17610-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Nov 2015 15:31:30 +0000
Message-ID: <CAFEAcA_9bk0DONJPK3DtDN-_Ym53TDq-83pzGg9-JSt3LTdcNg@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH Trivial] hw/intc/arm_gic: Use pre-defined
 macro for cpu_num in code
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
X-List-Received-Date: Thu, 05 Nov 2015 15:31:56 -0000

On 5 November 2015 at 15:12, Wei Huang <wei@redhat.com> wrote:
> Given that there is a macro, NUM_CPU(s), defined for CPU number in
> arm_gic.c, it is better to use it instead of using s->num_cpu in
> this file. Code is more consistent after this change.

Hi. I think that actually since the NUM_CPU is just a relic from
when it used to possibly defined as something other than s->num_cpu,
we should go in the opposite direction, and remove the macro entirely
in favour of just using s->num_cpu directly.

(PS: you forgot to cc qemu-devel.)

thanks
-- PMM

