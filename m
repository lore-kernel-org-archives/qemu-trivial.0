Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uguc2-00078g-9Z
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 06:25:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Uguby-00075e-G3
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:25:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ugubv-00073b-18
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:25:06 -0400
Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233]:52224)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ugubu-00071P-Qy
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:25:02 -0400
Received: by mail-la0-f51.google.com with SMTP id lx15so6215999lab.24
	for <qemu-trivial@nongnu.org>; Mon, 27 May 2013 03:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=kZXGbvero7WKIrRRHCeGaKZ530vo7EiQSSCGNpq4PHA=;
	b=EnACPQ9GVppUCqH8vUAIvRk6fPKESbfrS6sJIGD9ybYKjNdc1nQaB6lWzVSMUUDbSQ
	epyjUDNNkqkc4aQ+OtStYHB0nQP7o0ZPjd96K+JqbmpSBs/6yM6DIx1jyEHemDfHX4Be
	JVQMo8ZG+x0GcOuOh4eUD1jf+8kzQaaduIb4OpQo6kBK2ojDpqyqLb40N6wjrlwmONop
	WGXEZMs89iE0m/985iE0Ce1ucfv7dCtF+7gEQWEEfDyDc14VOECorHgN9A8BMLTANg8v
	csZYiqghuNURPLZ1XolMv681IURrAwP+G5PODpHvaZ7kCSaIpVuSjYT03P/Kan4j4CMu
	popQ==
X-Received: by 10.112.14.36 with SMTP id m4mr13985626lbc.81.1369650301679;
	Mon, 27 May 2013 03:25:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.188.130 with HTTP; Mon, 27 May 2013 03:24:41 -0700 (PDT)
In-Reply-To: <1369635195-28279-1-git-send-email-aik@ozlabs.ru>
References: <1369635195-28279-1-git-send-email-aik@ozlabs.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 May 2013 11:24:41 +0100
Message-ID: <CAFEAcA_qOtFuVPem2mbK7TmM4rac-ZVmdn8HYRnkHPx5iiPSOg@mail.gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnIpnvtpPbdwWj4LUyZeGRYXmgpC6847Da4kMRL9DK4KJJNjgqMUTfe6icJOR1X+n2+jRIj
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::233
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu: fix out of tree cross
	compile
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
X-List-Received-Date: Mon, 27 May 2013 10:25:09 -0000

On 27 May 2013 07:13, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> QEMU uses headers from source directory, however the "asm" symlink was
> created in the build directory what broke KVM stuff compilation.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  configure |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 5ae7e4a..9c3c5e5 100755
> --- a/configure
> +++ b/configure
> @@ -4135,7 +4135,7 @@ if test "$linux" = "yes" ; then
>    esac
>      # For non-KVM architectures we will not have asm headers
>      if [ -e "$source_path/linux-headers/asm-$linux_arch" ]; then
> -      symlink "$source_path/linux-headers/asm-$linux_arch" linux-headers/asm
> +      symlink "$source_path/linux-headers/asm-$linux_arch" $source_path/linux-headers/asm

This is definitely wrong -- the asm symlink must be created
in the build tree, because you could have two build trees
which are building for different architectures and need
different symlink targets. (More generally, an out of tree
build should never create files in the source tree, because
the point of out of tree builds is to leave the source tree
in a pristine state.)

What is the actual bug here? QEMU builds fine for me, because
the build directory is also in the include path via "-I.".

thanks
-- PMM

