Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TsGqX-0005sB-BW
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jan 2013 12:50:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TsGqT-0005h3-7z
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 12:50:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TsGqL-00085p-15
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 12:50:45 -0500
Received: from mail-la0-f52.google.com ([209.85.215.52]:42187)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TsGqK-00085b-Qe
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 12:50:36 -0500
Received: by mail-la0-f52.google.com with SMTP id fq12so16295355lab.25
	for <qemu-trivial@nongnu.org>; Mon, 07 Jan 2013 09:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Bse5gpS4O0cTvhQjKBNrbOGfx3EFTq542GwpyML/l8w=;
	b=cw4A0xoiTnrPi876MFIV65OSr8PS7G02H73NOkT7dejfuHjqNg743ByqyDps2Z0973
	KTFrzCEC9yq9d6LIhfh/4O6rCHAxuB+0BSjdSRf7L7IC3oAfIr3ZMucBTIwHfo1xluLL
	ploE17X8eI3ck9bsGThWzo2cWh+fBI1Yvm4743349SGTYfRJQQRRwGWhYEz3HIODXLTH
	DqZaCsu+WXCreaOWBqQVXQyuwNALfIuGZ/QyNMhw5C3uVJtXeCIWGBBBzXC1tjh6nO42
	gbysyjaSvB4weHOSgyRvbZ+iXUme31jQueBOmk9J5J6J6JFQ/xNiTkzzTkOOn2rrwx+a
	uv/w==
Received: by 10.152.113.66 with SMTP id iw2mr57964319lab.37.1357581035030;
	Mon, 07 Jan 2013 09:50:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.55.176 with HTTP; Mon, 7 Jan 2013 09:50:14 -0800 (PST)
In-Reply-To: <50EB0805.604@weilnetz.de>
References: <1357579795-11770-1-git-send-email-peter.maydell@linaro.org>
	<50EB0805.604@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jan 2013 17:50:14 +0000
Message-ID: <CAFEAcA8rwVhbgUbc3VRtgQUWtztkdXyxYfhxJozytdVQyeFY-g@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmINIquXKn7OKH1OOgVg9rArOdXZOv9vWbtBWp+8/gbsODgH87fz0EbVp2cqenBgjRf5aiz
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.52
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga/channel-posix.c:
	Explicitly include string.h
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
X-List-Received-Date: Mon, 07 Jan 2013 17:50:48 -0000

On 7 January 2013 17:38, Stefan Weil <sw@weilnetz.de> wrote:
> Am 07.01.2013 18:29, schrieb Peter Maydell:
>
>> Explicitly include string.h to avoid warnings under MacOS X/clang
>> about implicit declarations of strerror() and strlen().

> Better: include qemu-common.h first and remove all
> three standard includes.

This would be reversing direction from commit 4d4922c33...
I took the commit message in that commit to imply that we
shouldn't be including qemu-common.h for standalone
executables like qga.

-- PMM

