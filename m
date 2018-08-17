Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fqizD-0008U9-AR
	for mharc-qemu-trivial@gnu.org; Fri, 17 Aug 2018 13:56:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hans-erik.floryd@rt-labs.com>) id 1fqizB-0008So-7u
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 13:56:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hans-erik.floryd@rt-labs.com>) id 1fqizA-0000jp-CJ
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 13:56:33 -0400
Received: from mail-it0-x22a.google.com ([2607:f8b0:4001:c0b::22a]:33613)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hans-erik.floryd@rt-labs.com>)
	id 1fqizA-0000j8-3Z
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 13:56:32 -0400
Received: by mail-it0-x22a.google.com with SMTP id d16-v6so2176854itj.0
	for <qemu-trivial@nongnu.org>; Fri, 17 Aug 2018 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rt-labs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hkUwKpDWlk58n73TR0A/zAPMtfYVbKD8XVS0OzXthNA=;
	b=YxkRy8c+KXFaoMw8UE/L9/2QLEoraw1T9xGz6FcmsW+31FOZlAFRnC3DVwhieDrHrX
	v+Vff5wL8UjXxl1KhhfHa6iT0cVwStMbNv8h8PjJHFp/hsdN75uUpVJtW6CMXHf3heb8
	/WLBRqVKyCywzBxQCrbn4RyNQyiitAL3rgyGBb5541bBd7G9rAXffw3u5rS8M7YI28ci
	pw3Q4JOXFXWISzF1R1tY8YyWvtDo2EsdvqErMeBFAXTylitkF2jrI9skdD8ccYuYZZ8g
	+tgHSp/BWZd3DWmSnad2KMNLMwBEAczkYmotrPuVQFAe9piDfjoET9uXFm42Bggzgt+Q
	yLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hkUwKpDWlk58n73TR0A/zAPMtfYVbKD8XVS0OzXthNA=;
	b=qlBgNeAXqtqrDw/5kEIq3SUakczAcE+vQLIhNwu0bAicMvutEs94inetDhEz79PKzw
	d5kAgVSEyel6jiRfTIszIjOumWgu534BhWw6JK/6GiOac6EPfCzXTdzPezsmluiqnEc/
	kbYyCS3qzkFD84KILl09vUGzITm6Rq4UsIcvfk8BBwz8OS7XVWqwLIrHkF+4BEMeOTVF
	8I2388KM+vsg80JT5EmLIaY3hqbDghvadM1UyBbKQERr7no5t/3+iJayyhQ3oQMWt7hO
	HG2eX75vHrSBSVpl7YGZwaRNfxwekMuR/4gu9Fs6WHZIgfVvU7Nd3nBKL/DafFyOoA+I
	pJ/w==
X-Gm-Message-State: AOUpUlHnLdBvzFFYt22mlvjCDiKISdGn1ziXAgq3lvaj+hmkmqxZhaMw
	GDPicMSJl1JxRS5nCtUoIOPLDteNMQGqxQRjwGI4sg==
X-Google-Smtp-Source: AA+uWPxmzOwYAUz8CFy+7iKWAQ32oIuI2VmRpeFQoBlRwaHtUtsYS2UpK+vcljqx2uOQnFVG+Pzi9LLxPG30pVtqoQI=
X-Received: by 2002:a24:aa08:: with SMTP id b8-v6mr5152046itf.49.1534528590830;
	Fri, 17 Aug 2018 10:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <1534507843-4251-1-git-send-email-hans-erik.floryd@rt-labs.com>
	<CAFEAcA_Ki4Sqke3qExAihjx+x9XpX2e6DJG0ua-VEvdes_gKBw@mail.gmail.com>
In-Reply-To: <CAFEAcA_Ki4Sqke3qExAihjx+x9XpX2e6DJG0ua-VEvdes_gKBw@mail.gmail.com>
From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
Date: Fri, 17 Aug 2018 19:56:20 +0200
Message-ID: <CADS1RdSn1rVnXbWxB6+DmMOEgEsCLA-ZX3tZBA9FXWoAFsegPg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008df7200573a5476c"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] sdhci: add i.MX SD
 Stable Clock bit
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
X-List-Received-Date: Fri, 17 Aug 2018 17:56:34 -0000

--0000000000008df7200573a5476c
Content-Type: text/plain; charset="UTF-8"

Den fre 17 aug 2018 19:51Peter Maydell <peter.maydell@linaro.org> skrev

> (Your indentation was off-by-one -- we use 4-space indent -- but I fixed
> that.)

-- PMM
>

Thanks! I think i fixed that in a new patch so please ignore v3.

/Hans-Erik Floryd

>

--0000000000008df7200573a5476c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
Den fre 17 aug 2018 19:51Peter Maydell &lt;<a href=3D"mailto:peter.maydell@=
linaro.org">peter.maydell@linaro.org</a>&gt; skrev</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
(Your indentation was off-by-one -- we use 4-space indent -- but I fixed th=
at.)</blockquote></div></div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
-- PMM<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Thanks! I think i fixed that in a new patch so please ignore v3.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">/Hans-Erik Floryd</div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000008df7200573a5476c--

