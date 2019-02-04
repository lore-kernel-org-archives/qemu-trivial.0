Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqax1-0001uL-6H
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 04:54:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gqawy-0001sT-Q4
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 04:54:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1gqaww-0000yD-Qq
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 04:54:00 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33770)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1gqawu-0000wR-SP
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 04:53:58 -0500
Received: by mail-wr1-x444.google.com with SMTP id a16so8061722wrv.0
	for <qemu-trivial@nongnu.org>; Mon, 04 Feb 2019 01:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=58M/3IZDXxPNed5Wwl9hh4udB2pY9WimGOkwRMhhL1E=;
	b=V9J61qtq3MzF47zftWfZZPB3g4brbZ6t6EO8wnYWJEByVsZbrDJ3n0ZAn769ZrFvoW
	rOaBH3lcADMW8IXw9Xl2i5bdU66g3Tbbg4bU0BeChINVpCk8cRE5S0dAeb0/e5/aZAaO
	4ywsc6VKn6wzk+5QECQX6pc7CP0np9IaMENKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=58M/3IZDXxPNed5Wwl9hh4udB2pY9WimGOkwRMhhL1E=;
	b=kYObC0YvQnw+bs1MHXBSliIdEeXqMSkPPerXtOa1NRINGVwPygfDc1kIeC6YfW6pxd
	p+DdCT1eAZEcqLEwAZp3aRByZpp4YqrvAYfW7CG1i/0qNE5xj2egGKnwXJfQLOY2pXQw
	Nhlco5rvH/mVyAPtrBFJ5K2yIikfTImwUkoN83S9mPS0yqZDJaFiemw/XsGEZSK8NgUp
	7zFckVeCZsScoPeleLuks19XO0+DMZiNbTQ/0DtacfMjboLqSA0DDJvo7BQLqk6GyQPk
	xJrfHumRs0EW9kqkxw6sM7+8o+rhSkEzTYY0XqYu80HwAfatU/RZtEQdTBRrefMSlhps
	PlGQ==
X-Gm-Message-State: AHQUAuabrG2oNIAfgIoahJRpu/Cp3U9B81h4KDwf90Jg6fjwyaAsGuhL
	LtxrECgIpX73Tn/1H8VhfRE7qQ==
X-Google-Smtp-Source: AHgI3IbEil8R+1Fn7/nK4FJgezEzMOyBUckY6ieIwXmbjqSLS45PoJXHm9JBGYw5S4fudt64tGqF+w==
X-Received: by 2002:adf:f28d:: with SMTP id k13mr19020769wro.78.1549274034057; 
	Mon, 04 Feb 2019 01:53:54 -0800 (PST)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	n9sm12373549wrx.80.2019.02.04.01.53.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Feb 2019 01:53:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTPS id F1A6C1FF7C;
	Mon,  4 Feb 2019 09:53:52 +0000 (UTC)
References: <20190201193234.20796-1-eblake@redhat.com>
User-agent: mu4e 1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
In-reply-to: <20190201193234.20796-1-eblake@redhat.com>
Date: Mon, 04 Feb 2019 09:53:52 +0000
Message-ID: <87zhrbc21b.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-trivial] [PATCH] tests: Ignore fp test outputs
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
X-List-Received-Date: Mon, 04 Feb 2019 09:54:01 -0000


Eric Blake <eblake@redhat.com> writes:

> Commit 2cade3d wired up new tests, but did not exclude the
> new *.out files produced by running the tests.

Queued to fpu/next, thanks.

>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/.gitignore b/tests/.gitignore
> index 72c18aaab04..f2bf85c8c4c 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -5,6 +5,7 @@ benchmark-crypto-hmac
>  check-*
>  !check-*.c
>  !check-*.sh
> +fp/*.out
>  qht-bench
>  rcutorture
>  test-*


--=20
Alex Benn=C3=A9e

