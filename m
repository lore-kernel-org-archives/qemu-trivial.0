Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQUMp-00044j-Vp
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2019 06:09:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hQUMn-00042W-7N
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:09:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hQUMm-0003xm-3W
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:09:01 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40425)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hQUMl-0003iL-NU
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:09:00 -0400
Received: by mail-oi1-x241.google.com with SMTP id r136so11658145oie.7
	for <qemu-trivial@nongnu.org>; Tue, 14 May 2019 03:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ieeBAjC7rpZuKx1Vo4jU6/Nl1XP+QTqXW/y6IG+o4pc=;
	b=B0xJnxhq1R5cxGp1jHWjFsh1nZBukb3pqwtpRvb+wRBqp4tuPL20yENIH5UIdGgSKe
	TjLmt74fl8aLmfHvZKJL53FiE18akQ0c8YOUwfnLGtVvtGoLb/Tj3RIOVBq0EsgGEEHO
	cH41m3Oy/SVZRjCJaNYh8RUinmTOawdxY7c+aOts1eH4kdTJEhc4Il0QlYP2/g+RkZEc
	bXNITqGgI+EZwtf9oku1ZvpfWyQl8QN4Z9OBRLQCmSMSUP7C5qM0POaqPL5dzhFde/ns
	Ut/Tox2xFhVDi3L05luAQNCFkbO1ci7RL9mdwkRUNdIuCcnCXRR4kySYMWuEoXJI1tgQ
	ZL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ieeBAjC7rpZuKx1Vo4jU6/Nl1XP+QTqXW/y6IG+o4pc=;
	b=YK+HpKoLSEFgoIO9X7/R99FhYn8H1RhDngAkzykyqkRjMdf2FJBrCRnTgP3jZ8bT59
	dx6OQFpowVrXByIGUe9gW4Mw5G6bl3q3vhp4ui1WJaQbHP6lwYRiItr6ObDK/+k0IttP
	4ee/vUcHLLGEtg2vjk4O45TISY1mzPXZqKZXO2sliPpV96uTJNnoyae/nf8qxvbNwX1N
	Y8T5xw1Blu6njW9KaEFm0cZ9h6Z21r4hC8uOstDvGIeaH0tIc4Arqv0sZXIMGxMHKTSp
	B0UQWLkmzTZp1jq3RmDWFfTHFEzk0NTVntO9nTBxRl0nYfHekSpg3b7UzEOt3vOIbIwb
	x1Mw==
X-Gm-Message-State: APjAAAXSF8Xs6JcNfQpNPX9C74yYi0SVkap3aThVBeYQJ5CTi5H5ga+L
	66gCGEGBsGq2vM3KnVN/tU7MsGS2zgq3zE+xBfuGyg==
X-Google-Smtp-Source: APXvYqxg9Hv8LjlRUigO2PmtU444YGhXU31fLs8EVrvXrA2sm+FsxqyLFLl6dpOX6QkpeFRiSArNt2ljAS/WsiOPy6o=
X-Received: by 2002:aca:5785:: with SMTP id l127mr2203222oib.48.1557828532815; 
	Tue, 14 May 2019 03:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190514100019.13263-1-thuth@redhat.com>
	<20190514100019.13263-5-thuth@redhat.com>
In-Reply-To: <20190514100019.13263-5-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 May 2019 11:08:41 +0100
Message-ID: <CAFEAcA_WVjE5hZh0EibxiqV+NtqY0VsMPs-tqC3Y=GRCbvhEpg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-trivial] [Qemu-arm] [PATCH 4/4] hw/misc: Add a config
 switch for the "unimplemented" device
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
X-List-Received-Date: Tue, 14 May 2019 10:09:02 -0000

On Tue, 14 May 2019 at 11:02, Thomas Huth <thuth@redhat.com> wrote:
>
> The device is only used by certain Arm boards. Now that we have
> fine-grained Kconfig for these machines, too, we can enable the
> "unimplemented" devices only for the machines that really need it.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/Kconfig        | 9 +++++++++
>  hw/microblaze/Kconfig | 1 +
>  hw/misc/Kconfig       | 3 +++
>  hw/misc/Makefile.objs | 2 +-
>  hw/sparc64/Kconfig    | 1 +
>  5 files changed, 15 insertions(+), 1 deletion(-)

Commit message says "only Arm" but code change changes
sparc and microblaze Kconfigs too :-)

thanks
-- PMM

