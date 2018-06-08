Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRF34-00041I-3l
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 06:55:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRF31-0003zC-Ii
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 06:55:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRF30-0000S3-Lx
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 06:55:11 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:38556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fRF30-0000QL-GQ
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 06:55:10 -0400
Received: by mail-oi0-x244.google.com with SMTP id d5-v6so11437421oib.5
	for <qemu-trivial@nongnu.org>; Fri, 08 Jun 2018 03:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UFLkUni9t6zi2wZCpHNWRVoFPNaybg6D3UGDFqJ6FqI=;
	b=QS/VPXrH8zmo9R2zUgLbriy+HROVrrS1s34TVhfb+fAQ9/KBHjoQO4mB1d3a47YJOV
	sxQOxPpy1+9Ej2iVdeUlDXwO/csMdjgzwqsF2RHW2gS0GJimb2opaYcrQ3Z6oMSKoifP
	E79OjVKowYOU13Kk0CuZR6r0RJmYt/4GE2ZGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UFLkUni9t6zi2wZCpHNWRVoFPNaybg6D3UGDFqJ6FqI=;
	b=YRXSNOx4Pykjd5wf0Ga5Q3Jpg+ExEPCPfEbIyhb31qtbIute9mRLFY9Ouwc05dGllI
	1Oxa82WVjoicWoOiPyW1ylz/282eJk6Ty84OOJ+cTTRJ2a11/BfrpwEKzXdm2E8Bb5GU
	YiMwDF1V2dzSrIumVjtrARnqdGUByAXlirlbC8vmIefCuzzcGDglSWvYhzJeivqZ4laP
	+Lkeg4wG0kte7+8BgDWup+FrrQOEayEWt/szUW0HM/C7LbYuO+cqjZKVMi7Bk/FIyhus
	WQNeSswkSYGJtNX1GVXPIeOESLYKGZg+QZg7XnCgXuwm0fikNsDrt6z8i0v6i+PGBxra
	YdOg==
X-Gm-Message-State: APt69E3NvT3R+n3bQYolxoaC2VQaF7YInuT2KXDhcZdruz254rHdFjaE
	OLOrXVpBf2DVOHeQPKhKzUyI/uHuuF9VBxhCBQgW3w==
X-Google-Smtp-Source: ADUXVKJZIg8CbP11y8UKQqlfFbc5hDwRB+ZA/m5kshYahTdqz2GLFKVcajwTAEjHBRkmOVvRrQUfcyYuQAly9krCgNc=
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr3056130oig.102.1528455309604; 
	Fri, 08 Jun 2018 03:55:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 03:54:49 -0700 (PDT)
In-Reply-To: <b4903491-f450-1a54-2a70-a084c30cd8c6@redhat.com>
References: <20180606152128.449-1-f4bug@amsat.org>
	<b4903491-f450-1a54-2a70-a084c30cd8c6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jun 2018 11:54:49 +0100
Message-ID: <CAFEAcA_xP37u4KMdvPe8MyU3y_6re88pAx3KTLY_DOP0qWQzqA@mail.gmail.com>
To: John Snow <jsnow@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Michael Walle <michael@walle.cc>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
	Paul Burton <paul.burton@mips.com>, Yongbok Kim <yongbok.kim@mips.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>,
	Antony Pavlov <antonynpavlov@gmail.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/11] misc: Add trailing
 '\n' to qemu_log() calls
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
X-List-Received-Date: Fri, 08 Jun 2018 10:55:12 -0000

On 6 June 2018 at 20:43, John Snow <jsnow@redhat.com> wrote:
> so error_setg must be used WITHOUT \n and logging must happen with \n?
>
> If we're sure that's the way we want to have things laid out, we really
> ought to augment checkpatch to catch this -- because there's 0% chance
> that we'll keep it straight on our own otherwise.

It's a historical side effect of them being basically separately
designed APIs. error_setg() takes the "give it the entire error
message" approach. logging is printf-style and gives the caller
flexibility to compose more complicated lines of logging with
multiple calls. Consistency between the two might be nice but
there are an awful lot of qemu_log calls in the codebase to check
and change to the other convention...

thanks
-- PMM

