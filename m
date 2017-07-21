Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYVA8-0001VZ-0V
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 06:28:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYVA6-0001UJ-2E
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 06:27:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dYVA5-0003nV-B7
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 06:27:58 -0400
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:37005)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dYVA5-0003mM-4D
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 06:27:57 -0400
Received: by mail-wr0-x232.google.com with SMTP id 33so24153628wrz.4
	for <qemu-trivial@nongnu.org>; Fri, 21 Jul 2017 03:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fmt3O19XWbT4+kARRr0yP5uMsnaZS2FvD4zkEBYxdOY=;
	b=gFVh0558Fi/qW6t6A+fN/K42opHLoVwgKBK+tMp3iwafR+/U5NgIf+Mnw7c9PLxzAV
	/+WS9IMCkijxPgIG9mRmH9l0OWRqnLlwzp/xnbMo+xituq4zUxE6yhMog8mvGqAFjiwo
	EPrRMRck1y53Kbvea9ImCd6ATCk1CsxfDbmLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fmt3O19XWbT4+kARRr0yP5uMsnaZS2FvD4zkEBYxdOY=;
	b=Tg1yY6xYS2y+nbOYdLArjN6WMqgjOTTsHSz3daQaHCBnitL1C2Bx3lm3whZngURzPY
	0WP8N81OhvtZ15l6wroMp2PDjAxgYilCKlkNtKp1a4pW52XgWpBpbpm/0kzW9K9DIJYR
	HqPua0Vkg0HgKTac23Dq7og9d1YwBGTSs9XkmVgQNBYKbi4SyX9EpgmCkoy1w01melBB
	6JGrDEwKmFpyM0Plmcm/O1irjLALst7EEzp7AdibULiGCK9a1AlkQmpkchMGgpL7oSSP
	V3nV0CQYo1i3d0Er3//iPwuJPfqk6XH7fqkUq3hMUcuk/reMzK6A2hVMO0Gn8b32XPvs
	sY0Q==
X-Gm-Message-State: AIVw110xf940lFK1zCPQzzsR0f56hL7uL4dfYwRESFWEInr1NguyS3CI
	uBkk2BrKe1ci5J0dJKUAsVIa96BHFsLo
X-Received: by 10.223.163.16 with SMTP id c16mr10165035wrb.173.1500632876112; 
	Fri, 21 Jul 2017 03:27:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 21 Jul 2017 03:27:35 -0700 (PDT)
In-Reply-To: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jul 2017 11:27:35 +0100
Message-ID: <CAFEAcA_uaB3kJcqDNR9Gg=BS1Ae0iBTs3t3S524ikKkPfx59ZA@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: "patches@linaro.org" <patches@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10 0/4] bsd-user:
 silence warnings on OpenBSD
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
X-List-Received-Date: Fri, 21 Jul 2017 10:27:59 -0000

On 18 July 2017 at 17:26, Peter Maydell <peter.maydell@linaro.org> wrote:
> I've just managed to get an OpenBSD VM into my test set for processing
> pull requests. There are a handful of minor compiler warnings in
> bsd-user, which this patchset fixes, just to reduce the noise
> in my logs.
>
> thanks
> -- PMM
>
> Peter Maydell (4):
>   bsd-user/mmap.c: Move __thread attribute to right place
>   bsd-user/elfload.c: Fix set-but-not-used warnings
>   bsd-user/bsdload.c: Remove write-only id_change variable
>   bsd-user/main.c: Fix unused variable warning

I've applied patches 1 and 2 to master; patch 3 still awaiting
review and 4 review/reply to my response-to-review...

thanks
-- PMM

