Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mtT6O-0008VQ-Rv
	for mharc-qemu-trivial@gnu.org; Sat, 04 Dec 2021 06:21:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noah@statshelix.com>)
 id 1mtT6L-0008TH-9p
 for qemu-trivial@nongnu.org; Sat, 04 Dec 2021 06:21:10 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=41931
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <noah@statshelix.com>)
 id 1mtT6G-00005k-KA
 for qemu-trivial@nongnu.org; Sat, 04 Dec 2021 06:21:09 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id v138so17067603ybb.8
 for <qemu-trivial@nongnu.org>; Sat, 04 Dec 2021 03:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=statshelix-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HeZp5ZfnJgEx8JnFuNwQvdXaX3kHfRM6rwnLCu04cl0=;
 b=Y9ajELrSVPpDszuZl3dhZbtiJUeN576qZcFbitEhR9GpdboK8GkYfAdqs+7YNqdKqh
 l2ha7Yy+rHOSTMO6QM0hWfvJ2TIgkf68yNj5Okv5MHJdu99yK7b58AINQiR/HL+mXp1j
 jzvb6cy8o52IAx2UzvqEANDCq5WV/wy7RsEYowJ2as3VyaJM/pEwHdMWH9e7CYd7rZ9w
 FEhQ/nbWwgcEe9t51wPRKyscdNWsbP/LY37J4fNeLMGoBlTcgTSMD1Q5hV39/zJf1UuI
 6DxIoVhgGj0EgmAFWDhIKZ8j/JrZimCYwAhhy+hFOudwTEeRcS/vkTunIgMguu/Upvj6
 6mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HeZp5ZfnJgEx8JnFuNwQvdXaX3kHfRM6rwnLCu04cl0=;
 b=kMnT41tSmoZh+jnLMxdhOwr1TjoqS41vC3MIwEcd7Y7sHM6k6gmDPRMuNjSvdlgWJL
 0G621rFAuzIcj6S6x/b5WhBkbk6AuXo9qnsJK4c+zkwtlvw2qisLHlL9mK5Ah05Na6F7
 CHDtl+KgiRceJ/dgqe57d8pkx13RwwEpJ0G6Zczrj6DYto0GXAXW6cR1ln/eIK6o6Lje
 QHcoRbHaY/Aioim4Pn1QYUx5v6Ewimhs5Z680CCvKpHaVwjinsnMZXalp9ZaxgzTwezE
 SwenxGtFbRsDAVjadZl0ucUbZ1vqEB8Mb27nang2JVGSIMFHAE597V9qh/Mk3C5ukBx4
 QrjQ==
X-Gm-Message-State: AOAM530n4fNsiGlfgcd+3TtuDRilhwKP1ndvuVeo52v/Fztbkrzag4Ji
 zGTvhh1r/C0pBX4U+huNN0cRb/nl+UBPEQM0/RzBvA==
X-Google-Smtp-Source: ABdhPJzhEdJFLtkQxbpvWU8KI8TP3WmJA+uVN69S/HfaESEbzMp5n4yQIynaTYNu53clCISbW5bdG0rRryGH947tKK4=
X-Received: by 2002:a25:5d6:: with SMTP id 205mr29352603ybf.741.1638616862348; 
 Sat, 04 Dec 2021 03:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20211126140437.79745-1-noah@statshelix.com>
In-Reply-To: <20211126140437.79745-1-noah@statshelix.com>
From: Noah Bergbauer <noah@statshelix.com>
Date: Sat, 4 Dec 2021 12:20:51 +0100
Message-ID: <CABjy+RiwQLNmdSYop1zWq40Jp2HRvf_z5xtDTmKT1R3ff0bHdg@mail.gmail.com>
Subject: Re: [PATCH] hid: Implement support for side and extra buttons
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Content-Type: multipart/alternative; boundary="00000000000000f04c05d25038b6"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=noah@statshelix.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Dec 2021 11:21:10 -0000

--00000000000000f04c05d25038b6
Content-Type: text/plain; charset="UTF-8"

ping https://patchew.org/QEMU/20211126140437.79745-1-noah@statshelix.com/

On Fri, Nov 26, 2021 at 3:04 PM Noah Bergbauer <noah@statshelix.com> wrote:

