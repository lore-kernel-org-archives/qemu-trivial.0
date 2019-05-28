Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVfGz-0006T2-GI
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2019 12:48:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hVfGr-0006Nw-M3
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:48:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hVfGo-0006fe-Vc
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:48:17 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43278)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hVfGo-0006EX-Ph
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 12:48:14 -0400
Received: by mail-oi1-x242.google.com with SMTP id t187so14793999oie.10
	for <qemu-trivial@nongnu.org>; Tue, 28 May 2019 09:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KJW3RwpOP6LW47PF2ENP0DSUzzMyv5RPjCuGE4kQ/gU=;
	b=U1XKA3g0RZK1Tbi8JHbcQb0jW2gd5Le289/Fahq+G2FbdKf1VZCEFVnTWIVHtDXjea
	56OgmCommXH6ZS+IHM45g55F9/309L5ZXOMhP960N4gbO+i/8/gewyh/6uVhrsw6gnit
	J/0DDQB6+jJ+ZBQmoiqs1Ovii7EeBBm6uSuqwP2M5nkbZxAFeGsVmXAHAM1SKAFj1xkR
	Knw+jbTDfujK5T6IIuCYZ71Ld3SMukXmSKCUBdRI6mmaTUiglkIav+OGphXC2OFT1jbP
	b5mpGgUiGkmbb8bTnP4lYxHPVPTQAQJm9H1s707VqY2ixCgeq1aCHjC07ludteX82kww
	Nu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KJW3RwpOP6LW47PF2ENP0DSUzzMyv5RPjCuGE4kQ/gU=;
	b=ORhesi9NdEKn+5NRyuvllL27SNnagK/6WirMaPhzWN9UzkT+sfveoPzSFXjMq8k7Cr
	/enuudZZ2E18nkl7mj6fL/KuCrQX+CRfS6+usoAiVB7WdUlBebY/3RNRxY+8dxuOV7X6
	EAkTy/8zeBBY4Z1+hkLg1nupD5wPVPBCP0fH+1OmLx3x4M5pLD1Jzwia9V7VrBUhjyYq
	aSL0shbBGRpDtFDg7IJwpKgEWBu0z0aR8NKB6L5To3MQYBuP+I6NVPtz1fS8iL8DInrW
	IKM1LCKf4OVwpTAgKv8nFUmQCYG5xXY1PYhSvqhjz1BdQaScAr2kTwJl4sLuFKvK51oP
	R0aQ==
X-Gm-Message-State: APjAAAXZW4CXe2bxaTeYKaM/IYAPW/fmEkmi0B8BhTyX8S+Ril8/HjVJ
	+TqZIzt7cgMB1o5jJNAq4HBTLNgofIQAj/QDdMuYkw==
X-Google-Smtp-Source: APXvYqyQ3GWdeshPJkCM/RshxdKrTLMQ+AorFWNBkk7HUYhqLHt0UPCbayqhHYIuG7TAU5REouOseI0oXvc43kXrgBo=
X-Received: by 2002:aca:845:: with SMTP id 66mr3270959oii.163.1559062042880;
	Tue, 28 May 2019 09:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190528164020.32250-1-philmd@redhat.com>
	<20190528164020.32250-6-philmd@redhat.com>
In-Reply-To: <20190528164020.32250-6-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2019 17:47:11 +0100
Message-ID: <CAFEAcA9GhZwCb6WLa75i1ep5VX7S_kP3YEo-VOxXbnogXZ=W1A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, 
	Halil Pasic <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, Richard Henderson <rth@twiddle.net>,
	Aleksandar Markovic <amarkovic@wavecomp.com>, 
	Cornelia Huck <cohuck@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>, 
	Fam Zheng <fam@euphon.net>, qemu-s390x <qemu-s390x@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-trivial] [PATCH v2 05/10] hw/sd: Use the QOM BUS() macro
 to access BusState.qbus
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
X-List-Received-Date: Tue, 28 May 2019 16:48:24 -0000

On Tue, 28 May 2019 at 17:42, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Rather than looking inside the definition of a BusState with "s->bus.qbus=
",
> use the QOM prefered style: "BUS(&s->bus)".
>
> This patch was generated using the following Coccinelle script:
>
>     // Use BUS() macros to access BusState.qbus
>     @use_bus_macro_to_access_qbus@
>     expression obj;
>     identifier bus;
>     @@
>     -&obj->bus.qbus
>     +BUS(&obj->bus)
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/sd/milkymist-memcard.c | 2 +-
>  hw/sd/ssi-sd.c            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

