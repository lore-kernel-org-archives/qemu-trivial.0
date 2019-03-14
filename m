Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4TzI-0004qX-C3
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2019 13:17:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4TzE-0004nV-MM
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 13:17:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4TzC-0003nC-Jx
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 13:17:44 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:42042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4TzC-0003mU-9U
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 13:17:42 -0400
Received: by mail-io1-xd34.google.com with SMTP id c4so5792073ioh.9
	for <qemu-trivial@nongnu.org>; Thu, 14 Mar 2019 10:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h/PJij9K3MmjGih50MAaUbGQbCDVLYASCjZbjz+1L5E=;
	b=MGbAeTmh4KF0KwjXOUZn1WG7b5HP/slJVRcj4kB5BUdphNXKSZva6t+tNMz1wJqZzO
	8E1Awa/MmPbF0kuDP3WA+YNBk3AV1I64goziopTO3bz5Mk7pv68ux1CdJfH99GCnxy9R
	r+NfEjvLHrIVveh4Iou/PkR/1H5wVvKAWWAcMIEGe5h21MSbeV1SB8rQr3FUcFoZfmLR
	y7wsFN8Ens8/a8ror9eQQbgwEaP6INyru7h8dTG33pqhZcgOnZawZtAjV29uCssNcYuM
	lL8T2xMQ63vzXypLT0RbS2T3AQ4qTr0glIaAGVtZyCkhYzjcDlMSsWI0YNg1qx7qOLMp
	pqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h/PJij9K3MmjGih50MAaUbGQbCDVLYASCjZbjz+1L5E=;
	b=bgl1JOBs80ZHuQTml5L7RcnXEUzgRrBXXYRqswFKyGkAI4ov6VaDNHLYn7OHqjm1qo
	q4uesT42W4cxTqpeWA/0gnmQhTKdF6vnJEHcma1ZKbHZo6Bhn0S5DL7UP6D4XHP1XtHo
	GiEQQkHR6LRfX5wFLikVFLTfkzeUNM1CaZpHKGN/Sg4e+ZCPhAzBKfifC5x6muzAKDOy
	HS8D/Irfj/jNtdE9GZod795tUkMytUuqvKQBtostepjXEc49E4Gw3i7TKQnLL+plENa2
	gTDlkNER0j1867LSrw4ThFkuU/de0HsAPpzi1zLZhoFMkuzmDNakD1DT1MrcGnT9gSs9
	PeOw==
X-Gm-Message-State: APjAAAWYnpKutLBurAiFAEBUOvsfJWyczSNJ0CnpWM3WISS8VYj7WWEs
	6EWtjD9C0TiTZzVUcGWj8TstPM9ooaX0Cjb/sYyseg==
X-Google-Smtp-Source: APXvYqwgWPW5LrkwfXRCL9MbIP0vPk5K0xbjfs5hKcDuApWR14EyS4xmWeB52k95oSBopRX4OFh17/d767NxNLLiOh0=
X-Received: by 2002:a6b:7202:: with SMTP id n2mr13905795ioc.82.1552583861162; 
	Thu, 14 Mar 2019 10:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190314150454.15960-1-laurent@vivier.eu>
In-Reply-To: <20190314150454.15960-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 17:17:29 +0000
Message-ID: <CAFEAcA8WNnt+JFy2Gh+aPmuaKOXMOgse0KuToZyrJr5R_vwRiQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d34
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/3] Trivial branch patches
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
X-List-Received-Date: Thu, 14 Mar 2019 17:17:47 -0000

On Thu, 14 Mar 2019 at 15:09, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 9164add701788075f229b560bc3e92f6562ff857:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-gitdm-next-120319-1' into staging (2019-03-14 13:48:48 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to a0af8cee3cf6c2fc08fee5b69820c2f91d5b0b44:
>
>   tests/.gitignore: ignore test-qapi-emit-events.[ch] for in-tree builds (2019-03-14 16:02:13 +0100)
>
> ----------------------------------------------------------------
> .gitignore updates for v4.0
>
> ----------------------------------------------------------------
>
> Eric Blake (1):
>   maint: Ignore built elf2dmp
>
> Stefano Garzarella (2):
>   .gitignore: ignore docs/built created for in-tree builds
>   tests/.gitignore: ignore test-qapi-emit-events.[ch] for in-tree builds
>
>  .gitignore       | 2 ++
>  tests/.gitignore | 1 +
>  2 files changed, 3 insertions(+)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

