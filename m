Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8QWW-0001GB-37
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 09:52:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1g8QWU-0001ED-70
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:52:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1g8QWO-0005Cr-Ek
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:52:05 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52354)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1g8QWO-00050O-54
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:52:00 -0400
Received: by mail-wm1-x342.google.com with SMTP id 189-v6so1958507wmw.2
	for <qemu-trivial@nongnu.org>; Fri, 05 Oct 2018 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=yC1AZhSNnEq+pkXBo+yxRL6K2uKFZKVKfF9FQ7DKDCE=;
	b=iFOVPAle7MeAGcdxEs8Dl06zYxT02qdXtjpPMSd3MCar6k9MmW6+o3PxR4rRz4+4Gi
	CQdNscSHzTAHZRbNcvaG0KR23CkMdYpL9/g30xn7mlTqDZrcrzFF4NMdG9iYHzDkSjUX
	u5arNORebXiC90r2Q7laTgoUzaFYYC2NqEDjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=yC1AZhSNnEq+pkXBo+yxRL6K2uKFZKVKfF9FQ7DKDCE=;
	b=WT/FEPZupgA5mFWOnpCkRFpUndhYnCX4bhPuz3AcCfBSlBZ1O8NYV1VrCrO5oL1XKl
	cr+ShObzisUtAXuWo48xr7410TUj/ysfKoeOvpSTadlDu+4ULJEKW/rE7Fb0c7bevXrO
	rsT/ku7jC2BvFrLaIHvlYfGUH6OC77MHKGcdJDNyOqSOiLe2PNOrBUansmQkbrRB1rrY
	8vRKVLHrnBQdbtLgs+ixAJKGYezrTipCVkZHWTA4qPRlWD6eCEVm7f6xQvWAnbeSVlZ6
	bVb9wvNxNls7RyxkrihjGcEYdApZBDL+XnYaHQswxw36zQWVa1tQ+fY25VYJ8NPUhTAH
	oH5w==
X-Gm-Message-State: ABuFfogHAMfdRPqsSZqKl8VGFKml4ew+Mtiluw//5FApG2ke92pMg6BW
	Up4isg9yiYRue1D/GFERkkiSfQ==
X-Google-Smtp-Source: ACcGV61jk17Wk9/U8C9nc/p5WAkYlw5qJDq+8g9zV5zXXqSTSs9FEAiyHSWg8WmlBp7XssMukyN3JQ==
X-Received: by 2002:a1c:9cc9:: with SMTP id
	f192-v6mr8326178wme.135.1538747506882; 
	Fri, 05 Oct 2018 06:51:46 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	63-v6sm2216633wmj.39.2018.10.05.06.51.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Oct 2018 06:51:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 8C42B3E0248;
	Fri,  5 Oct 2018 14:51:45 +0100 (BST)
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-3-crosa@redhat.com>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Max Reitz <mreitz@redhat.com>
In-reply-to: <20181004161852.11673-3-crosa@redhat.com>
Date: Fri, 05 Oct 2018 14:51:45 +0100
Message-ID: <87mursqz66.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 02/10] tests/tcg/README: fix
 location for lm32 tests
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
X-List-Received-Date: Fri, 05 Oct 2018 13:52:07 -0000


Cleber Rosa <crosa@redhat.com> writes:

> Point to the right and obvious location for lm32 tests.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/tcg/README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/tcg/README b/tests/tcg/README
> index a5643d33e7..2a58f9a058 100644
> --- a/tests/tcg/README
> +++ b/tests/tcg/README
> @@ -10,6 +10,6 @@ with "make test-cris".
>
>  LM32
>  =3D=3D=3D=3D
> -The testsuite for LM32 is in tests/tcg/cris.  You can run it
> +The testsuite for LM32 is in tests/tcg/lm32.  You can run it
>  with "make test-lm32".

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

It's a correct fix, although I note running "make test-lm32" doesn't do
much either in the top of the build dir or in that directory. It's
probably best to drop the second line until I fix it.

--
Alex Benn=C3=A9e

