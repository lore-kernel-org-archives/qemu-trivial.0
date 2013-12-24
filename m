Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VvQkG-0004y1-4S
	for mharc-qemu-trivial@gnu.org; Tue, 24 Dec 2013 07:05:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VvQkA-0004wL-IQ
	for qemu-trivial@nongnu.org; Tue, 24 Dec 2013 07:05:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VvQk0-0006QJ-DG
	for qemu-trivial@nongnu.org; Tue, 24 Dec 2013 07:05:50 -0500
Received: from mail-pd0-f172.google.com ([209.85.192.172]:45474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VvQk0-0006Q3-78
	for qemu-trivial@nongnu.org; Tue, 24 Dec 2013 07:05:40 -0500
Received: by mail-pd0-f172.google.com with SMTP id g10so6243179pdj.17
	for <qemu-trivial@nongnu.org>; Tue, 24 Dec 2013 04:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WrRxxbHkPaiC8ROyB10MSNhqAbvkU4wqi8YAaWZNaqE=;
	b=YGuo0J+6AxlMDiIoHUB/rlGIBEJWoHJSmZh7xgI9AO2uyKsi9dqUgFXIddK4svWopx
	Tbh3Is8HDWTba4duQ1A4Ws8XinH5D9G0qGIrJdCdVjty4e/lDzaTdQrC9aGDdWqku0bW
	BebsZVqoEyGNrqaLdBYn5ihp3PtUyhGUf2Xs/aipHuBe/LtTjLoQRppJgyexOy5GLCc8
	Nl00W9sMLdH6TembTeR+cZ3DVIvh7bVc5nFmfddaHxUHaK1+ePClRU7Pyihe4nCkCSAM
	KMwOonDrgpdxTnM7MDNOLiy8ntg0T8e2tRz6WNMhbItt/jY7/ULtMZNdg/bZ96MeguQ0
	h0rQ==
X-Gm-Message-State: ALoCoQl/vugfpgZgtfajKORQX9o92t8wE4lEizpodWWfuAQ4sy42ukkT+kGBe9wioeuwIbB3tzuw
X-Received: by 10.66.102.4 with SMTP id fk4mr31532346pab.59.1387886739417;
	Tue, 24 Dec 2013 04:05:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.70.82.227 with HTTP; Tue, 24 Dec 2013 04:05:18 -0800 (PST)
In-Reply-To: <52B9775A.2080704@weilnetz.de>
References: <1387886052-27067-1-git-send-email-peter.maydell@linaro.org>
	<52B9775A.2080704@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Dec 2013 12:05:18 +0000
Message-ID: <CAFEAcA9xOnQJ-QaZXKHonfOeqAz4fawDUdsg68=o9-JNxZHQJw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/cocoa: Remove stray tabs
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
X-List-Received-Date: Tue, 24 Dec 2013 12:05:55 -0000

On 24 December 2013 12:00, Stefan Weil <sw@weilnetz.de> wrote:
> Am 24.12.2013 12:54, schrieb Peter Maydell:
>> The ui/cocoa.m file has just three lines with hardcoded tabs; fix them.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> I'm generally fairly conservative about "fix indent" patches,
>> but three lines seems sufficiently minimal to be worth just
>> zapping. Happy to drop this if people disagree.
>>
>>  ui/cocoa.m | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>
> CCing qemu-trivial

Oops, what I meant to say in the below-the-line bit was:
This patch sits on top of my other recent cocoa patches.

I'm planning to send it in with a cocoa pullreq, so it doesn't
need to go via trivial.

thanks
-- PMM

