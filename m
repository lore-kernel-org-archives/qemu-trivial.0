Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4onA-0004kl-41
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2015 06:44:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4on8-0004kV-BJ
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 06:44:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4on7-00055d-67
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 06:44:46 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34760)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4on6-00055R-U5
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 06:44:45 -0500
Received: by vkbs1 with SMTP id s1so63734930vkb.1
	for <qemu-trivial@nongnu.org>; Fri, 04 Dec 2015 03:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=xBLEzg6BrLhSks7kt86nb0ZpHG8XH8C0dVb4lLgU6J4=;
	b=CUtq/KbQgUfCVHITIl+XP16HzkHMrp9G89dagwfuqrJc0e1HQE0vXARJawTysFfZ4A
	KUy5fA4VYdVfoYlm9/igxB8lwVd2yETuP0uQ9okiBcpCLFKCKvhgBneV0g51iN+ODpFn
	f7jAvoEq1XgKVXA1QrRWxOCpjsWNfdjT/kTQ9TMXV+Lvg/gj+x/lRVFbd1smn8QwVgQ5
	vgtPDz28Ue/+gtRwIpsY2Wy+2XtSLuyZdbY6WEMmRuOAQ4rA2VoR0ZUWdncMzh3jFQYG
	CXN4MRgkH9SySz09HqRLfaoynK8yYXRjd6zdyd4DO4ER/AVvk9dY/5G65Pjv2p0nPwJk
	/54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=xBLEzg6BrLhSks7kt86nb0ZpHG8XH8C0dVb4lLgU6J4=;
	b=VtryoCrW0raOpL2WmMw8Byz51paiuEfqyo/8VCJF+WoCEzIuh0J0osNPJcOvUa+Iof
	DUHdX4KXErAL0lyNHaxQopjVcHctGAgsNuvOrcflVC7865TZ0ldZ737rXVk5gZHkggAz
	gvRk9dfzgnpblY4xUYSqAQUdx4sE8KhhtMTbU13FAzhXDR8Hbi28bS+h8F3F2vaA0e7C
	of8GRdrdy7+9Xvxu+acS8eM6tfAw7R4kZ3OkliPmHS+XMNJcZ7B7Xayd2szKJrLqmDKI
	aiiE0JLnZnONkFDf6OSNOWORwE/3fRECO2UVu1Sdmt/s0hHlad1JVqKuNKhc8AdDK6ho
	akCQ==
X-Gm-Message-State: ALoCoQnt3Utc4HU6zTgEwXJ68tmlDSv5Uw2A7PLRdgoslCXWfGakFk/95RYYpk4asSfE5s2czCSR
X-Received: by 10.31.52.211 with SMTP id b202mr9496032vka.82.1449229484541;
	Fri, 04 Dec 2015 03:44:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 4 Dec 2015 03:44:25 -0800 (PST)
In-Reply-To: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
References: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Dec 2015 11:44:25 +0000
Message-ID: <CAFEAcA-3g0ZVK2Sr=EcuG_yx+PZhpJATkvJ=zfA5LNShF=4MAA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL for-2.5 0/9] Trivial patches
	for 2015-12-04
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
X-List-Received-Date: Fri, 04 Dec 2015 11:44:47 -0000

On 4 December 2015 at 06:57, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Hello.
>
> During the freeze period, let me please add my trivial pull request too ;=
)
>
> There are just 9 patches this time, which are either (small) bugfixes,
> or just prettifying one or another part of code to look nicely in the
> release tarball.  Here are all of them:
>
> aniel P. Berrange (1):
>       crypto: avoid two coverity false positive error reports
>         this is a cleanup together with a small tracing bugfix,
>         an easy patch.  An making coverity even more useful is
>         nice too.
>
> Herv=C3=A9 Poussineau (1):
>       scsi: remove scsi_req_free prototype
>         just removing a prototype of a single unused function
>
> John Snow (1):
>       util/id: fully allocate names table
>         a small bugfix avoiding accessing "random" memory
>
> Markus Armbruster (1):
>       typedefs: Put them back into alphabetical order
>         this one sorts include/qemu/typedefs.h in alphabetical order,
>         and removes duplicates while at it.  Actual set of typedefs
>         isn't changed.  We should have good-looking code conforming
>         to our own standards in the released tarball :)
>
> Paolo Bonzini (3):
>       bt: avoid unintended sign extension
>         a simple bt bugfix
>
>       gt64xxx: fix decoding of ISD register
>         this is a small mips platform bugfix
>
>       bt: check struct sizes
>         this one is rather large, but it tries to fix real mess in BT
>         device emulation which we have now
>
> Peter Maydell (1):
>       configure: Diagnose broken linkers directly
>         A simple patch trying to verify whenever linker works too, not
>         only compiler, at configure time before doing more complex
>         tests.
>
> Rodrigo Rebello (1):
>       configure: use appropriate code fragment for -fstack-protector chec=
ks
>         this is an interesting patch in context of the freeze time.
>         In short, current test for -fstack-protector gives false positive=
s
>         (claiming the feature is available) in some configuration, becaus=
e
>         it only verifies whenever compiler accepts this option but not
>         whenever it can compile and link a code which actually uses stack=
.
>
> Please consider applying.
>
> Thanks,
>
> /mjt
>
>
> The following changes since commit 4c65fed8bdf96780735dbdb92a8bd0d6b6526c=
c3:
>
>   ui: vnc: avoid floating point exception (2015-12-03 13:34:50 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-12-04
>
> for you to fetch changes up to 98475746b357f6c048caf9e001998d8a0618b2e4:
>
>   bt: check struct sizes (2015-12-04 09:39:55 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-12-04
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

