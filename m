Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYISX-0004II-MY
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 16:54:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYISU-0004G9-Jr
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 16:54:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYIST-0008LR-Nr
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 16:54:06 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:34675)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dYIST-0008KX-Fv
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 16:54:05 -0400
Received: by mail-wm0-x233.google.com with SMTP id l81so299237wmg.1
	for <qemu-trivial@nongnu.org>; Thu, 20 Jul 2017 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wIzmFrQGtrgeEa+kDRzNfe4Doa6FOleeWCGHGRuvYQU=;
	b=RaMa9iCY/KjiAZPZrNGft4KrFOXoDT7ivI1XzfNNtajWTRl69Fs/3tfVu/hwi3HVHU
	VVrXbX54qRpTsCKRuaRgbztyjywz+LvxxyN4oPivmzcnK9/iSUW5Yuvp/R5gIRaKMRMI
	gGavZlbmipc3LHXzwu/ps9e68hqY38quIs/2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wIzmFrQGtrgeEa+kDRzNfe4Doa6FOleeWCGHGRuvYQU=;
	b=c7P5KSlGNIacjvjt1Rn+ZotZvuxNmWt0/r/S/cdW/+7MekON7+you+vt8xV2WeBxQz
	I6HbyTsXxtG1Y5xGoA1Xx33Qk8ULMQoyN7UJGp9nDg9ZeXECa16tFWY5SZHJgDMb0Tzb
	uSs3TWvTgIf7FI5O2ELmyhKi0baaVJ9D3q8+VL3TRcGspQCHGVhq3BiumzSWaDMCJuNU
	pmFDBa3yzHgs+zU6p3e8M4T09HKpfK5Md52gCgqBgyjhLj1pDCVBrZF+inR5KOVXzG45
	Fh0qAJrHlBgLdLoBqu7lssFk7ftqB7Zhx6Nt4UBKXM/giOslFI2ZMbSQNkQ/EpJ9LUo1
	1+1g==
X-Gm-Message-State: AIVw111SxSP8y1JbD6DLIwkOopb4WKNyiV963tyuezsN/KGzOiyPlKoT
	wIyvFMeeVXTWfOrbSVke2ZAx7hyEV6mB
X-Received: by 10.28.40.215 with SMTP id o206mr3307518wmo.74.1500584044290;
	Thu, 20 Jul 2017 13:54:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 20 Jul 2017 13:53:43 -0700 (PDT)
In-Reply-To: <eec67af4-3f8e-bb85-0854-61f4d450f627@redhat.com>
References: <1500568341-8389-1-git-send-email-peter.maydell@linaro.org>
	<eec67af4-3f8e-bb85-0854-61f4d450f627@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jul 2017 21:53:43 +0100
Message-ID: <CAFEAcA9M0jeER9Ygg74_kQXv4CeW2_PMns7=t=Jw6sxkYhANpA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Kamil Rytarowski <kamil@netbsd.org>,
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10]
 util/oslib-posix.c: Avoid warning on NetBSD
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
X-List-Received-Date: Thu, 20 Jul 2017 20:54:07 -0000

On 20 July 2017 at 19:26, Eric Blake <eblake@redhat.com> wrote:
> On 07/20/2017 11:32 AM, Peter Maydell wrote:
>> On NetBSD the compiler warns:
>> util/oslib-posix.c: In function 'sigaction_invoke':
>> util/oslib-posix.c:589:5: warning: missing braces around initializer [-Wmissing-braces]
>>      siginfo_t si = { 0 };
>>      ^
>
> Uggh. That is a broken compiler.  C99 declares that 'anything = {0}' is
> supposed to be a valid way to zero-initialize anything.

Looks like maybe it was https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119

thanks
-- PMM

