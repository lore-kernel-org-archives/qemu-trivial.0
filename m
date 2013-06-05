Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UkLA7-00083v-Hi
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2013 17:22:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UkLA4-00082D-Gf
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 17:22:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UkLA3-0000jA-2X
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 17:22:28 -0400
Received: from mail-lb0-f177.google.com ([209.85.217.177]:38325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UkLA2-0000iy-PT
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 17:22:26 -0400
Received: by mail-lb0-f177.google.com with SMTP id 10so1986594lbf.36
	for <qemu-trivial@nongnu.org>; Wed, 05 Jun 2013 14:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=sKCukSyTOS18vyl0hPuf7vzjO1+zCEz/aLYTJ2fSR8s=;
	b=ZG3m5txeOjYGHRs26aJvWHm+CrKtvJGVsg7P/sYD9l4Oh9wi0+6Rw0etzMkiRo7Qzp
	jPpcVbuzjw21w7YHm4KiRQsBwT0h343hqk6R8NrWo1nhCCaErKyaDYwd8KVz5jDLtt4z
	DQS4PiBJyAILo6fS3aMSNKU/+jCvDVq5skXIY/i0vzODKbey62b8kP4FR4inyrz0FVW8
	FHRQeF2BbEiiQDCPiAeNqvU/Y/amdSeuVh/sAzRU4DtQu2Oe9AZIxPsjvJbd8+eIyL/M
	ecalWeXJ/rkf6cHEOLz+Y2o8LQ4U5S8+ba0mIEpY21xeoSfsKnMtX/Wf8v7OiPWUJ/Ne
	D8uQ==
X-Received: by 10.112.60.233 with SMTP id k9mr15839008lbr.61.1370467345465;
	Wed, 05 Jun 2013 14:22:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.2.39 with HTTP; Wed, 5 Jun 2013 14:22:05 -0700 (PDT)
In-Reply-To: <1370467013-9270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1370467013-9270-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Jun 2013 22:22:05 +0100
Message-ID: <CAFEAcA9cb2k_=c10cV5C3zi-kbhrNwahEtZF4L08GO8N=ub=cA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlQX6i6iy3GGD8Fwd69tA87aR48tbXhLzjpvt3bPvDADBERzvps38Wz7uZQdW7I+mp1dSaC
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.177
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	liguang <lig.fnst@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] gitignore: unignore
	*.patch
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
X-List-Received-Date: Wed, 05 Jun 2013 21:22:30 -0000

On 5 June 2013 22:16, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This partially reverts:
>
>  commit 082369e62c5bbaba89f173c2b803bc24115bb111
>  Author: liguang <lig.fnst@cn.fujitsu.com>
>  Date:   Fri Mar 22 16:44:13 2013 +0800
>
>     gitignore: ignore more files
>
> I'm not sure how this went in.  The thing is that
> ignoring *.patch, in my opinion, is just wrong.
> Especially for downstreams who apply patches for
> real.

Personally I think a lot of the random rubbish in
our .gitignore is bogus and should be removed.
Basically anything that's an editor dropping or
.patch or TAGS file or similar is a local workflow
thing and should be dealt with by setting up a global
ignorefile in your local git config. The only
things in the .gitignore in the public repo should
be files which QEMU's build process itself creates.

But I know not everybody agrees with this, which is
why all this stuff is in the .gitignore :-)

thanks
-- PMM

