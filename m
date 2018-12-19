Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZguL-0008QA-7U
	for mharc-qemu-trivial@gnu.org; Wed, 19 Dec 2018 13:49:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gZguJ-0008Pl-9F
	for qemu-trivial@nongnu.org; Wed, 19 Dec 2018 13:49:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gZguI-0004Z2-Ci
	for qemu-trivial@nongnu.org; Wed, 19 Dec 2018 13:49:23 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33260)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gZguI-0004XT-4p
	for qemu-trivial@nongnu.org; Wed, 19 Dec 2018 13:49:22 -0500
Received: by mail-ot1-x342.google.com with SMTP id i20so20100244otl.0
	for <qemu-trivial@nongnu.org>; Wed, 19 Dec 2018 10:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zNAM2rOGe9JKVjBjrMaID0K+TfeXE9M7NY6j7cgxVuU=;
	b=if1zq3U2utoGtCFKkeB/Rt3CcUdR3gx+BuDiVE62SnmNQMpkR6OR7/+tr51DtowrfH
	CKqCuYRTBfV8R7FqP0gi2pFjr7DPimXZLpWww1YG2pEbnLzMUjwwxwArQl7hAetyErsQ
	m1CHn7NDCmkbF0Wx3czEbeTXOBjc6RGwp0D1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zNAM2rOGe9JKVjBjrMaID0K+TfeXE9M7NY6j7cgxVuU=;
	b=lfUks9qO8EVZlAmhdDvA8tublIYHHLmOiOXZIoWzOwbW3s9Gw5I9Co4Z320Mf1TVzl
	sQPFdkU6V4jpALa7l4GHp99oacLFkBaSgVaCXiq37AGC9kjhQZii8HV7FRcZcGJG9gnt
	j1TX73DwSjjsyKSuE6/7WFF/ndOZ8H0BkB7vjkQe1KbGWHSlqCwCXJicM9HK7uEXwI2N
	s+cvtL74j0PNImhNdvMY9HZIDqhpNmGsY0IZVIvYyEL4kXsKZXumDvkYxCresHNPobBL
	PBDRT6g4Msk4miKr4kjymyzmGlrFQ6gAxNrdDI19Tl2MGlrayTPfK5+q2K6xc4fMLNdA
	kIfg==
X-Gm-Message-State: AA+aEWb2pK/DmVIVAjXuihw/uEGjfD6s9s/q4QU5KjcQ3pWUwpdYoD/M
	wWGeRCsycE7VwnKhRR7jhwiQEtZAJJ0JZnnoocZF1Q==
X-Google-Smtp-Source: AFSGD/WprO+LJprnvZB9TxCejuqNy8hhkc0RU1yV2B97JF5qFZJ7zbl/6cPnG3N59KxGin3f1QQ6/IeC23esLvjz2dU=
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr15321786otq.316.1545245359156; 
	Wed, 19 Dec 2018 10:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20181218142851.9477-1-laurent@vivier.eu>
In-Reply-To: <20181218142851.9477-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Dec 2018 18:49:07 +0000
Message-ID: <CAFEAcA8tO=9xbauigHPy2Tv2JMHntHv+fF+vn+KXJN-HPaeTng@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Collin Walling <walling@linux.ibm.com>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, 
	Cornelia Huck <cohuck@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, 
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x <qemu-s390x@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/4] Trivial patches patches
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
X-List-Received-Date: Wed, 19 Dec 2018 18:49:24 -0000

On Tue, 18 Dec 2018 at 14:53, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit f163448536e5f7ae8905b14547eab37a41a75f6c:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20181216' into staging (2018-12-17 13:04:25 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-patches-pull-request
>
> for you to fetch changes up to b2322003b6389c7c98104c8626ffa342928ba83c:
>
>   error: Remove NULL checks on error_propagate() calls (2018-12-18 14:57:48 +0100)
>
> ----------------------------------------------------------------
> Trivial patches (2018-12-18)
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

