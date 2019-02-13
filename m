Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtuVR-0003nc-LJ
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 08:23:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1gtuVJ-0003lf-EZ
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 08:23:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1gtuVF-0002r6-L8
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 08:23:07 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43404)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1gtuVF-0002or-Fb
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 08:23:05 -0500
Received: by mail-qk1-f196.google.com with SMTP id f196so1273553qke.10
	for <qemu-trivial@nongnu.org>; Wed, 13 Feb 2019 05:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=b6uaCVQyjfk2cZpO1DBi6+5h+xlT8lNpbn9UpP1WQys=;
	b=eDy61bKbPygZ1zH+wydyIVGwQYGBVw5RBUqSjli3wWgN8NZHnsxFDL4p1AQswTrZUD
	riPNS/788xhNTXYPoDeHvCWQF+RNVo6dl2IC2G1ga/j8GM/kVnxAWezuvbpGDtLpKbcv
	JXGLkYxvjwjbfWEz1QXbwg/KhXDh0Mqw9CGPHKcsnJtw0Q4rN3V55Od6wQON1yluq646
	LGaUaxbkBLlvhcTqF9xBKJnIwGyKfKLVSV4r438+eH9scF07HwcSoBcwmmUqsCzB7UK3
	hmujRCcmgkTg/1s1DzVNJMCCV2WUPMurQbPm7Gbg0z+0hwbwXqabUQWiGGT9KwhPtVoh
	3GUw==
X-Gm-Message-State: AHQUAuZfgMdfAD6A9DKfK628YOWMRC5rhZWL64ltpipKtSj+DM3F46Wr
	TLYSgLkRvWAhqhkxWbQKxy3cBf5xTqk37bX0lZL4Iw==
X-Google-Smtp-Source: AHgI3IZgxLDPQ+CM7fDABGpxblyBtUez0/et6gLqxQ8cTljz27gILg0j4LHpvqGGLbRZAT5fNKFcjRtuacMIOmdWnZw=
X-Received: by 2002:a37:dcc1:: with SMTP id v184mr373592qki.212.1550064181743; 
	Wed, 13 Feb 2019 05:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20190213123446.1768-1-philmd@redhat.com>
In-Reply-To: <20190213123446.1768-1-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 13 Feb 2019 14:22:50 +0100
Message-ID: <CAMxuvaxbiwiJUGSD=RjKGqPxH=9tGL-0VUKvRNLwR+Kn2_VKCw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Anatoli Huseu1 <avg.tolik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.196
Subject: Re: [Qemu-trivial] [PATCH v2] chardev/wctablet: Fix a typo
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
X-List-Received-Date: Wed, 13 Feb 2019 13:23:16 -0000

Hi

On Wed, Feb 13, 2019 at 1:34 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The correct name is Wacom.
> Fix the typo which is present since 378af96155d.
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Use correct English in description

thanks, I'll queue the patch in next chardev PR.

> ---
>  chardev/wctablet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/chardev/wctablet.c b/chardev/wctablet.c
> index 969d014574..35dbd29a33 100644
> --- a/chardev/wctablet.c
> +++ b/chardev/wctablet.c
> @@ -177,7 +177,7 @@ static void wctablet_input_sync(DeviceState *dev)
>  }
>
>  static QemuInputHandler wctablet_handler =3D {
> -    .name  =3D "QEMU Wacome Pen Tablet",
> +    .name  =3D "QEMU Wacom Pen Tablet",
>      .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
>      .event =3D wctablet_input_event,
>      .sync  =3D wctablet_input_sync,
> --
> 2.20.1
>

