Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0pwM-0006qF-Sc
	for mharc-qemu-trivial@gnu.org; Sat, 07 Oct 2017 10:18:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0pwK-0006pk-NZ
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 10:18:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0pwJ-0001tI-H0
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 10:18:52 -0400
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:48735)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0pwJ-0001rw-9V
	for qemu-trivial@nongnu.org; Sat, 07 Oct 2017 10:18:51 -0400
Received: by mail-wm0-x231.google.com with SMTP id i124so12778584wmf.3
	for <qemu-trivial@nongnu.org>; Sat, 07 Oct 2017 07:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xhDQ8AHJ6UjpuYDgV7eXZ1pDD0k7gy1TFNmom62LEOo=;
	b=acrzvEyfccPXETwxz8eu0QfTkI/HXeYw2pMvLdV+x3IqOaTtpEdh/rrUJl01t8s+35
	GlRBav82ZDixDl2fIKWS8wzKjHLdx3gAYWEkKorTH8FNSVPT9tQrDia+7cJrczsA3fkR
	PmmwQ+EzI0oE+qqOjppZ4Bo0SludnohqBOuJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xhDQ8AHJ6UjpuYDgV7eXZ1pDD0k7gy1TFNmom62LEOo=;
	b=E3oUSe9+LF54A6nWrqabO1CHVtp6dcZ6redUAPbacovhnjNNA/P86Zywpy3iJU4BMQ
	2Sf2xZtcA/NUzFe8nRUiwQrqxaSO15wuQp2wqu5KWNwd9R2oppvuacD2VboN7tPuy/aN
	04Kf23FVir3oTMWvfFXUySpUICxCq+rCVDquTi1HiS72XKDtH2BInzfH6pO4GPmacDKu
	QnJfzEAXkDVyXsu44QT8Hr/o2aJQkOZOdTa3t5i7+WtMC0itk3lUuaKonO72wCtFpOIA
	338x1+OMQ4QxKbXp7PZZMn3R9Hc93tyy7XCJHmSCz/0LdgIqwkUlmfClNnM2A2XN9mIz
	Oenw==
X-Gm-Message-State: AMCzsaWhtHi6Nqjv+faNMtRkvjJXuGBl3A1nCFu0leekKmo/2+Bzg0cK
	I3cT1jaTL2YQOj6AtHoeWX+yR0yeptMV2OkcPu6hiA==
X-Google-Smtp-Source: AOwi7QAQe0RLns7aYCsdjVoL8g0S3d3mCTUqvjbJQ+yO7wprow+8GOk9Lt9BW31SPbCaE6mkag181ph9csQiVp0MYfc=
X-Received: by 10.28.23.3 with SMTP id 3mr4022506wmx.62.1507385929981; Sat, 07
	Oct 2017 07:18:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Sat, 7 Oct 2017 07:18:29 -0700 (PDT)
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 7 Oct 2017 15:18:29 +0100
Message-ID: <CAFEAcA_ua3Y=OC_HDq98st-8+7ZScmYXU0Sj=XUgfTm4POY0iA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	qemu trival <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/88] use g_new() family of
 functions
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
X-List-Received-Date: Sat, 07 Oct 2017 14:18:53 -0000

On 7 October 2017 at 00:48, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> Hi,
>
> This is a follow-up of Marc-Andr=C3=A9's clang-tidy series [1].
> While chatting we realized we were trying to reach the same goal, Marc-An=
dr=C3=A9
> using clang-tidy and me using spatch; so he let me finish his series appl=
ying
> my changes over his.
> I also included Jan's patch which fits well.
>
> Summary:
> - 1 bugfix (memory leak)
> - few optimizations (avoid to zeroise when all memory is assigned)
> - bunch of mechanical refactors

88 patches is way too many for a single series, even if it is
mostly mechanical.

thanks
-- PMM

