Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPqlJ-0007J0-Kd
	for mharc-qemu-trivial@gnu.org; Sun, 31 Jan 2016 07:05:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aPqlG-0007IO-V3
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 07:05:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aPqlG-0002z3-7X
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 07:05:46 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:35198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aPqlG-0002yk-3N
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 07:05:46 -0500
Received: by mail-vk0-x230.google.com with SMTP id e6so63321442vkh.2
	for <qemu-trivial@nongnu.org>; Sun, 31 Jan 2016 04:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=eP9lja9g4QbHG50cL1w0EPIrDYWWX54WA+YLG0Dnslo=;
	b=RBVdPvJ14+yxZxjooNB9/FpX+ti9j18Vwr8VquqZHxXyM20/VxQEFZrWzd4c2sbhD9
	7arThbpFC0gtxoVTrELeLB0a9DtYW5QItDlvjGAjV+u7CL9fFmXDFtnnOcJhjHJOKrB8
	DuHV2mHJaFXdfO0FmuNgLqvBEHshuYWTESDCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=eP9lja9g4QbHG50cL1w0EPIrDYWWX54WA+YLG0Dnslo=;
	b=AeWdO6jd5sxXPJjOKNOxjowBo91Rc84zJ85QpNSBO062oiq30E3Y+D4PS27HWQG0jv
	PPYOmtSXC4sC1ImDXG8wBM3x5FrsIo9MfkbTE+oOxiUQQqgVMlOzKGxQz54G7cnzv5Hk
	SFuXMoZt8Y9r127WLcH6jxFkIJn4/jsGCILxu5u2gF9OFAFqLQ2AobOf6bgVjxHPqB++
	oUorWxTS59S0XhO27L8YRLzCB3JI4iawbcxusY8u2bQxN/pxmEoAbByx6t7Y4JG4dnVW
	vQuZjGk5EbD5wBNg/pm5eoT5FRqbU+G2xnWvFh44B/2GyU5NxRp1fpBD0AapOh653XBa
	Q3cw==
X-Gm-Message-State: AG10YOQ4/Tr6h7CPGoyzDy+X7SWY5L0xLnzKlWHURFHY+5pLCkhrimd2VFieuC0tc7UfaJmL76WvER11YhOOuYZP
X-Received: by 10.31.52.147 with SMTP id b141mr12464192vka.82.1454241944466;
	Sun, 31 Jan 2016 04:05:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Sun, 31 Jan 2016 04:05:24 -0800 (PST)
In-Reply-To: <877fiqyw92.fsf@linaro.org>
References: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
	<56AC86FF.2050806@msgid.tls.msk.ru> <877fiqyw92.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 31 Jan 2016 12:05:24 +0000
Message-ID: <CAFEAcA8T0YDsyN9k_LfHzFyd-8UPj61uL8DbJGvvUnmyQ7Mfww@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH v3 0/3] Travis updates
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
X-List-Received-Date: Sun, 31 Jan 2016 12:05:47 -0000

On 31 January 2016 at 08:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Maybe what's really needed is a build and test automation tree (and
> associated maintainer)? Peter any comments?

If you want to be the submaintainer for that, be my guest :-)

thanks
-- PMM

