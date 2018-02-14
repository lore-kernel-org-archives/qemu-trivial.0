Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1em1sK-0007Id-Po
	for mharc-qemu-trivial@gnu.org; Wed, 14 Feb 2018 13:33:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1em1sI-0007GK-4g
	for qemu-trivial@nongnu.org; Wed, 14 Feb 2018 13:33:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1em1sH-00011q-AR
	for qemu-trivial@nongnu.org; Wed, 14 Feb 2018 13:33:46 -0500
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f]:36167)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1em1sH-00011h-4Z
	for qemu-trivial@nongnu.org; Wed, 14 Feb 2018 13:33:45 -0500
Received: by mail-oi0-x22f.google.com with SMTP id 24so17229798oij.3
	for <qemu-trivial@nongnu.org>; Wed, 14 Feb 2018 10:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ba4WAjIdk8Olr1YL262aYxK/0MbU0l4YV/jJqjRD47E=;
	b=VlFqplZc05bgbLWZ8EXqbMeLVKKBzXXSGi7winiz2fvTia3wEmnp/yOVLrfu5fpdHw
	o3ko/VaChTxhnndnyEWLK5QAk/ILMxwyJGGF3XH0OAH4jhr7PDX94cXqeRtMQ+DU9fsI
	b6WEMvGR5XAiwpvhkDffegjPp8u6+TuvRXUhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ba4WAjIdk8Olr1YL262aYxK/0MbU0l4YV/jJqjRD47E=;
	b=C9IHAiEn/1x8MSfQEvyK4wy7p5b8LSIH39qRO4SWcJl9z4s92ipAOBPD2FWVwSvAaT
	F0COvQZijRmJIGt1gDlgfskm+Dv9EM8EfV1RBNFRwHxdKiGfw91jmXFBcQe/VYotbG64
	LPyn+5FDY7v1svsl5RRbEMd9PQHvXsnqeNxAC810hPZIc7dopY3ERCkg6/ePly/GgDZg
	t+GtpyWRPQ3Ob0pJN7vs1OMqrvoV2ycey0VSYAaRhD+vc7FCvLPXDl+A36wYDod0t14e
	n+x6+eub6CtJuXkQoOhpt/XNKc1zFfpoqcvGrW3yicE6UFUAHL4m21aF/Mged54J3HPR
	L6/w==
X-Gm-Message-State: APf1xPCMIqracZm1r/RTwAXxzqaBUW938MyBJeFb3gKqxi1ZrTwHcP3r
	yuNmfkWwbJQVdxrGVUdKd+QWrvlNpWx0OZlyMNTATQ==
X-Google-Smtp-Source: AH8x227eujG7C2XMMtsJQZNaYagstpQtBZQEoQEP6XASl86SHTHCzr9kJYOnBuHFmQ9QVZ3zf7VK/+QqJdJGF4VeJvg=
X-Received: by 10.202.179.65 with SMTP id c62mr17291oif.8.1518633224120; Wed,
	14 Feb 2018 10:33:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.18.136 with HTTP; Wed, 14 Feb 2018 10:33:23 -0800 (PST)
In-Reply-To: <1518629505-22480-1-git-send-email-thuth@redhat.com>
References: <1518629505-22480-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Feb 2018 18:33:23 +0000
Message-ID: <CAFEAcA-R0aq7Sp6P2TYrMDE0p0ewwpuXPp6=RzF1bU11FQwJxA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22f
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Add missing
 space when using --with-pkgversion
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
X-List-Received-Date: Wed, 14 Feb 2018 18:33:47 -0000

On 14 February 2018 at 17:31, Thomas Huth <thuth@redhat.com> wrote:
> When running configure with --with-pkgversion=foo there is no
> space anymore between the version number and the parentheses:
>
> $ m68k-softmmu/qemu-system-m68k -version
> QEMU emulator version 2.11.50(foo)
>
> Fix it by moving the space from the configure script to the Makefile.
>
> Fixes: 67a1de0d195a6185c39b436159c9ffc7720bf979
> Buglink: https://bugs.launchpad.net/qemu/+bug/1673373
> Signed-off-by: Thomas Huth <thuth@redhat.com>

I see that in the bug report I wrote
"Also it looks like we return QEMU_PKGVERSION as part of the
QMP qmp_query_version() code, so we should check to see what
the expected behaviour there is regarding having the space
or not."

-- does this patch change the QMP reported string
unexpectedly?

thanks
-- PMM

