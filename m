Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIFZf-0005OQ-E3
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jun 2017 10:35:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dIFZZ-0005JH-15
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 10:35:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dIFZY-0002kb-8n
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 10:35:05 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:34633)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dIFZY-0002kJ-2K
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 10:35:04 -0400
Received: by mail-wr0-x22e.google.com with SMTP id g76so55136510wrd.1
	for <qemu-trivial@nongnu.org>; Tue, 06 Jun 2017 07:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uDxVWlADLcYGp44OWnu06vx9V76qZgIJsM7mC919psY=;
	b=OFcnlYz6tasMV4FHAnbwJmf82xSfd36PSA+IulVeXEimzmntxBRDPy9Ks8Z0nlVFmK
	pcEZhEWWAn7MhL1aEqbwkAQU3rp5aiCxvkX77UMbMFN/g3CjkzBINjDxK13V0GTVtPgn
	FKACcVl8bP0nWmbmz/VMhQrZRY66v7qKjEHCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uDxVWlADLcYGp44OWnu06vx9V76qZgIJsM7mC919psY=;
	b=jaVMqCJEZaODiCaYNWeCyB3qs5EJUGfF8HPAGazBJuGWg8r+DJ/lfhg4BasR7OgPiE
	n+w3ogxv0PuHwrQgmb94R08UjoXw6kaceJmL2oq8x7erWg746nRCiFCm97D4db2sW7kO
	b0/B5+m9bWJ3k3T02anixYAIWXq+R31naELpYbsQIjpotEnKYuJAe3/yaj3QESv8N5S6
	NdZqrEzPIoF8ipxumWntYCFOG53E6IgsBkc/UEETHfjVdDtuB8FVymHwRBAo8bf6mPq+
	hdx1813viZouXU9HQXi0Wqx2QjPRrcKmmudEzsZ5Zd7nN4GzdWuDRWK2lFMOCZ74FDeX
	FT/w==
X-Gm-Message-State: AODbwcAdJ5sqpsUvmqJ92bD+zUN1J3kI7q3wTIFiGZoEKv8X/+6mUlSz
	0gCxecnvrmw149Ko+GlbCTtA5fxCFfRy
X-Received: by 10.223.150.139 with SMTP id u11mr17899457wrb.195.1496759702993; 
	Tue, 06 Jun 2017 07:35:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.55 with HTTP; Tue, 6 Jun 2017 07:34:42 -0700 (PDT)
In-Reply-To: <55dd32a9-7f01-93e3-e22e-3826dcef1d9d@gmx.com>
References: <20170531120049.14111-1-n54@gmx.com>
	<26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>
	<df623a80-4017-2e79-6bf3-7c402f24b275@gmx.com>
	<877f0p38tr.fsf@dusky.pond.sub.org>
	<b60c5d7b-6ae7-4aa0-6263-b96c964b9195@msgid.tls.msk.ru>
	<55dd32a9-7f01-93e3-e22e-3826dcef1d9d@gmx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jun 2017 15:34:42 +0100
Message-ID: <CAFEAcA_2X6QRBS_mbL15Rkq51HxTAX-vb9TJQxKMnwuRsixkiw@mail.gmail.com>
To: Kamil Rytarowski <n54@gmx.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-trivial] [PATCH v3] ivshmem-server: ivshmem-client: Build
 when eventfd() is available
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
X-List-Received-Date: Tue, 06 Jun 2017 14:35:10 -0000

On 6 June 2017 at 14:38, Kamil Rytarowski <n54@gmx.com> wrote:
> I've linked qemu with the original patch and:
> ./configure --disable-linux-user --disable-system --static
>
> I got some warnings, I think they are originated from our libc and are
> not related to qemu:
>   LINK    sparc64-bsd-user/qemu-sparc64
> /usr/lib/libc.a(initfini.o): warning: common of `__ps_strings'
> overridden by definition
> /usr/lib/crt0.o: warning: defined here
> /usr/lib/libc.a(_env.o): warning: multiple common of `environ'
> /usr/lib/crt0.o: warning: previous common is here
> /usr/lib/libc.a(getprogname.o): warning: common of `__progname'
> overridden by definition
> /usr/lib/crt0.o: warning: defined here

Yes, I think I've seen those before on NetBSD -- they look
like a bug in your libc to me, it shouldn't be confusing itself
with itself like that :-)

thanks
-- PMM

