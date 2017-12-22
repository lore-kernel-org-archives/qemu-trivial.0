Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eSOAL-0003jz-Hz
	for mharc-qemu-trivial@gnu.org; Fri, 22 Dec 2017 09:19:13 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lists@eitanadler.com>) id 1eSGna-0002ok-3e
	for qemu-trivial@nongnu.org; Fri, 22 Dec 2017 01:27:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lists@eitanadler.com>) id 1eSGnZ-0006s7-1y
	for qemu-trivial@nongnu.org; Fri, 22 Dec 2017 01:27:14 -0500
Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241]:36917)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <lists@eitanadler.com>)
	id 1eSGnY-0006pm-T3
	for qemu-trivial@nongnu.org; Fri, 22 Dec 2017 01:27:12 -0500
Received: by mail-yw0-x241.google.com with SMTP id v190so3779531ywg.4
	for <qemu-trivial@nongnu.org>; Thu, 21 Dec 2017 22:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=eitanadler.com; s=0xdeadbeef;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GUGF9bnsT+5SBQizHG6g/FW6RO+uRXuVSdrBSF5zxtM=;
	b=KYrBXj6C7mBgDx5Ez8dUz1jdrd5I53odFnMc3xL02NdUa9o7opHIEEbuaT6ovgoiBW
	/BjvEMID7eoWQj4rYAHitOlrXN3QYVM1KFP0v10nRD3Cbcc/IGPCBsCBEhVd6JewmjUA
	Wkj7jUR8GwyUm95FZKajTFVOVsFBc7i7qtjRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GUGF9bnsT+5SBQizHG6g/FW6RO+uRXuVSdrBSF5zxtM=;
	b=SK/sy+vXeT7+bPwjqznb0QNtKdPW6UfP+59wgFOXk48pUCRAy4Y9ER+Kkwk3ltGZGX
	2GXZ/fPmZHeQZ2uv+hfIw2FawjkTkXQufgnXw2wO7FYzahXW2d/dKjH+H/Ap8hoZIngp
	pMxhi75wX0koj0wo6fuXMkQNRRej0XYb/OgussEl4LoP+YnI1X/3iitWkGzqRe8H887K
	BnwE0UpLlgZoVNxXFSjjYbm/PDZ4l25nP0Nvp3xKrzkdv41kCeK5NY96D71uQewXhJEy
	vp7BxalHPi43qnFNBxfBMrffDKIsrIIq5GTAeHkmfjRC1lqTfS9whSvt2ZxLA93ABknA
	FMpA==
X-Gm-Message-State: AKGB3mIbTbMEjENa62RzaNvCNzSkXsGzHK7Zq4qq+oAnD/YOhjJ8Ter1
	TvfDxH0abGcbIg3PFEiLcj2p+jikY56RlDLzUP6wEA==
X-Google-Smtp-Source: ACJfBov+KNGppcdRro/X0OLRA7ofVPQJA7CXXPAtg51fTGO1Rql/udUbWDud3Tqq3ggYOYH3I44PO8XXiFDL+yHJTTM=
X-Received: by 10.129.82.212 with SMTP id g203mr9747663ywb.207.1513924031584; 
	Thu, 21 Dec 2017 22:27:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.217.21 with HTTP; Thu, 21 Dec 2017 22:26:41 -0800 (PST)
In-Reply-To: <20171218010209.98713-1-lists@eitanadler.com>
References: <20171218010209.98713-1-lists@eitanadler.com>
From: Eitan Adler <lists@eitanadler.com>
Date: Thu, 21 Dec 2017 22:26:41 -0800
Message-ID: <CAF6rxgnknhn5e26ibO8=n70P6VP3mWzQLMLtigNWv6kz11kUug@mail.gmail.com>
To: qemu-trivial@nongnu.org
Cc: Eitan Adler <lists@eitanadler.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::241
X-Mailman-Approved-At: Fri, 22 Dec 2017 09:19:12 -0500
Subject: Re: [Qemu-trivial] [qemu-web PATCH] Explain how to install QEMU via
 macports
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
X-List-Received-Date: Fri, 22 Dec 2017 06:27:14 -0000

ping?

On 17 December 2017 at 17:02, Eitan Adler <lists@eitanadler.com> wrote:
> Signed-off-by: Eitan Adler <lists@eitanadler.com>
> ---
>  _download/macos.md | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/_download/macos.md b/_download/macos.md
> index dbb312c..e5b9983 100644
> --- a/_download/macos.md
> +++ b/_download/macos.md
> @@ -1,4 +1,8 @@
> -QEMU can be installed from Homebrew:
> +QEMU can be installed via MacPorts or Homebrew:
> +
> +<pre>port install qemu</pre>
> +
> +or
>
>  <pre>brew install qemu</pre>
>
> --
> 2.15.1
>



-- 
Eitan Adler

