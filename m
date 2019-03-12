Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hpW-0005Hn-G7
	for mharc-qemu-trivial@gnu.org; Tue, 12 Mar 2019 09:52:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3hpP-0004xp-28
	for qemu-trivial@nongnu.org; Tue, 12 Mar 2019 09:52:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3haz-0003k0-Ji
	for qemu-trivial@nongnu.org; Tue, 12 Mar 2019 09:37:30 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:36585)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h3hay-0003j6-5z
	for qemu-trivial@nongnu.org; Tue, 12 Mar 2019 09:37:28 -0400
Received: by mail-io1-xd2b.google.com with SMTP id f6so2108602iop.3
	for <qemu-trivial@nongnu.org>; Tue, 12 Mar 2019 06:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6JDHbRa8e6I+9J63d7IwetV+h8G2MSP95EJk6F4BQu0=;
	b=sM+oNr/8oN6qTkMoDT9/o4ZulKysAz0IYrZ+P9TnIA/gKHa0Mzz8QwT5zTLc7nDyvH
	65S9b8qF1fpSsIJOq0KFlXrLQzSIJ56GtSZ29TTpNryXetu3G7FKxqX8gLQcyKphmGzi
	ASXo413HxWYDMaYaVv5+1uz7jGeM70oDsQkbUUJWYyGjDH4HZmQHe4nn7hzfC7Qcfsaa
	/gSLUzUhey1blFhrUBLunz+9EYE62DUeMQnOilr4xcbs7Fg91GXlrNlTmHJNh8vUvSs8
	jPOefZS31CI5qOqfj+oMYvspxIl82i1/njnnGphks/cgq6sgyMKgur6yF+itzLVi5noS
	YMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6JDHbRa8e6I+9J63d7IwetV+h8G2MSP95EJk6F4BQu0=;
	b=i6vCooz1rhBI4uqZtHBXwkBIRlm0Q/98Udo+iVZNP+EepNPlD4A9yf8DDggONLGWGx
	FR1mGusdj7zIuH4SQh2cL5LlzMW7lkEYaeLlf3KUQz0+1fELarXWqZA+aUnC5fhlw+2j
	9sxBEZui2LnRxMQ+4pDTL6J7Yi5dY2yigrQiNbBb9fJBOmlWjQRZ77k9TaLKe9dnz4o6
	H+Ko5QNT7ZRiJ8RNOFX9/0banylc6eDPm3ygc/JZFQxR0eSi1KoJdvTIUSg7BJQ592z0
	pOKjWkGtn+o/yxKFPjDVYOw8TFT9nu093m0jRLWb+61eB3M9zW5e9iSCGc/DH7vC2fRv
	syUg==
X-Gm-Message-State: APjAAAX3LQTQo6I7x1jznKtt/Bgryr0CbYrsrh4wV0va2AwA6Mn4rcc/
	IEXGZLNOivThQ3cSgtMY1tuw9s5/0c+y00+1gs2aQQ==
X-Google-Smtp-Source: APXvYqze2Izsoe+CufKq+AuGLkmkZm9dkMmvYMg3NE6px9eywaIaWz+9wf6P1bYapREed+G9JPzMeXmhDRi8EWQCTeM=
X-Received: by 2002:a6b:e305:: with SMTP id u5mr406865ioc.262.1552397847148;
	Tue, 12 Mar 2019 06:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190311191128.30562-1-laurent@vivier.eu>
In-Reply-To: <20190311191128.30562-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Mar 2019 13:37:16 +0000
Message-ID: <CAFEAcA_y+6WVkpkGww1UszZCzQjkcifz671MUOzVM-7Z7XdQzw@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laszlo Ersek <lersek@redhat.com>, 
	Riku Voipio <riku.voipio@iki.fi>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Michael Tokarev <mjt@tls.msk.ru>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d2b
Subject: Re: [Qemu-trivial] [PULL 0/5] Trivial branch patches
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
X-List-Received-Date: Tue, 12 Mar 2019 13:52:29 -0000

On Mon, 11 Mar 2019 at 19:11, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 208d92df447bde0f1f810fae8a2c523cdeb7a2=
8f:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20190311' into =
staging (2019-03-11 16:27:14 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 3b777a79c1cfa40f39f96220bc733eccd7392c9c:
>
>   hw/nvram/fw_cfg: Use the ldst API (2019-03-11 18:48:20 +0100)
>
> ----------------------------------------------------------------
> fw_cfg and thunk code clean up
>
> ----------------------------------------------------------------
>
> Aarushi Mehta (1):
>   thunk: improve readability of allocation loop
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/nvram/fw_cfg: Remove the unnecessary boot_splash_filedata_size
>   hw/i386: Remove unused include
>   hw/arm/virt: Remove null-check in virt_build_smbios()
>   hw/nvram/fw_cfg: Use the ldst API
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

