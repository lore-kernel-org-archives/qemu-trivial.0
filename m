Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqayw-0003NL-GZ
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 04:56:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gqayu-0003MQ-TA
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 04:56:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gqayt-0002kI-S7
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 04:56:00 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52599)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1gqayt-0002jg-La
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 04:55:59 -0500
Received: by mail-wm1-x344.google.com with SMTP id m1so12428461wml.2
	for <qemu-trivial@nongnu.org>; Mon, 04 Feb 2019 01:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=/bUxXjM8upN0hijZFzy2VdZEZ+ONeoKgnMgIntgC/eA=;
	b=WnU4SWArVAx/fa25rrfIzGqRkq9sonkGuOSbR47w+BJxhVbRUcDTiwXavt7nreS2IW
	WGxh8bbVXL5NcID0MIG0hzV8zRwvRZp7QLmW4PFapU3GaU08gMfVW17YTRiNjkheJOt1
	9cwxCX7J8NE7J/+5r/oda8uyDmc++Q0iBsxVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=/bUxXjM8upN0hijZFzy2VdZEZ+ONeoKgnMgIntgC/eA=;
	b=RcZuKYre3dqEm2uHW0zRONQ2M8fDMliQDqbbpyhwOK6odK7obYHUOY+w47c47u/6sU
	lXmnI9kPlQ7KFkWB7vF+T0vrqMBIwC5m+y31TJY4LSnNgiv91iLGxq6+DbG11caeU5np
	Rc/4lpojI8H7q0ZzBssXAQQF69BKHNRSnO+pHE7QE+ontOPlHC4fRnX4oVv45qqNYukv
	bw2hQeWVaIqY2JSp/ENfU3KKm8ZTtaTL9FMRtaalrecrWCWa8J4IXuJ685ayPWEimCDI
	en2z4aIZj0jkmV2Ik1MHf8VeJDVUfon05YLUr/rC2wJWXYtVjc0qtcmM9INMV/dRljiW
	dGUQ==
X-Gm-Message-State: AHQUAuajjVkygvULqvG/fGWy0B8Cgm28Mp937gMM/ss2Z+SLU3rXY7By
	JV2CJ5uoqDWwQ8s5E8BH7qqVXw==
X-Google-Smtp-Source: AHgI3Iaj011gXo2/3yH4N86M4nU5rTi8VpKqZnQ7Hy1B+obocIOcD5NG/kigeqdsjTBWWlQj5gD7qQ==
X-Received: by 2002:a1c:96ce:: with SMTP id y197mr13080681wmd.36.1549274158336;
	Mon, 04 Feb 2019 01:55:58 -0800 (PST)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id 126sm7470501wmd.1.2019.02.04.01.55.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Feb 2019 01:55:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTPS id 56A631FF7C;
	Mon,  4 Feb 2019 09:55:57 +0000 (UTC)
References: <20190201173655.4567-1-peter.maydell@linaro.org>
User-agent: mu4e 1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
In-reply-to: <20190201173655.4567-1-peter.maydell@linaro.org>
Date: Mon, 04 Feb 2019 09:55:57 +0000
Message-ID: <87y36vc1xu.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-trivial] [PATCH] qemu-common.h: Update copyright string
 for 2019
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
X-List-Received-Date: Mon, 04 Feb 2019 09:56:01 -0000


Peter Maydell <peter.maydell@linaro.org> writes:

> Update the copyright string we use in version/help output,
> since we're well into the new year now.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
> Better than last year, where we didn't get round to doing
> the year bump until September :-)
> ---
>  include/qemu-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index ed60ba251d8..a1022455199 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -17,7 +17,7 @@
>  #define TFR(expr) do { if ((expr) !=3D -1) break; } while (errno =3D=3D =
EINTR)
>=20=20
>  /* Copyright string for -version arguments, About dialogs, etc */
> -#define QEMU_COPYRIGHT "Copyright (c) 2003-2018 " \
> +#define QEMU_COPYRIGHT "Copyright (c) 2003-2019 " \
>      "Fabrice Bellard and the QEMU Project developers"
>=20=20
>  /* Bug reporting information for --help arguments, About dialogs, etc */


--=20
Alex Benn=C3=A9e

