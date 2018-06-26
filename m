Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXqFp-0005Bf-B1
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jun 2018 11:51:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXqFm-0005B2-UK
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 11:51:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXqFm-0001YV-5j
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 11:51:39 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:44531)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXqFl-0001Y7-VC
	for qemu-trivial@nongnu.org; Tue, 26 Jun 2018 11:51:38 -0400
Received: by mail-oi0-x243.google.com with SMTP id b5-v6so7333685oiy.11
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 08:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mGkFZMaYaBytsLRPdHFHmanFj711L0QEl3YubsLYvPw=;
	b=BQdyXb9fnRp4tOGY58TUmLjYRqdXEc3ketZO46wv3FM3W6L7Pfr6GK+zGQKCaGN8LI
	nwtr2uiHvUirXP/C5MUsl4k1pfJjcBNSyz4t6OpztupW3pdB3S1EfExROdqvbtr96jF+
	9ZWvv7lWGLX0f4XwIQlb1jPNOw1DJLPTTuUEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mGkFZMaYaBytsLRPdHFHmanFj711L0QEl3YubsLYvPw=;
	b=Ey2P1ups9MrrQgyTmCcsn18aGgnGYgViG5FyaBdzzsXv3AT7CsI2Ntk6GKMZoPUD/S
	7T6rjvLZMq3YfD2lAERanvpqdg+iILz3ZlMtpDubVR+cOcRaK7Mh3aeJhQ4bvKMVlWAr
	6pVIqTMZYO/mT+bMrusOQrFLB7W+p9ACkNe2bcbUUlLLRLOONGUuRaeUVZm/uWgQSQ9W
	xZHuaWyA7BrcIT9uNazoKgDAUswtrjIP6N1q0Y+EqJww9HrQmhNEN6QNeazz7X+6Dk2t
	S7ZAQq8XKml8etGN0xIA8q0y3uWqg0v9B29gUQsg3m78hiyzAvh7m1+po50knvn725jk
	u6lA==
X-Gm-Message-State: APt69E2laYGSFeNixY6e4HddM3BG7cwv/rW/yRpIkHQd964bvS7euR5C
	Ow9rP5cZVsweLjfkPmuysSYJYrd+Xy7Nfba84FJ5Uw==
X-Google-Smtp-Source: AAOMgpem7EDKBZ856TIN7haMTHdm596vPWHMRlOZSR30Ob+d+9t0plrxrH7w9SCIrd26cwvwKxJaqIK3X+EYS5g3jZQ=
X-Received: by 2002:aca:a846:: with SMTP id
	r67-v6mr1217000oie.12.1530028297183; 
	Tue, 26 Jun 2018 08:51:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Tue, 26 Jun 2018 08:51:16 -0700 (PDT)
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jun 2018 16:51:16 +0100
Message-ID: <CAFEAcA96og6eWt2EpmfAnYWGDhouGV8MrDVQ4ADzWv9xC2=_Qw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [PATCH v3 00/16] hw/arm: use qemu_log_mask
 instead of fprintf
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
X-List-Received-Date: Tue, 26 Jun 2018 15:51:39 -0000

On 24 June 2018 at 05:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Hi,
>
> This series is another collection of trivial patches from
> different stagnating branches, OMAP and Stellaris. Time to
> share before loosing them.



Applied to target-arm.next, thanks.

-- PMM

