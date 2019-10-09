Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIEF1-0006jG-SZ
	for mharc-qemu-trivial@gnu.org; Wed, 09 Oct 2019 11:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57146)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iICNV-0006Bg-IC
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 09:51:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iICNU-00065x-HM
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 09:51:45 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45144)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iICNU-00065d-BV
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 09:51:44 -0400
Received: by mail-oi1-x244.google.com with SMTP id o205so1763819oib.12
 for <qemu-trivial@nongnu.org>; Wed, 09 Oct 2019 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7OvEfYO9EpQ8fnwFtnhlr1IhWEuGDHMdr6XTfc/iLm4=;
 b=iS0uoPqa0iDdcVDDcFthTa0dBcllC/xw8QVuoB40nYxZLnHLJcPgf5fwnAlW9A5pT3
 pGLTi9+GpVIR19wE3k+W9EqDcbEcnqpScruo24bEMM9ye1z6JtwlexkJjCnpU1dr0g6x
 V4KBztKpXYeD73SwuKiqoR6qsQy1ngvcehds54sZvt4M9hppCd69dlRHUb+7XQ/SwO1P
 2/elzoXowyWmzqQUiYy/sT58OtphDc9PXZXo5ZE2bqEjXe8Gd6vARyD9cPoYezd2Uxgb
 ZSq7jbmSo0eHZCxlKrdpgwBCAOZqdJq9TsgxDfOBLXNzPibu8XYglADdv64FV8TmlaXf
 nalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7OvEfYO9EpQ8fnwFtnhlr1IhWEuGDHMdr6XTfc/iLm4=;
 b=FQHmEsi5M5AJQwdPg+my1HHiy5dbzUcdUaJ6NlILrySz6rTKJ3N1lqMhIT3ilMmi/F
 WicwraCtdqiLZGmGzr5POwp8c6wYVoUanepb/IWD0ZeckYSiqaSMDFrO7FKLjMeExvcR
 OkA0SM/VzNKuRjHvcoJg7IIQlmX7L5ULKnGsXfvDlhoJh8kWiwL53rG9JH3ivicXF9lO
 5hZhNLNoxaXMPlVud2ia/h9G6Xi8fco/KXqsv98ZnfJywWU02qXFMXU+cm4Ox5Z6nLGI
 /COGP/nPs9efaifGGLdP8h3pupDiwuUXXBzYole8K0tcX9KqBY5G/7v+VyO+eu0NIGnZ
 Vv2g==
X-Gm-Message-State: APjAAAXUy7v0Zo/2INTArLoehtRWWSTeZgUxcFMe0+nv+sa3Tuq6NpVb
 rOKVCSxkRKEOODuZydK/Lfg8Dri2DGT1yGi4XiYcEg==
X-Google-Smtp-Source: APXvYqw2thD7HgJ1D7aUU/9v6R+eBR33EALysh6Zi2oURCCoVKqOMEfv6DInCNzXroIxkuUksdCbQUfjmrjFUz4aHn0=
X-Received: by 2002:aca:2b08:: with SMTP id i8mr2204531oik.146.1570629102479; 
 Wed, 09 Oct 2019 06:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190926151733.25349-1-philmd@redhat.com>
 <20190926151733.25349-12-philmd@redhat.com>
 <f110c099-7521-95e0-74b9-9c7e53d7d5d8@redhat.com>
In-Reply-To: <f110c099-7521-95e0-74b9-9c7e53d7d5d8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Oct 2019 14:51:30 +0100
Message-ID: <CAFEAcA_urR77o5+mFy3a4wL=BDHVzEvnAeaf2ASXdpa6md16FQ@mail.gmail.com>
Subject: Re: [PATCH 11/11] hw/misc/vmcoreinfo: Convert reset handler to
 DeviceReset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>,
 Damien Hedde <damien.hedde@greensocs.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-List-Received-Date: Wed, 09 Oct 2019 13:51:46 -0000

On Thu, 26 Sep 2019 at 17:02, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 9/26/19 5:17 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Convert the reset handler into a proper Device reset method.
>
> Marc-Andr=C3=A9 noticed this one is incorrect, because while being QDEV i=
t is
> not connected to a QBUS.
>
> Maybe we can add a Device::unconnected property, and when set, the
> parent realize() calls 'qemu_register_reset(dev->reset, dev);'?
> This might look the same, but at least Devices implementations could
> stop to use this function...

I'm not in favour of ad-hoc attempts to patch the
problem with some devices not being reset like this.
I'd rather we figured out a general solution to the design
problem (which isn't easy, but on the other hand the
set of workarounds we currently have isn't too awful
to deal with).

thanks
-- PMM

