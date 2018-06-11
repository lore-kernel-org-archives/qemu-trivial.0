Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSPsJ-0003TL-0p
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 12:40:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSPsH-0003Sy-CF
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:40:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSPsG-00089c-Ke
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:40:57 -0400
Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b]:34305)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSPsG-00088m-F9
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:40:56 -0400
Received: by mail-oi0-x22b.google.com with SMTP id i205-v6so18483744oib.1
	for <qemu-trivial@nongnu.org>; Mon, 11 Jun 2018 09:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e/MEGPnEAlF5LmlF7KH7LZWGIGaUp5ndrAM1/HEjKDY=;
	b=X9gT/RAMBfeoUlKvUtS/oUxzElng+UCJ4ekdAwQM+wZBlgtwxdZpT4uwZXbo/9ALAv
	hXEKzT/g0UW404Nhh8rZPL78tJYvEyZ1b4R3a2CW+0DyuUZ5mbvIIu5FhKd+K+5Afz9L
	+oVTb3eI0yTTCNlkKSYmtMaBbuC8CYyM7aBsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e/MEGPnEAlF5LmlF7KH7LZWGIGaUp5ndrAM1/HEjKDY=;
	b=ols3C9MZ8dpFWSMfo5VojK28+0n4JZUKkUv5TsCadFeP6b9TFFzGrV/rD2dcvxYM0X
	6OM4U3HMgCnNexrgLInxiFEgBOyDCkqMAlteqWKRBjclh0SIBlOA2Pkas3O/6aH5zfl6
	L0esjRDmiJFHv/W3mQQFcJkhCc++Xkp2DiykV5mGCIJjXA5ryCnY+Ry3SxmCNsCZD8ht
	zeiXrTqIb0D3X6Otk/qvoDCRBHSlmagSH8Wzt9U14kFU3rgEXlnZX+Et0NodYV8es8VP
	yKE2yb0CcraqsnF0Lwwn/lejNQxLveFhS5fP0vA4PKafvoeeGkOVikLtOsCdRMYf5NzV
	M+FA==
X-Gm-Message-State: APt69E2ED+H8k/gNoCNHW7GvJ+uMJvTNXObDcCUYYOz3b5XX7ABFn3fj
	mqG72tBOpSXw6PY42+hm65CiMYVNlJwtYDWC0qAZEg==
X-Google-Smtp-Source: ADUXVKIH/YVNPlIbwAGH3FfUbqPbLVh5bGJYZJiOi2bN68cvomqBonZI1ygtWypzAYoGEzzjXkQTMqj1kDr4for7PnI=
X-Received: by 2002:aca:bd84:: with SMTP id
	n126-v6mr8262040oif.337.1528735255784; 
	Mon, 11 Jun 2018 09:40:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 09:40:35
	-0700 (PDT)
In-Reply-To: <20180611101551.2f656715@w520.home>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
	<20180611101551.2f656715@w520.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 17:40:35 +0100
Message-ID: <CAFEAcA_Y5zkoiSyHfuvnhSUPOc44fpGj7j373Rz2+Gf0yGF6sQ@mail.gmail.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>, John Snow <jsnow@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22b
Subject: Re: [Qemu-trivial] [PATCH v2] CODING_STYLE: Define our preferred
 form for multiline comments
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
X-List-Received-Date: Mon, 11 Jun 2018 16:40:58 -0000

On 11 June 2018 at 17:15, Alex Williamson <alex.williamson@redhat.com> wrote:
> Much preferred, thanks  (tabs next? ;)

CODING_STYLE already mandates spaces-only, no-tabs...

thanks
-- PMM

