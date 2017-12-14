Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePb0T-0005TK-2v
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 16:25:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lepton@google.com>) id 1ePb0Q-0005S3-UY
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 16:25:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lepton@google.com>) id 1ePb0O-0003uo-NS
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 16:25:26 -0500
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:39918)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <lepton@google.com>) id 1ePb0O-0003qK-FD
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 16:25:24 -0500
Received: by mail-wr0-x241.google.com with SMTP id a41so6314096wra.6
	for <qemu-trivial@nongnu.org>; Thu, 14 Dec 2017 13:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4I3dos/sJTdnBOLzonbvhXcWaCsfvfCI/6G7up9lBlA=;
	b=Kd7Jy7eZcVda3nt0nuCuthOumQaXDeqOnDdb8wDXzIojzIHhtwVlTov69fE1EHNarP
	GoP3R9niM9a8t8aTh2XMVkGAZcs+MAZaa+F3tEe1un5bgK5ggdsoBHYYgQOHT/T9uwh/
	/ayQa+2GHxFY2uSwkQpgE5lmlA4mKEkap16/ofZpaJFkDD11YatwEYh8wZEg+Xl9dT7M
	o/MSVRUxja2vNjUeCnD+gzVw0d3L3Ck5CieRGYTYz1YPmDDS8XZhJjbNSzjbcZwAV2Gq
	cAdgVnWQTLaym51Sg2dn80hlmEWc2bsIc6Lkm62D38YiMM9B8XQDxCvg9vc6ofrdOP2S
	YVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4I3dos/sJTdnBOLzonbvhXcWaCsfvfCI/6G7up9lBlA=;
	b=MaoUjL2ryVwndVNmUwbw2zZPhppaSZ9by0hkA4cknJkCn7QgPBJKKdqogCNUkQ7Sv4
	u16mZa4ZGwmP4fc3g1tkRCP9IwN+nxLr21bYLBrs7q9B4CeKO0fYDIjpLxBk+zfAcqmh
	rTtnSrxjufde1UZO/Fs/Zl1PeGwyFZZZ7amYc8wBaN7jILjC+/l+06Zr9LA5syUWwbV+
	b/s0+KgvvKvaTQpM1HqXWJbcp5PlzHZHA1TRNCn28gVRR6Fq98Cgl/G2lD3DodTKOTIQ
	vEfQlUbd4OlY2dx/SInq4sQNoKK8oHwFMTJeXA01CkS/TsumEaHwOHpZmdzR4d7IVIvk
	iL4w==
X-Gm-Message-State: AKGB3mK8UskK5NxFXPkkVZ/oYBKyyuLtAV3eJ+tgNWRtXSS3i7OmkbKW
	z5RxkHIYVhepDd0qFj2BuhDsE3yXdZYu1pB+/ldzdA==
X-Google-Smtp-Source: ACJfBovYglAZ/W0BppDTctQVSFi4rWhRKqpFBMTMnT0mMpZ8USFnR+C9VX8E3wx1dpzD/VkKuxRO8EfvaoBNQ5FdcxA=
X-Received: by 10.223.132.194 with SMTP id 60mr7636930wrg.249.1513286720430;
	Thu, 14 Dec 2017 13:25:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.131.208 with HTTP; Thu, 14 Dec 2017 13:25:19 -0800 (PST)
In-Reply-To: <20171207065639.164900-1-lepton@google.com>
References: <20171207065639.164900-1-lepton@google.com>
From: =?UTF-8?B?VGFvIFd1KOWQtOa2m0BFbmcp?= <lepton@google.com>
Date: Thu, 14 Dec 2017 13:25:19 -0800
Message-ID: <CAOvqHj4P17JQ=bJqpZsA3n-sfw927Sad3-YD2FUHff1zhpanGA@mail.gmail.com>
To: QEMU <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, mjt@tls.msk.ru, 
	Laurent Vivier <laurent@vivier.eu>, Tao Wu <lepton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-trivial] [PATCH] hw/input/hid: Add support for several
 keys.
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
X-List-Received-Date: Thu, 14 Dec 2017 21:25:28 -0000

Anybody can merge this?

It's a simple change:  actually it only changed 4 bytes in hid usage
table to enable 4 keys: audiomute volumeup volumedown and power.

It's easy to verify what the patch is doing:

Boot some guest os with argument "-usbdevice keyboard"  and use qemu
monitor console to do "sendkey audiomute", without this patch, nothing
happend inside guest os. with this patch,  all these 4 keys work correctly.

On Wed, Dec 6, 2017 at 10:56 PM, Tao Wu <lepton@google.com> wrote:
> Add support for these keys: audiomute volumedown volumeup power.
> Tested with "sendkey" command in monitor and verify the behavior
> in guest OS.
>
> Signed-off-by: Tao Wu <lepton@google.com>
> ---
>  hw/input/hid.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/input/hid.c b/hw/input/hid.c
> index 0d049ff61c..aa4fb826fd 100644
> --- a/hw/input/hid.c
> +++ b/hw/input/hid.c
> @@ -57,14 +57,14 @@ static const uint8_t hid_usage_keys[0x100] = {
>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>      0x00, 0x00, 0x00, 0x00, 0x58, 0xe4, 0x00, 0x00,
> -    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -    0x00, 0x00, 0x00, 0x00, 0x00, 0x54, 0x00, 0x46,
> +    0x7f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x81, 0x00,
> +    0x80, 0x00, 0x00, 0x00, 0x00, 0x54, 0x00, 0x46,
>      0xe6, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>      0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x48, 0x4a,
>      0x52, 0x4b, 0x00, 0x50, 0x00, 0x4f, 0x00, 0x4d,
>      0x51, 0x4e, 0x49, 0x4c, 0x00, 0x00, 0x00, 0x00,
> -    0x00, 0x00, 0x00, 0xe3, 0xe7, 0x65, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0xe3, 0xe7, 0x65, 0x66, 0x00,
>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> --
> 2.15.1.424.g9478a66081-goog
>

