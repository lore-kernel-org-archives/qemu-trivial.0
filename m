Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHm5P-0001Io-JX
	for mharc-qemu-trivial@gnu.org; Tue, 08 Oct 2019 05:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHm5M-0001Gd-JQ
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 05:47:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHm5L-0000VG-3B
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 05:47:16 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34588)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHm5K-0000Ua-SG
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 05:47:15 -0400
Received: by mail-ot1-x343.google.com with SMTP id m19so13544141otp.1
 for <qemu-trivial@nongnu.org>; Tue, 08 Oct 2019 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Sdir98usYJaSxNxjLhnEPrKLAXbPzK6zXTfpOFV1Mgg=;
 b=txtpsKaL6JzLPFUE8v+JpWZHiHbOjI04yWWRrWGLE+rKm7EzEFE8X6BjkDniXiZCxd
 uoKeBML3xpoqxKPRgyPvD6ldtR0/nNRtN1brBHkuXlLddmUgCW/EUVgFgwJYJc7gdlsW
 k2+eG22ZO8/YrkrtZq3CUQjIOdzOPOPejle+2aM8gZOGmdtJCqE/kIZHkaA8isyjoffW
 OtKHiabH+6MgP6vPc9fIuoyurmfQ3+HG+F1GPYJk7tQiMlQYyFG/aSy0MSOAXDE2Prlb
 1lESBMoCG3G+4Z6O1KznjWz0VX5jzPr8V/F73sVdspkCXUWzCwiIYCTyiQidgNT5/N8f
 gm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Sdir98usYJaSxNxjLhnEPrKLAXbPzK6zXTfpOFV1Mgg=;
 b=TBPhNG6iUiJKC/fx4MAsV35W8T5i+CQZ+LfaKQLRHDRuz1jm5Nv5u/ZcHx3Ry4/pp7
 tRsOYVExCc0KZ6ExlFgs/uiD3u/SjCpQ8XxtdQos4tQGXGY2N/IY/kE7s1kBQii4AEJK
 oFRgfjXhc/YPpj5Dm2fH3YvZ2wWicSKveYZQT7hJdsVg7zCOX9Z0lrI4dZyO7iH5VaxM
 eZrsLdgmwN2tRBg6E/yj6ouF3MwrPkE4jb22jCC8OawqYRy3OTpJMb3XQMWtJVoXFJln
 4vshuS1PUPKkCF5Q4aYUCzJSkkE5wmeDVC3MGE/FaBSRKYgyAPImtdMUS7+5sUVH8Drj
 yK7w==
X-Gm-Message-State: APjAAAXL9EXS7oon9iSztnZJfhzUZP8DsZRk7OEhI6XGPFIZd5Sqn2Xh
 wLmSwRwF/gWG0Kc6jhy8iEwfSpuOZDokpfkMrG6krw==
X-Google-Smtp-Source: APXvYqxTm1ep07p91RU4l2Rjxuvl4OlgudVlzoxV4WFXbUGwX0W8Nb544Nez8AzJ5zclPYZbvg2V63phiWM8hxg0qFc=
X-Received: by 2002:a9d:4615:: with SMTP id y21mr23134501ote.97.1570528033957; 
 Tue, 08 Oct 2019 02:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190926151733.25349-1-philmd@redhat.com>
 <20191005174531-mutt-send-email-mst@kernel.org>
 <9a20b4a9-b255-95e9-1e27-94e294e21042@redhat.com>
 <20191007212406.GU4084@habkost.net>
In-Reply-To: <20191007212406.GU4084@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2019 10:47:03 +0100
Message-ID: <CAFEAcA_ymKafY+KCqBDjFtgf-_tRO1hH3Y4eaNNB3Pw6W0GQCQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] hw: Convert various reset() handler to DeviceReset
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Markus Armbruster <armbru@redhat.com>, 
 Damien Hedde <damien.hedde@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>, 
 John Snow <jsnow@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, 
 Igor Mammedov <imammedo@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2019 09:47:18 -0000

On Mon, 7 Oct 2019 at 22:24, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Mon, Oct 07, 2019 at 12:01:54PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Hi Michael,
> >
> > On 10/5/19 11:46 PM, Michael S. Tsirkin wrote:
> > > On Thu, Sep 26, 2019 at 05:17:22PM +0200, Philippe Mathieu-Daud=C3=A9=
 wrote:
> > > > Hi.
> > > >
> > > > Following the thread discussion between Peter/Markus/Damien about
> > > > reset handlers:
> > > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.html
> > > > I started to remove qemu_register_reset() calls from few qdevified
> > > > devices (the trivial ones).
> > > >
> > > > Regards,
> > > >
> > > > Phil.
> > >
> > > How do you want these patches merged? Trivial tree?
> >
> > I was hoping Eduardo would take them but he is busy and I even forgot t=
o Cc
> > him. They might go via Trivial or else via Paolo's Misc...
>
> I can merge them if somebody reviews the series.  How exactly are
> we making sure device_reset() is really being called for all
> devices touched by this series?  Are all buses guaranteed to be
> children of main-system-bus?

At least one of them is not (vmcoreinfo), as noted in review
comments on that patch. So while some of these patches might
be ok, some are not, and so we need to review them first
before they get merged via any route I think.

thanks
-- PMM

