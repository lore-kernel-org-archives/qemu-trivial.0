Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVeFw-0000NQ-Lq
	for mharc-qemu-trivial@gnu.org; Fri, 15 Nov 2019 11:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iVeFt-0000H9-Eh
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 11:15:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iVeFr-0003Wf-Sf
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 11:15:28 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40164)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iVeFr-0003WJ-M7
 for qemu-trivial@nongnu.org; Fri, 15 Nov 2019 11:15:27 -0500
Received: by mail-ot1-x342.google.com with SMTP id m15so8454276otq.7
 for <qemu-trivial@nongnu.org>; Fri, 15 Nov 2019 08:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UiU14tuo2Z+Fw3fwdTXdL3cwTjgYED6vsPEkPTAXsNU=;
 b=p64ci8sT6hrRtWG1QUYvLwxorbFnW1571L48ZvA3lPiHDEf2rnDRsRrWGJGH2iYqyO
 sYwhToIwdr3tQ35Ttq8eLzWHLiVhGjhGGWOKu7xuoiJSXAq0gdBArfDaPkoNsJeVxbek
 NeiYrDJRToxg5WCJ69HRC8/zD6zNtG0vPFXh5w49TF++beVFgkLrJIgbQBiPRypBSBt+
 Vf8pnYPx1ajiSrkolCADSf1m2Qx4E+bEjP4NVapAivwfHtmQSRjH7niG/tgQhTS311Yd
 T4E9Vlcy5E9KdVgPNh1h5yITSD0V9rJiHRJcotbQZE1QDO70/lLcKk0wJwzuPS5hDEPB
 K6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UiU14tuo2Z+Fw3fwdTXdL3cwTjgYED6vsPEkPTAXsNU=;
 b=R6TyJwshzI2rMt8s0SaEpSsZ90LoKtAhKwW4nrVy1MH0meMKe3ja5FWoGWIom1hwUT
 b1DLUjbEuucwKX+bt7FbofY+2MykWE7MNz2gZGBr9VenwK6vcj0vUqamLpArVYnHJ5Rz
 F+g3vlogg+0Uws3VsOG5PF9HHp8kJwRBhNVvUMdjvZyDkBUY+54ndkrKpl/3MunL4jfn
 mfl0TGhnYFTV4iec8EIIzX/96H4YfaxBiaI83mQbCc6WlJ4SqOK2QpaA8MFucnXnLJhv
 HhRSLRgbNttUR35Y2jfwst5vI8xWwD5RnoJXuEvR27Vvq73P+djRTDh7V2iXIGN2EYfT
 elDQ==
X-Gm-Message-State: APjAAAW3NnDdvL1G/JFy+Y+Sg4/kYx9Zi3Tfo2EiRvYm4lr2WRZ/lnNs
 /PDzKjkUmR2xFPRKdB03LX6O0LSntLbHFGgR3PZ9bQ==
X-Google-Smtp-Source: APXvYqwUmeKm+p8xsuo+aZV7WnTBtauZLjrYUygKNlB1JQWTDLeD3nGcX48D+8ZbBdBY6gdXAp1/WdQ1RgpurtyvF3c=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr10887156otq.221.1573834526578; 
 Fri, 15 Nov 2019 08:15:26 -0800 (PST)
MIME-Version: 1.0
References: <20191115145049.26868-1-thuth@redhat.com>
 <CAFEAcA-EuQVBtr=BCE5sdHo+LMv8XchHUSPM=CgSYxPVryWKZg@mail.gmail.com>
 <273a3123-9eef-c78e-5b83-833a21e3988c@redhat.com>
In-Reply-To: <273a3123-9eef-c78e-5b83-833a21e3988c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Nov 2019 16:15:15 +0000
Message-ID: <CAFEAcA9N+T=M=5-xb3ahRMqD6oxhm5Lx55-1Mtk1vXsRJEomwA@mail.gmail.com>
Subject: Re: [PATCH for-4.2] hw/i386: Fix compiler warning when CONFIG_IDE_ISA
 is disabled
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Fri, 15 Nov 2019 16:15:31 -0000

On Fri, 15 Nov 2019 at 16:08, Thomas Huth <thuth@redhat.com> wrote:
>
> On 15/11/2019 16.54, Peter Maydell wrote:
> > On Fri, 15 Nov 2019 at 15:10, Thomas Huth <thuth@redhat.com> wrote:
> >> --- a/hw/i386/pc_piix.c
> >> +++ b/hw/i386/pc_piix.c
> >> @@ -78,7 +78,6 @@ static void pc_init1(MachineState *machine,
> >>      X86MachineState *x86ms = X86_MACHINE(machine);
> >>      MemoryRegion *system_memory = get_system_memory();
> >>      MemoryRegion *system_io = get_system_io();
> >> -    int i;
> >>      PCIBus *pci_bus;
> >>      ISABus *isa_bus;
> >>      PCII440FXState *i440fx_state;
> >> @@ -253,7 +252,7 @@ static void pc_init1(MachineState *machine,
> >>      }
> >>  #ifdef CONFIG_IDE_ISA
> >>  else {
> >> -        for(i = 0; i < MAX_IDE_BUS; i++) {
> >> +        for (int i = 0; i < MAX_IDE_BUS; i++) {
> >>              ISADevice *dev;
> >>              char busname[] = "ide.0";
> >>              dev = isa_ide_init(isa_bus, ide_iobase[i], ide_iobase2[i],
> >
> > Don't put variable declarations inside 'for' statements,
> > please. They should go at the start of a {} block.
>
> Why? We're using -std=gnu99 now, so this should not be an issue anymore.

Consistency with the rest of the code base, which mostly
avoids this particular trick. See the 'Declarations' section
of CODING_STYLE.rst.

As Paolo points out, there's a nice convenient block
here already, so there's not much to be gained from
putting the declaration in the middle of the for statement.

thanks
-- PMM

