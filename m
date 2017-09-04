Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1donkP-0007FW-BD
	for mharc-qemu-trivial@gnu.org; Mon, 04 Sep 2017 05:32:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1donkI-0007CK-H0
	for qemu-trivial@nongnu.org; Mon, 04 Sep 2017 05:32:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1donkD-0007jz-Rv
	for qemu-trivial@nongnu.org; Mon, 04 Sep 2017 05:32:42 -0400
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:34787)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1donkD-0007jg-Jk
	for qemu-trivial@nongnu.org; Mon, 04 Sep 2017 05:32:37 -0400
Received: by mail-wm0-x234.google.com with SMTP id 137so14323817wmj.1
	for <qemu-trivial@nongnu.org>; Mon, 04 Sep 2017 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6f1R0pHz1Gzcf+HWU6nVD5gKJA28M5ARnbtbJb0MkhI=;
	b=Zq8IWex3EPoCZaF7QOvY+Kravmul9vlqoRodHqjm5X2vHjOTjFnTSxc+LqL9NNBbkJ
	A9IbX85+/ysrPtAuYJRp7/a4lfNzjYZPjr6sixHHcXJ9HkgoQoZt0OEmqSRuvVVSLMIa
	PEVx/PJOyIidl6CDhL5X4HVXYJxArOSeFG5I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6f1R0pHz1Gzcf+HWU6nVD5gKJA28M5ARnbtbJb0MkhI=;
	b=XS/SV7OaCOzzOx2WiKuOcO9c4YU0BM9VVTPoeDFWymjXGU6NtXwuFlGM+uaid4rk9+
	/ACprenz52EDV+3OA+j5Nx4G/+mWYBuGJneJOBLtLn4x1ffKQhKOMUs2EnYBanKy+4lu
	HS96GQzM95F5ujD53bpIB7eN9Xeyky7iB2h3zbsgQPpe1MKGD2dSzVTXpOMWSpzuTFX2
	N8qSz7TvmrDXS+uBIWB6w8TMFfIRJnn2bC+IzC3er8NT4a1I27MRVuzrzPw1KSE1e259
	BctTIZIAb+83prvlRZyzrgRGnqgekcDcWhihibDRHmtesrKXe7kaElfnfDMNaebqQyYJ
	8oTw==
X-Gm-Message-State: AHPjjUgygQAPx+0tVv8jZQ8VLJq75U/gyq9jj0s95WxrzaWMSuwHRD4Z
	YKbMswQ2LwdS0ngAr7wei10JXb5Vj+cE
X-Google-Smtp-Source: ADKCNb6WwnJOzRcE3J3lGpCKb6Q3tYelTpu2VuqnNXKKUTF5wRPuCVIoxdHhnR1DE7v/BZ+3YW4vEuDjuScCTC+AmlM=
X-Received: by 10.28.58.199 with SMTP id h190mr3071148wma.82.1504517556313;
	Mon, 04 Sep 2017 02:32:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Mon, 4 Sep 2017 02:32:15 -0700 (PDT)
In-Reply-To: <20170903164952.26760-1-n54@gmx.com>
References: <20170903164952.26760-1-n54@gmx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Sep 2017 10:32:15 +0100
Message-ID: <CAFEAcA-wB8JezCNjyU92U83+75C5NccfBHe1G5q-D67H4CMTKA@mail.gmail.com>
To: Kamil Rytarowski <n54@gmx.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Do not include lutil
 on SunOS
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
X-List-Received-Date: Mon, 04 Sep 2017 09:32:47 -0000

On 3 September 2017 at 17:49, Kamil Rytarowski <n54@gmx.com> wrote:
> This fixes build on SmartOS (Joyent).
>
> Patch cherry-picked from pkgsrc by jperkin (Joyent).
>
> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
> ---
>  tests/Makefile.include | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index f08b7418f0..0e5e6cb9b8 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -810,8 +810,10 @@ tests/migration/initrd-stress.img: tests/migration/stress$(EXESUF)
>         rmdir $(INITRD_WORK_DIR)
>
>  ifeq ($(CONFIG_POSIX),y)
> +ifneq ($(CONFIG_SOLARIS),y)
>  LIBS += -lutil
>  endif
> +endif

I don't object to this patch in principle, but I don't think
this is the best way to fix the underlying problem.

My assumption is that the issue is that Solaris doesn't
have a -lutil (it's helpful to quote the linker or
compiler error message for this kind of patch to clarify
what the failure is that we're trying to fix).

It looks like we use libutil here for openpty, which
is used in the test-char test. But the condition we're
using in tests/Makefile.include isn't the same as the
one we used to decide whether to add -lutil to the
emulator binary link line, which is in configure:

if test "$darwin" != "yes" -a "$mingw32" != "yes" -a "$solaris" != yes -a \
        "$aix" != "yes" -a "$haiku" != "yes" ; then
    libs_softmmu="-lutil $libs_softmmu"
fi

So I think I'd prefer it if we have:
 * a configure test for "is openpty() in libutil"
 * use that to determine whether to add -lutil to
   libs_softmmu and to the libs for tests, rather than
   doing OS-specific tests

Q: does Solaris still not have an openpty() implementation?
Currently we have a local implementation in util/qemu-openpty.c,
but if that workaround is only needed in old Solaris we don't
support any more we could perhaps drop it.

thanks
-- PMM

