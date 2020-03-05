Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9qpk-0004Pr-Lv
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 08:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1j9qph-0004Oe-B4
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:46:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1j9qpg-0001EK-97
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:46:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24679
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1j9qpE-0008Ij-8S
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583415968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6i6J/ZO2uJcvhEMUp6AaWtb7QAU+P3DUj5FKCo8zhpM=;
 b=ZuGA7Avb8QnXaPBAvQgUW1DLZFns6kYjjDdkFEtDhHer28CTDGOly8cjT5R8HpkEDTfIXd
 c3a2d3orGhKfQF8lTwHCgL3Zqsj+Nw5FPrpAerScvgF1w6yj3RquTB1GolHo2xJgxWThah
 6sEeH+QEp7kF/B4evhvGJdBtrBI4RfE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-1d9pE7LQP4CFFp3tHs_U5g-1; Thu, 05 Mar 2020 08:46:04 -0500
X-MC-Unique: 1d9pE7LQP4CFFp3tHs_U5g-1
Received: by mail-wm1-f71.google.com with SMTP id m4so2104637wmi.5
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 05:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R70thXHi2jvFEPUziKxN/UBg3AR9WUqn2zvOAbJVSGY=;
 b=G/Gyz/UEyVOYJjzVIrnbd8Expe7OONBbTomdHFXBaV3c/67Yrjq5Loj4ElgWbartny
 RG/MrIoHUAsEaAIjTqQIlehB79BRtPVITFq4KCz3oex7RLOwdCqa/1m82UuzTzzW5S1A
 +WKQwUTBwNUs+sIlKxMdg8IpjHH6yqYz1sdCnIWja83m1u3RVp58D5orZSmiHcY2S4Dg
 lGVhP/xhcwqxxLCFaTPx2udnMNMls0Vlg3JdtcWGAzhj/ctNCaMVK4wgRoqYpLhhPM8S
 5UzsO7vnedsFM5JIsFtiF28Vk/sFwHeV9VllnW4qkmlJTVF72JzG++FLdpG5euuNvLnU
 HoZQ==
X-Gm-Message-State: ANhLgQ1ZHpCqwqzhRW4i4ObXt27XtAyo8+RJEdCH3QuueVU6/wpVJ6eh
 rcXiu5aKbIGmaRDiE66G2bGtj+eagYJV4IQLsbu8OxA013gGX6LexIMIqZq8NZmkAZV30RrsUTs
 c2C8yaBZcX+ClUbgssg==
X-Received: by 2002:a1c:9602:: with SMTP id y2mr9518975wmd.23.1583415963431;
 Thu, 05 Mar 2020 05:46:03 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsTsbUktOcERlYeYj35xB/mlIbD0LIvakGqkk80wLIsxAj+VRiJpHQTtWVNo+j2yvwFXEpl9g==
X-Received: by 2002:a1c:9602:: with SMTP id y2mr9518954wmd.23.1583415963233;
 Thu, 05 Mar 2020 05:46:03 -0800 (PST)
Received: from steredhat (host34-204-dynamic.43-79-r.retail.telecomitalia.it.
 [79.43.204.34])
 by smtp.gmail.com with ESMTPSA id f6sm11781555wrw.4.2020.03.05.05.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:46:02 -0800 (PST)
Date: Thu, 5 Mar 2020 14:46:00 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Subject: Re: [PATCH v2 7/9] ui/curses: Make control_characters[] array const
Message-ID: <20200305134600.w3hdfi7o7tldivww@steredhat>
References: <20200305124525.14555-1-philmd@redhat.com>
 <20200305124525.14555-8-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200305124525.14555-8-philmd@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Thu, 05 Mar 2020 13:46:39 -0000

On Thu, Mar 05, 2020 at 01:45:23PM +0100, Philippe Mathieu-Daud=E9 wrote:
> As we only use this array as input, make it const.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  ui/curses.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>=20
> diff --git a/ui/curses.c b/ui/curses.c
> index 3a1b71451c..3bafc10c1c 100644
> --- a/ui/curses.c
> +++ b/ui/curses.c
> @@ -529,7 +529,7 @@ static void font_setup(void)
>       * Control characters are normally non-printable, but VGA does have
>       * well-known glyphs for them.
>       */
> -    static uint16_t control_characters[0x20] =3D {
> +    static const uint16_t control_characters[0x20] =3D {
>        0x0020,
>        0x263a,
>        0x263b,
> --=20
> 2.21.1
>=20


