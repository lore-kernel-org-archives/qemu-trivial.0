Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn5mN-0007Nl-Bf
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 13:00:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gn5mK-0007Mf-4U
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 13:00:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gn5mG-0001XU-RX
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 13:00:31 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:55848)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sourav.jb1988@gmail.com>)
	id 1gn5mG-0001P6-0o; Fri, 25 Jan 2019 13:00:28 -0500
Received: by mail-wm1-x344.google.com with SMTP id y139so7543105wmc.5;
	Fri, 25 Jan 2019 10:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OqrZnZWkBdw/bJ3/p8kvAv2J8X3Ks/6tndRg+76SyAg=;
	b=CC0vCwZ4juiN7X0pizG+Y68DUCIutmZyx35JE9imnmw+xbadNeIA+PmqjKo+Yp/Es1
	q18scwRHrfBgFCvyTIcAbbW1HLRBGjEAutLXPAUnM+ATKF//ZsfXVUPdRTiHIYsE+OZ3
	hI9yKI/oDmeyC/EKi1besBhgC9TIwIsLDpJHf8y4wCGCz1IbY2RZKGYENZ7l8y8vHn2S
	aQLrAfB0g4/WtxQgtkS11IiWI8KkQUhLBxZq56TALCCTr9d0EcQmP49M+k6wZuix0r5n
	Ivw3cLEVg8yBnmNk9vz/OwzP8IALDUbd44Wrz2cjvbsyZ47zi0Z/lTKhMnzNzdof3K6q
	PdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OqrZnZWkBdw/bJ3/p8kvAv2J8X3Ks/6tndRg+76SyAg=;
	b=L8XsutN81E/0r2RU/z0SIa/9AOrJOUXHin7b0IKX+8P0ZuDENjELpd7Y+snJwU+egz
	BCGCZP/DYuQVnClqF2A5uhaB9welefnGuS2oApC2WPJl9YXj818WC+ocu81mAtTwsL1Q
	9mnmSnDzl7D5H1zVQ2S2EXBHZn1TsFiHpTtp4tLZWgv4VZKz3eL7f91Frkynrgt3OnBP
	eDGslJvkUC+pMS+vJQBx+dyursvdqCbzhw9O2dnh/EC2gj5CL3QywxCvDUehYqY9cvQz
	BLPMqihCf06e+SoGOzgzNU5e1shP4DGPyqhKLDBB5n3Gf74TNjKjjl+tq+yMGpvY0x9l
	mAnA==
X-Gm-Message-State: AJcUukdnCi5W4mG096zOly2CSu6SZRS2o13r4h9nu6K4gucQGeGhIqVF
	zmSind2VV20M9jm7q7pbQU+Jgz1xs1JfiXf/mqg=
X-Google-Smtp-Source: ALg8bN52EoxKxN6fK9t93Q6LlFM1slAUy9OJpdQSfYleBuKiOH9vIS3EW6mQ6m6cwRmJL0bwc0IQhAzpyCfwiePSYsU=
X-Received: by 2002:a1c:b687:: with SMTP id g129mr7598622wmf.59.1548439222322; 
	Fri, 25 Jan 2019 10:00:22 -0800 (PST)
MIME-Version: 1.0
References: <20190125151440.13794-1-sourav.jb1988@gmail.com>
	<f9288ca3-1f07-3409-ac16-ce4dc958940e@redhat.com>
	<cc09d469-56bc-9438-acc0-0d4ccf67e6a5@redhat.com>
In-Reply-To: <cc09d469-56bc-9438-acc0-0d4ccf67e6a5@redhat.com>
From: ksourav <sourav.jb1988@gmail.com>
Date: Fri, 25 Jan 2019 23:30:10 +0530
Message-ID: <CAAJhNetypG8pwa0Vs-RV=QbBcWwev5QtPF9n3CvTQJuzbNxkhg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	pbonzini@redhat.com, 
	QEMU Developers <qemu-devel@nongnu.org>, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw: input: set category of
 the i8042 device
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
X-List-Received-Date: Fri, 25 Jan 2019 18:00:33 -0000

On Fri, Jan 25, 2019 at 10:14 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 1/25/19 4:24 PM, Thomas Huth wrote:
> > On 2019-01-25 16:14, kumar sourav wrote:
> >> Sets the category of i8042 device as DEVICE_CATEGORY_INPUT
> >> Devices should be assigned to one of DEVICE_CATEGORY_XXXX.
> >>
> >> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
> >> ---
> >>  hw/input/pckbd.c | 1 +
>
> It seems we have other potential cases:
>
> $ git grep -L 'set_bit(DEVICE_CATEGORY_INPUT' hw/input/*c
> hw/input/adb.c
> hw/input/hid.c
> hw/input/lm832x.c
> hw/input/milkymist-softusb.c
> hw/input/pckbd.c
> hw/input/pl050.c
> hw/input/ps2.c
> hw/input/pxa2xx_keypad.c
> hw/input/stellaris_input.c
> hw/input/tsc2005.c
> hw/input/tsc210x.c
> hw/input/virtio-input-hid.c
> hw/input/virtio-input-host.c
>
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> >> index 3e66713b47..72e7d5f6cc 100644
> >> --- a/hw/input/pckbd.c
> >> +++ b/hw/input/pckbd.c
> >> @@ -574,6 +574,7 @@ static void i8042_class_initfn(ObjectClass *klass,=
 void *data)
> >>
> >>      dc->realize =3D i8042_realizefn;
> >>      dc->vmsd =3D &vmstate_kbd_isa;
> >> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
> >>  }
> >>
> >>  static const TypeInfo i8042_info =3D {
> >>
> >
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
Ok I will add device categories for these devices too. Should I send
the changes in one patch for all these devices/files ?
Or should I send it separately - one patch per device/file ?

Thanks & Regards

