Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHXrl-0003d2-S0
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 13:31:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHXrj-0003b1-Vc
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 13:31:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHXri-0004M6-WE
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 13:31:43 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:32853)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gHXri-0004G5-Mf
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 13:31:42 -0400
Received: by mail-ot1-x344.google.com with SMTP id q1so2455821otk.0
	for <qemu-trivial@nongnu.org>; Tue, 30 Oct 2018 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mNufS7vs4ADt5Fr1RqM+RnfZ06HLxwtX1wfG3CjIseE=;
	b=TB36RkbcAWC/z7qupksi1/XDxq5r/k9xqwaDncouk55xhHEs35rKzrIugvBoVAUN/E
	jvTB5kJYDFR7l6e1zvmefPV3xzjmTWrNa+T17pu2NaKAOk/TK7yx+bCn1cfZvK96CJUg
	3o0LmGDioXyrmrVOgqhqO8sbZq3VSSd1xuzZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mNufS7vs4ADt5Fr1RqM+RnfZ06HLxwtX1wfG3CjIseE=;
	b=SXQbmoFQicz5hcucztU9Td+B3JqtP7j650+1VEj12ncVZeoxh2QMdkIavO12GuPWtZ
	BMs0iHXlMPzGLS15NDTR8vM3Mt8UPQbqpI0fWuUi2nj1zrJsDWjHVMPVGbDQgdKSkKFv
	Ya16GUC2VtxQXTQYiZNtxA4v0cXDlvFPfzjjN3+RcBVleFE0ly5YKxCLTLXDgP0PRPC6
	5s7IOGIC+sasXCWg+DHDGa8fYDfHYmMJSGYJLcvHHhPsYjgbow/OZRZotBndhCnOI8xP
	5fEuzpsSLL0tTA8xDNp4fvrlFBus56UpBMC8zC4YoOZVHrr0tCQSRL0YxuHibulD8a6A
	JJ3Q==
X-Gm-Message-State: AGRZ1gJu1pIMbsZRGeqxNS9fyJ1yd/6EK2MBoZ4XjpYTNzej0zkltoE2
	yxuL01ZefvrtT/poZCFKR4bqvuiOxAKhwX2BLXyIhQ==
X-Google-Smtp-Source: AJdET5eS+PaFl/QpGIon5wOLunwhSLOomjfR9pwdGc8BbnaP8XYe+8zIcR1lUJR9UzaLV4pnMQqxjJwmDZberxHjWuo=
X-Received: by 2002:a9d:64d1:: with SMTP id n17mr10794725otl.151.1540920688693;
	Tue, 30 Oct 2018 10:31:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 10:31:08
	-0700 (PDT)
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Oct 2018 17:31:08 +0000
Message-ID: <CAFEAcA9wOKFxRQDqaxtz5krfskGnxrDjTApE8BZxDH--0bWLew@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	Cleber Rosa <crosa@redhat.com>, Jason Wang <jasowang@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, 
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Stefano Stabellini <sstabellini@kernel.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Qemu-block <qemu-block@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>, 
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-trivial] [PULL v2 00/20] Qemu trivial for 3.1 patches
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
X-List-Received-Date: Tue, 30 Oct 2018 17:31:44 -0000

On 30 October 2018 at 11:23, Laurent Vivier <laurent@vivier.eu> wrote:
> The following changes since commit 808ebd66e467f77c0d1f8c6346235f81e9c99c=
f2:
>
>   Merge remote-tracking branch 'remotes/riscv/tags/riscv-for-master-3.1-s=
f0' into staging (2018-10-25 17:41:03 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/qemu-trivial-for-3.1-pull-request
>
> for you to fetch changes up to 7b2b797cf0addac789ba858fdbd95c55128d72d5:
>
>   milkymist-minimac2: Use qemu_log_mask(GUEST_ERROR) instead of error_rep=
ort (2018-10-30 09:13:31 +0100)
>
> ----------------------------------------------------------------
> QEMU trivial patches collected between June and October 2018
> (Thank you to Thomas Huth)
>
> v2: fix 32bit build with updated patch (v3) from Philippe Mathieu-Daud=C3=
=A9
>     built in a 32bit debian sid chroot
>

Applied, thanks.

-- PMM

