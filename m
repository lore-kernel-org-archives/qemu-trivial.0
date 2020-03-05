Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9o4U-00058u-Se
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 05:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9o4O-00057E-KZ
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:49:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9o4N-0005Pl-9m
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:49:36 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27769
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9o4N-0005OT-6P
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583405374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjATUW/5m3yTKYSiJ131MJpBOfWBVsXMfEsSS1NFroE=;
 b=NL/7Z+2uhzxWMWqMvZZR5vX2vlGol1n4pf7Ltk2Y7lNbFmAmyxAOLJ5Uyrweu+Lh0dLL0x
 BajVwe8+sfHEqaPbafaK8uyXPMEG09pthzJKAn0TuCSYUm8TaIxxMYvykaZN19Bhriw5YU
 RYvfPvyBCvAxmwAOD2IAf29ob4O4hak=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-3-T8HK0vMcGdh1ZYw5nk-g-1; Thu, 05 Mar 2020 05:49:32 -0500
X-MC-Unique: 3-T8HK0vMcGdh1ZYw5nk-g-1
Received: by mail-vk1-f200.google.com with SMTP id f65so442284vkc.0
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 02:49:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KjATUW/5m3yTKYSiJ131MJpBOfWBVsXMfEsSS1NFroE=;
 b=Xc606S/9Pavvm7ndfkGTvV4uC6KfzWvI5cfBZtCXYAJ1Ag3s2c9q909EPulqmSwgXl
 8FVWDer3IXrCf+1LO1+OG5Tbv1yZrvHyaaiIe1ACZ88iTL6q7b5h55DUVQhR6HqXF+ef
 qLIQDTKgV5sZXbf25+sodls3ycWRueWaEGkF+QbUROnoOH9QYM1OYXdSQL12mD4fFF/b
 3bdyqr0svZje6Qdv9niNxYehRn88i8eJZrIIWo581m329Hpt1xWXKoDnpSdV0ks2dgIf
 P7UGc3gxDduh6TANYtqStfSz1pJSwK6rA+r/+VLyWruRzpMqBjll9CKCbjHHDmD1hoAY
 l6gQ==
X-Gm-Message-State: ANhLgQ2uW4CzsBF+ikAEdRr8nDKQcKIrXVGSK8rTinvmkUjJ9bnt5xki
 HIriSUB9lQHc3W7SjR5qnHEnzXCWxHjdcYajRpTIY2bSeJzaPCf8pvKu4R5KyVcFDkQ0MMyvDKy
 nXaoJeyLvgumwlu75xlUSguPv4GHhj/FD/g==
X-Received: by 2002:a67:f296:: with SMTP id m22mr4460448vsk.237.1583405372086; 
 Thu, 05 Mar 2020 02:49:32 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsFs/p/Py5fwqBoWxmfdA2gU4jv9MGYe0k1KetSxux7/LHbtiuv9T+LxzpjB0/34fSVCUNaMjU8tcGAwPDVMrI=
X-Received: by 2002:a67:f296:: with SMTP id m22mr4460438vsk.237.1583405371794; 
 Thu, 05 Mar 2020 02:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20200304221807.25212-1-philmd@redhat.com>
 <20200304221807.25212-4-philmd@redhat.com>
 <20200305080237.j2a7waokxominirn@sirius.home.kraxel.org>
 <a5b6cddf-5887-be27-db76-2e515daa2c11@redhat.com>
In-Reply-To: <a5b6cddf-5887-be27-db76-2e515daa2c11@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Thu, 5 Mar 2020 11:49:20 +0100
Message-ID: <CAP+75-XBbTPHbQJWxn5nEYsz4hdGXSTLTqKRRR-sx-APbPN2Sg@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/usb/quirks: Use smaller types to reduce .rodata by
 10KiB
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 05 Mar 2020 10:49:42 -0000

On Thu, Mar 5, 2020 at 11:41 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> On 3/5/20 9:02 AM, Gerd Hoffmann wrote:
> >>   struct usb_device_id {
> >> -    int vendor_id;
> >> -    int product_id;
> >> -    int interface_class;
> >> -    int interface_subclass;
> >> -    int interface_protocol;
> >> +    int16_t vendor_id;
> >> +    int16_t product_id;
> >> +    int8_t interface_class;
> >> +    int8_t interface_subclass;
> >> +    int8_t interface_protocol;
> >
> > I guess we should better use the uint variants here ...
>
> I tried it first but I got:
>
>    CC      hw/usb/quirks.o
> hw/usb/quirks.c:25:34: error: result of comparison of constant -1 with
> expression of type 'const uint16_t' (aka 'const unsigned short') is
> always true [-Werror,-Wtautological-constant-out-of-range-compare]
>      for (i =3D 0; ids[i].vendor_id !=3D -1; i++) {
>                  ~~~~~~~~~~~~~~~~ ^  ~~
> hw/usb/quirks.c:28:37: error: result of comparison of constant -1 with
> expression of type 'const uint8_t' (aka 'const unsigned char') is always
> false [-Werror,-Wtautological-constant-out-of-range-compare]
>              (ids[i].interface_class =3D=3D -1 ||
>               ~~~~~~~~~~~~~~~~~~~~~~ ^  ~~
>
> And went this less intrusive way.
>
> I'll respin with s/-1/UINT8_MAX/.

Problem, now this entry is ignored (interface_class=3D=3D-1):

    { USB_DEVICE_AND_INTERFACE_INFO(MICROCHIP_VID, MICROCHIP_USB_BOARD_PID,
                                    0xff, 0xff, 0x00) },


