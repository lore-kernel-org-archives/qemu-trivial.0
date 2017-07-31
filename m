Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc9Of-0004V5-MD
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 08:02:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dc9Od-0004Uu-K1
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 08:02:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dc9OZ-0006m3-26
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 08:02:03 -0400
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:33091)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dc9OY-0006ki-Q8
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 08:01:58 -0400
Received: by mail-wr0-x233.google.com with SMTP id v105so148028570wrb.0
	for <qemu-trivial@nongnu.org>; Mon, 31 Jul 2017 05:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4ceor/mEANsXj1NSAR8o/5CuVYwrQuMTRBAHR1A6pu0=;
	b=W3KIw+ZBHY5W37URJ3nw1mquGcCxstsTujkfUjZJ9XIWVUJan9T+sjaJ/TGFAv82tD
	GqfzjzW9eatr/AhKmq27y8r3S1NXkqVZyLprdJXNvIAPPQkHBhJpf6r2vTO+pA4ZuCfN
	mDSqZ40mc+dG75Xj0vFItuHFNKpITG5FlGpzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4ceor/mEANsXj1NSAR8o/5CuVYwrQuMTRBAHR1A6pu0=;
	b=A30NhIjVdz8r9HQGyLxTEImyNbGpsBTjRK9Eb80wW4X7KroyySSTJOmo2BnU3kbAlc
	b9MIBvSvdYLX7YlxRihP9mR8a6MqwHpZtJw4IwwaL7By1JfkSUFKc/tLuT/018kvzIx6
	TmbG81QkjuH4aX2zK8QY0PfKzWdro3HSVl9k/UjpR7VrQDRcVxDjrguG0ABZY95onORD
	VvyATaFMag8kKzMfN5nUv0kt0vz9cpPTJiV82KTez9VsdlM/t243wURFpxh4PPK85UJm
	mMkbHEvB3CSz63BSCAWkRQB5kdme5ISWQ/vfp+OpzheDBeuQoXdW8pab29fxT55NBSHV
	GI4A==
X-Gm-Message-State: AIVw113YkwgFZ98gRc9S6sd9PtCag918/gXT78q5b3T6QA+ZacPT1vFm
	mtPpuysKiTTL38b0r5XGDL2XhKEWUYNB
X-Received: by 10.223.163.16 with SMTP id c16mr13470877wrb.173.1501502517599; 
	Mon, 31 Jul 2017 05:01:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 31 Jul 2017 05:01:37 -0700 (PDT)
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jul 2017 13:01:37 +0100
Message-ID: <CAFEAcA-hS-rnanMg2bbKDDQt1T2S7hZV61Utmh3VdioRcJGAOw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/25 for-2.10] Trivial
 patches for 2017-07-31
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
X-List-Received-Date: Mon, 31 Jul 2017 12:02:04 -0000

On 31 July 2017 at 11:21, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's a collection of trivial stuff merged to date.
> A few minor cleanups, older tests trivial fixes, changing
> crash to clean exit for unicore32 and tricore, and many
> small documentation fixes mostly by Philippe Mathieu-Daud=C3=A9.
>
> Please consider applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 0c26c080ee592ea47597d3ab8fd712d7d2c4ba=
0f:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-2.10-2017073=
1' into staging (2017-07-31 09:59:26 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to 25e11d8774630600ef4c5e9906419a77163a28a1:
>
>   docs: fix broken paths to docs/specs/ivshmem-spec.txt (2017-07-31 13:13=
:01 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2017-07-31
>

Applied, thanks.

-- PMM

