Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvR2n-0005aR-NL
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:43:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvR2k-0005YF-KQ
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvR2j-00063R-99
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:43:10 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:53591)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dvR2i-00061H-Nd
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:43:08 -0400
Received: by mail-wr0-x229.google.com with SMTP id l22so1360001wrc.10
	for <qemu-trivial@nongnu.org>; Fri, 22 Sep 2017 09:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cg1d4gDZLlR9ykMVoV6VMrvCkDiXy/2oMy1ocG6+CJs=;
	b=e5AEW0lTt4B2ckT29fxCisz4aKLSvCGKztLx4ga5moj+JHCDm1geyO+ZEPXVpf0/KO
	X34qsz5P9GgNXJMuoU9aGsYJdJQ4cbcj4QelYNa3BssbLNDMPlwCBh1xxwG5e2eWG7Yq
	c3jFTSabLUc+1BE1vyqTVCGUW8DKXy2C/Zlmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cg1d4gDZLlR9ykMVoV6VMrvCkDiXy/2oMy1ocG6+CJs=;
	b=oew9Kefz0S6UJA4vXTjxcIOTV6kU/5jEImZHw3skaaT1y0O0l3FrEDOYRo5Gb3Zwmd
	Fw+KtgKJ/6FbKsLtwO3mpSv8YF8CPItcdx7FU33/2UEcWXQWIHHXM/puAPfQaZHQmk2Q
	IRbYTA5/3yXjSTlRr7imqxqNgwEYL5oBF9VKDHJ0lE6BBQ26XXLaaBA3YfRD52Jvn0R9
	mlLLxETcEACbVjp/S4j4QzjvmwnucoeKWWESfaoAs5Yn29KnDbMzJHsy2HpzK9wsxrL4
	ZCKHM73gYO1oAv1eq42ieAD1hVa0MNkdq/2eq3CE8tdOhm0kg9D63qsVrR9bxRh0k0wt
	9p/A==
X-Gm-Message-State: AHPjjUgn9PxrGDFd/HHw0yRiz8Rs+amxBgwoKzgfn+iM5AzxPH7Ytg8C
	ukpMvqnF1qoSzzbLG4juFme5a7O9/ZkGKBLmvc2LmA==
X-Google-Smtp-Source: AOwi7QAKv1tEaF/IObJmBevuXiPD6dFi373mxdV9MUdvbu746IQlvaG81gzWCOOozYBWIK7y5lADSc9OSRzA89GBa+M=
X-Received: by 10.223.175.100 with SMTP id z91mr5848336wrc.177.1506098587578; 
	Fri, 22 Sep 2017 09:43:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 22 Sep 2017 09:42:46 -0700 (PDT)
In-Reply-To: <20170922154014.29350-8-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-8-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Sep 2017 17:42:46 +0100
Message-ID: <CAFEAcA-uWrGNn=8--NEFXFeJe613CZv04a9Jo5eNrvM-3J87eQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
	Yu Ning <yu.ning@linux.intel.com>, 
	Vincent Palatin <vpalatin@chromium.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-trivial] [PATCH 07/34] i386/hax: remove duplicated
 includes
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
X-List-Received-Date: Fri, 22 Sep 2017 16:43:12 -0000

On 22 September 2017 at 16:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> applied using ./scripts/clean-includes
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/sysemu/hax.h      | 1 -
>  target/i386/hax-darwin.h  | 3 ---
>  target/i386/hax-windows.h | 2 --
>  target/i386/hax-darwin.c  | 8 ++------
>  4 files changed, 2 insertions(+), 12 deletions(-)

I suspect the includes in hax-windows.h could be trimmed a bit
more (since we're guaranteed that if CONFIG_WIN32 then we've
included sysemu/os-win32.h), but this is fine as it stands.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

