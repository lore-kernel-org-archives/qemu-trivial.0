Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hGYrT-0000NK-R2
	for mharc-qemu-trivial@gnu.org; Tue, 16 Apr 2019 20:55:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stephen.checkoway@oberlin.edu>) id 1hGYrR-0000MK-Jz
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2019 20:55:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stephen.checkoway@oberlin.edu>) id 1hGYrQ-0001nj-Ln
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2019 20:55:37 -0400
Received: from mail-it1-x129.google.com ([2607:f8b0:4864:20::129]:39053)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stephen.checkoway@oberlin.edu>)
	id 1hGYrQ-0001nO-GP
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2019 20:55:36 -0400
Received: by mail-it1-x129.google.com with SMTP id 139so1762725ita.4
	for <qemu-trivial@nongnu.org>; Tue, 16 Apr 2019 17:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oberlin-edu.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=+BQ4ulsEbegWudLY6CiTHTPm8mbvLyuYR8uCnW5CktM=;
	b=cx3H55bJ+IyGWKPxu23IUKE5bb2JwOM5y4chwWRCzISprgeUm41BHYpgYPc1iIRvMC
	+3nFnkcw6+eX8NBaiuOoEwtfPVGtgCpiZADSoJu6NWyh2JqGGH24TO7c5rCLXBPcWbZA
	CcuJB1jD+M3IASy2uxFnLmrmqK5MRFWeeQoRtjczZK6gPLtnOPoJxgHrBB54KLqHfvql
	UrBFqjGxRy8iZ1m5ej5pAxgt+mbSfjnbLVAlYRCh2opBa2nk7As24IeXWQmlHxQFNO3l
	hWRbjGcN0UAcZQyYTBxfz3Nges8Rvoz9ev0S2Xee44wAIS839KpGx5LHOeKbv3keAIh5
	EVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=+BQ4ulsEbegWudLY6CiTHTPm8mbvLyuYR8uCnW5CktM=;
	b=Th3cm2EUCcWDhiCwEaRpWRZYlfwAxh0BiSxgQ1DxeWsbJF0CRw7jYyNK/hw/tDrnhZ
	UavWxFK3OqfKjxR16EJBASJzNGgpeQBjW2cEwKEskGCJwwK4QI67dMKU2LLrx5I5Oh+O
	0iZxa6cE8X0VtWaZGjPnM0QH6O5tf9DHSfXVq5Dx1u+opapHgQy3jYpceeTaA64s6iZx
	WeJgGLMwXB3KdY6b6wFaHL5tAabTrRZCKUWTC12xRZD7cifx9MX/eBAyFceFeBHQHpki
	c7Xgkbvzbf8OUiL+W0Fi4Urzm9ZtOemrfUpaoEys8C4K2CT5hafkwYHtUaAhPgCjkRjU
	yKgQ==
X-Gm-Message-State: APjAAAW0EXlVspJnsn3vFd/4dQjIr5LuZQHEbIA9uDDLNnchSAtFh29P
	AfWf2Y5XKHPh8T2hSSQOhvObAw==
X-Google-Smtp-Source: APXvYqy4xf7QoaQ2126adGE2bQCYCySLuxw6k2p3qbndMgmSyZc/R3WSTxvFPuaLUoXwJ+9b+zK5Gg==
X-Received: by 2002:a02:b097:: with SMTP id v23mr58410904jah.42.1555462534968; 
	Tue, 16 Apr 2019 17:55:34 -0700 (PDT)
Received: from worksec.oberlin.net (ip-210-181.oberlin.net. [208.66.210.181])
	by smtp.gmail.com with ESMTPSA id
	w184sm577780ita.9.2019.04.16.17.55.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 17:55:34 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
In-Reply-To: <1328f591-897f-8762-d324-cccb5f63a360@redhat.com>
Date: Tue, 16 Apr 2019 20:55:33 -0400
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org,
	=?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3BCE3056-7CA2-4DAB-8F7F-87E9E1F481D4@oberlin.edu>
References: <20190305051007.56009-1-stephen.checkoway@oberlin.edu>
	<52a82d3a-3b79-c61d-93fa-f087af45f6fb@redhat.com>
	<1328f591-897f-8762-d324-cccb5f63a360@redhat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
X-Mailer: Apple Mail (2.3445.102.3)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::129
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/char/escc: Lower irq
 when transmit buffer is filled
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
X-List-Received-Date: Wed, 17 Apr 2019 00:55:38 -0000



> On Apr 10, 2019, at 16:01, Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com> wrote:
>=20
> So your description and patch makes sens.
> What worries me is the controller could have other pending IRQs to
> deliver and you are clearing them. Shouldn't we only clear the
> INTR_TXINT bit, and call escc_update_irq() which should lower the IRQ =
if
> no bits are pending?
>=20
> Maybe as:
>=20
>    s->wregs[W_INTR] &=3D ~INTR_TXINT;
>    escc_update_irq(s);

I just sent a v2 patch (but it looks like I failed to include Philippe, =
sorry about that!)

I used

    s->txint =3D 0;
    escc_update_irq(s);

which appears to do the right thing in my tests.

Thank you,

Steve

--=20
Stephen Checkoway






