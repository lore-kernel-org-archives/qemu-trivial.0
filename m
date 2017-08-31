Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnS1g-0000bB-J1
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 12:09:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dnS1d-0000Y5-1r
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 12:09:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dnS1a-0004CH-H2
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 12:09:01 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:36368)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dnS1a-0004BG-8C
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 12:08:58 -0400
Received: by mail-wr0-x235.google.com with SMTP id p14so202848wrg.3
	for <qemu-trivial@nongnu.org>; Thu, 31 Aug 2017 09:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9mIUZ6XxUgH1LgQnND+iRl9Ljog/7KeLILy6G//L7FY=;
	b=EG5JMc+VN7S8+UvkhZe0dm0vCJCKC2MRvdyNpai2mphf+XSr+d75TEe/AD1J+k+bgo
	I5F9tMWhIr+wfmsyWvgLPkj86nKHEiH9SEL84CjM91ov2ZehsmPBSiF6oSbf5tVvia3z
	LLiOS9PKWcrIETZi+8JJJx78u8u153O+OjuaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9mIUZ6XxUgH1LgQnND+iRl9Ljog/7KeLILy6G//L7FY=;
	b=LLX1ij7gRYrffkHyrckuxxcibMIwxmdhHcPgNqhnoZ/tm6h1mycuxaOJ/7ZoOKyFNf
	1tCohGjY8jOs+8hy6uuZT7nAjMUbgBU5uS1x3oAq3hxdbunI5g9IjOWWsS1C+TIiEu6/
	6y7DpI/DnTgfaLfbagjoxy3yuK0l1j7kB8E9158Kna78zctaMIgJY0bfkPbgIilktdkd
	SxrweLl2UDPIlKMa3xEhuwQKDto3jG+pvuEJHKje5/FC1OnSscveiPHFMjAkPlI1sBr/
	xUB5hk03G8W7Ya1Knoz789FAdR2ItbtA3iEf7pk8DK4Iv0jF6hz4SInP09dTWJXnCl1x
	WiTQ==
X-Gm-Message-State: AHYfb5jCFIM6HP9HZCXBYn6rNjngpf0dVv9PgibUnwdnPr3wjlqy/Y8l
	1a8qbxUPZuf1quRZHghzo74eFr1t6EUg
X-Google-Smtp-Source: ADKCNb4K1y7PDNLFGHnX+fKejGPGrN9xYwNR7Blc4DN+q5sHZlij+RU5ujX4aTkUOtkEVYv5LE5pzqZ9Z3sZIRlU6A8=
X-Received: by 10.223.132.98 with SMTP id 89mr3099427wrf.97.1504195737176;
	Thu, 31 Aug 2017 09:08:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Thu, 31 Aug 2017 09:08:36 -0700 (PDT)
In-Reply-To: <20170831103432.6007-1-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Aug 2017 17:08:36 +0100
Message-ID: <CAFEAcA99Ne6JMZrLctVpXMQD0iQDfCg9JGypvw4xW6-j_L5DLg@mail.gmail.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-trivial] [PULL 00/29] Code cleanup patches
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
X-List-Received-Date: Thu, 31 Aug 2017 16:09:02 -0000

On 31 August 2017 at 11:34, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
> The following changes since commit 1201d308519f1e915866d7583d5136d03cc1d3=
84:
>
>   slirp: fix clearing ifq_so from pending packets (2017-08-30 23:14:34 +0=
100)
>
> are available in the git repository at:
>
>   https://github.com/elmarco/qemu.git tags/tidy-pull-request
>
> for you to fetch changes up to e4d67e4f2e06128bc7f07263afe9acc2e2242fdc:
>
>   eepro100: replace g_malloc()+memcpy() with g_memdup() (2017-08-31 12:29=
:07 +0200)
>
> ----------------------------------------------------------------
>

Applied, thanks.

-- PMM

