Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wi5VH-0000dj-JU
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2014 13:19:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wi5VA-0000Wf-Ui
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 13:19:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wi5V2-00077v-Su
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 13:19:28 -0400
Received: from mail-lb0-f178.google.com ([209.85.217.178]:56368)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wi5V2-00077E-L6
	for qemu-trivial@nongnu.org; Wed, 07 May 2014 13:19:20 -0400
Received: by mail-lb0-f178.google.com with SMTP id w7so1850016lbi.9
	for <qemu-trivial@nongnu.org>; Wed, 07 May 2014 10:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BLusvJ6pqr1GNnXYcPZ0ubmpMApkgMDIBTDbhrLz/JU=;
	b=gJe5sbkBa45c+7FcnwIY37gka/237g9ectFouRXN4A9U8/97no5GDC79XBwfnAUYtz
	/+ksH9R9sYv0Lp/ADbFzY41zJBDoazxgSxKs1Fbdap0WGjOylRlJa1jXUYw1g2Zd7evq
	LhzFtgjBg7BNPwES3K7md6ZevCdCRluYKc2u+rcxgZVFB/Pq7pAoO+do9/Xdn6orurcO
	pUDIM5vfnTOHcQyEG2UcQlsehdaSAnVFIafvtFweHSRw8yUx5WAS5h2xqeFXe4Zpxqxf
	EOXX+2RB2k0xD62CJWfE4NYbB6NJkfwz2CotLgCq4e93+VY7ljxkpJtZEnSzQZGFD+8v
	Pceg==
X-Gm-Message-State: ALoCoQk/aBeNr/ClJI/pugD31ol6YQ9Sr4H+858CPlAeDfx5edy+DMj5wgEoI10NwQFtidH0ki+b
X-Received: by 10.112.35.14 with SMTP id d14mr5448626lbj.43.1399483159350;
	Wed, 07 May 2014 10:19:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Wed, 7 May 2014 10:18:59 -0700 (PDT)
In-Reply-To: <536A67C3.1010700@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA-5JGOZDYR5ApPs-tROSh+_CnPB1Zxw3H8CaMgJseMtvQ@mail.gmail.com>
	<536A67C3.1010700@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 May 2014 18:18:59 +0100
Message-ID: <CAFEAcA8DPsOhaq5V7FsgGjTF4_B07H03SBakcErFg++xnQ=FEA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.178
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/22] Trivial patches for
	2014-05-05
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 07 May 2014 17:19:34 -0000

On 7 May 2014 18:05, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Interesting.  It looks like I should add C++ compiler to my test environment,
> because I really verified the change and it builds here just fine, but it does
> not detect C++ so does not try to build C++ files.

Yep; we didn't want to require everybody to have a C++ compiler
(especially for cross-compilation that could be tricky), so the A64
disassembler only builds if there's a C++ compiler detected.

thanks
-- PMM