> Simply set the respective bits and update the descriptor accordingly.
>
> Signed-off-by: Noah Bergbauer <noah@statshelix.com>
> ---
>  hw/input/hid.c   | 2 ++
>  hw/usb/dev-hid.c | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/input/hid.c b/hw/input/hid.c
> index 8aab0521f4..e7ecebdf8f 100644
> --- a/hw/input/hid.c
> +++ b/hw/input/hid.c
> @@ -114,6 +114,8 @@ static void hid_pointer_event(DeviceState *dev,
> QemuConsole *src,
>          [INPUT_BUTTON_LEFT]   = 0x01,
>          [INPUT_BUTTON_RIGHT]  = 0x02,
>          [INPUT_BUTTON_MIDDLE] = 0x04,
> +        [INPUT_BUTTON_SIDE] = 0x08,
> +        [INPUT_BUTTON_EXTRA] = 0x10,
>      };
>      HIDState *hs = (HIDState *)dev;
>      HIDPointerEvent *e;
> diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
> index 1c7ae97c30..bdd6d1ffaf 100644
> --- a/hw/usb/dev-hid.c
> +++ b/hw/usb/dev-hid.c
> @@ -461,14 +461,14 @@ static const uint8_t
> qemu_mouse_hid_report_descriptor[] = {
>      0xa1, 0x00,                /*   Collection (Physical) */
>      0x05, 0x09,                /*     Usage Page (Button) */
>      0x19, 0x01,                /*     Usage Minimum (1) */
> -    0x29, 0x03,                /*     Usage Maximum (3) */
> +    0x29, 0x05,                /*     Usage Maximum (5) */
>      0x15, 0x00,                /*     Logical Minimum (0) */
>      0x25, 0x01,                /*     Logical Maximum (1) */
> -    0x95, 0x03,                /*     Report Count (3) */
> +    0x95, 0x05,                /*     Report Count (5) */
>      0x75, 0x01,                /*     Report Size (1) */
>      0x81, 0x02,                /*     Input (Data, Variable, Absolute) */
>      0x95, 0x01,                /*     Report Count (1) */
> -    0x75, 0x05,                /*     Report Size (5) */
> +    0x75, 0x03,                /*     Report Size (3) */
>      0x81, 0x01,                /*     Input (Constant) */
>      0x05, 0x01,                /*     Usage Page (Generic Desktop) */
>      0x09, 0x30,                /*     Usage (X) */
> --
> 2.34.0
>
>

--00000000000000f04c05d25038b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ping <a href=3D"https://patchew.org/QEMU/202111261404=
37.79745-1-noah@statshelix.com/">https://patchew.org/QEMU/20211126140437.79=
745-1-noah@statshelix.com/</a></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 26, 2021 at 3:04 PM Noah Be=
rgbauer &lt;<a href=3D"mailto:noah@statshelix.com">noah@statshelix.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Simpl=
y set the respective bits and update the descriptor accordingly.<br>
<br>
Signed-off-by: Noah Bergbauer &lt;<a href=3D"mailto:noah@statshelix.com" ta=
rget=3D"_blank">noah@statshelix.com</a>&gt;<br>
---<br>
=C2=A0hw/input/hid.c=C2=A0 =C2=A0| 2 ++<br>
=C2=A0hw/usb/dev-hid.c | 6 +++---<br>
=C2=A02 files changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/input/hid.c b/hw/input/hid.c<br>
index 8aab0521f4..e7ecebdf8f 100644<br>
--- a/hw/input/hid.c<br>
+++ b/hw/input/hid.c<br>
@@ -114,6 +114,8 @@ static void hid_pointer_event(DeviceState *dev, QemuCon=
sole *src,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[INPUT_BUTTON_LEFT]=C2=A0 =C2=A0=3D 0x01,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[INPUT_BUTTON_RIGHT]=C2=A0 =3D 0x02,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[INPUT_BUTTON_MIDDLE] =3D 0x04,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INPUT_BUTTON_SIDE] =3D 0x08,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [INPUT_BUTTON_EXTRA] =3D 0x10,<br>
=C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0HIDState *hs =3D (HIDState *)dev;<br>
=C2=A0 =C2=A0 =C2=A0HIDPointerEvent *e;<br>
diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c<br>
index 1c7ae97c30..bdd6d1ffaf 100644<br>
--- a/hw/usb/dev-hid.c<br>
+++ b/hw/usb/dev-hid.c<br>
@@ -461,14 +461,14 @@ static const uint8_t qemu_mouse_hid_report_descriptor=
[] =3D {<br>
=C2=A0 =C2=A0 =C2=A00xa1, 0x00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0Collection (Physical) */<br>
=C2=A0 =C2=A0 =C2=A00x05, 0x09,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Usage Page (Button) */<br>
=C2=A0 =C2=A0 =C2=A00x19, 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Usage Minimum (1) */<br>
-=C2=A0 =C2=A0 0x29, 0x03,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /*=C2=A0 =C2=A0 =C2=A0Usage Maximum (3) */<br>
+=C2=A0 =C2=A0 0x29, 0x05,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /*=C2=A0 =C2=A0 =C2=A0Usage Maximum (5) */<br>
=C2=A0 =C2=A0 =C2=A00x15, 0x00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Logical Minimum (0) */<br>
=C2=A0 =C2=A0 =C2=A00x25, 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Logical Maximum (1) */<br>
-=C2=A0 =C2=A0 0x95, 0x03,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /*=C2=A0 =C2=A0 =C2=A0Report Count (3) */<br>
+=C2=A0 =C2=A0 0x95, 0x05,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /*=C2=A0 =C2=A0 =C2=A0Report Count (5) */<br>
=C2=A0 =C2=A0 =C2=A00x75, 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Report Size (1) */<br>
=C2=A0 =C2=A0 =C2=A00x81, 0x02,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Input (Data, Variable, Absolute) */<br>
=C2=A0 =C2=A0 =C2=A00x95, 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Report Count (1) */<br>
-=C2=A0 =C2=A0 0x75, 0x05,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /*=C2=A0 =C2=A0 =C2=A0Report Size (5) */<br>
+=C2=A0 =C2=A0 0x75, 0x03,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /*=C2=A0 =C2=A0 =C2=A0Report Size (3) */<br>
=C2=A0 =C2=A0 =C2=A00x81, 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Input (Constant) */<br>
=C2=A0 =C2=A0 =C2=A00x05, 0x01,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Usage Page (Generic Desktop) */<br>
=C2=A0 =C2=A0 =C2=A00x09, 0x30,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0Usage (X) */<br>
-- <br>
2.34.0<br>
<br>
</blockquote></div>

--00000000000000f04c05d25038b6--

