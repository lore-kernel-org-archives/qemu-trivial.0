Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRFQI-0003JN-QT
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 06:51:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gRFQH-0003IN-4d
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 06:51:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gRFQ9-0006Nr-Q0
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 06:51:27 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41297)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1gRFQ9-0006MC-BX
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 06:51:21 -0500
Received: by mail-wr1-x442.google.com with SMTP id x10so18575440wrs.8
	for <qemu-trivial@nongnu.org>; Mon, 26 Nov 2018 03:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=UxR3u5Nd93TtFqj390SvuTg7xS+tD3L58oFxNSdHjYA=;
	b=A2Fa3GO6DY0I3lOWxRG4Q38eDYc57PTrLeyWFQmHYSuFAcxswUJDxZvC0ioUSVOLO8
	yyC8Q08bieHfSgZCBThQPoatOC97R1IKGOwRnIA2fR5jbBCItcQnHDs3pRkEDEyuibWj
	IdBMIsHxs7iexLzZKEU3ez+24aJDnic74Phu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=UxR3u5Nd93TtFqj390SvuTg7xS+tD3L58oFxNSdHjYA=;
	b=n+r6MfJUgyP0lS4NLcuhTY90MZf5NEwvJ9do8C8g1zFQLvy7MV4TbOxvd4lkQSffBj
	2cw9w8Q/iu2QQCqKoh0Ht2ponYt8a7xnZDyxbMkOc5kp9cAKxMbBbvv6maI1RsCo02Ps
	z6qGDMkF8j8DvIbObStrYC6kkSsoZUyXMUMfcf8caTHpO3ZbBkfwchKOXgRmC6IHBAEb
	TlLfTpS8DQrd1ah6JpFrHO0jIusCiqndypfMu1Q/x9UkclNgOWEKeAH/8iUhO7JEOI2R
	qkeVXN/uZbIae0BZu16ecJQ6e0DYB2atxvZN/PUziR4zrGVaZCnsyXo66CTsUpyaUa0o
	9uMw==
X-Gm-Message-State: AA+aEWb9/b9TMjOsG7Jq6Ij6OJTAVwQhVE9QfBfDdUzXj2nQ+QRa/Dt4
	GsWMChRRmn56S2J4hG10fSYPPq3TjBM=
X-Google-Smtp-Source: AFSGD/WjOABOu9gopwiHxEX2136OuHqSPtmLGfwbSSRs5tZs5iG4bgdIwD0BTBahJelBXyvzXvJ1uQ==
X-Received: by 2002:a5d:4dc8:: with SMTP id f8mr23918953wru.45.1543233079030; 
	Mon, 26 Nov 2018 03:51:19 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id y8sm645319wmg.13.2018.11.26.03.51.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Nov 2018 03:51:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D4F6F3E053E;
	Mon, 26 Nov 2018 11:51:17 +0000 (GMT)
References: <1543226303-5260-1-git-send-email-liq3ea@gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
	laurent@vivier.eu, qemu-trivial@nongnu.org, Li Qiang <liq3ea@gmail.com>
In-reply-to: <1543226303-5260-1-git-send-email-liq3ea@gmail.com>
Date: Mon, 26 Nov 2018 11:51:17 +0000
Message-ID: <87mupw3vm2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target: hax: fix a typo
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
X-List-Received-Date: Mon, 26 Nov 2018 11:51:29 -0000


Li Qiang <liq3ea@gmail.com> writes:

> Cc: qemu-trivial@nongnu.org
>
> Signed-off-by: Li Qiang <liq3ea@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/i386/hax-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
> index 502ce6f0af..464744a406 100644
> --- a/target/i386/hax-all.c
> +++ b/target/i386/hax-all.c
> @@ -205,7 +205,7 @@ int hax_vcpu_destroy(CPUState *cpu)
>      }
>
>      /*
> -     * 1. The hax_tunnel is also destroied when vcpu destroy
> +     * 1. The hax_tunnel is also destroyed when vcpu destroy
>       * 2. close fd will cause hax module vcpu be cleaned
>       */
>      hax_close_fd(vcpu->fd);


--
Alex Benn=C3=A9e

