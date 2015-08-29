Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZVd31-0004Zt-OV
	for mharc-qemu-trivial@gnu.org; Sat, 29 Aug 2015 06:07:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZVd2z-0004VW-Mw
	for qemu-trivial@nongnu.org; Sat, 29 Aug 2015 06:07:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZVd2w-0007Ec-FJ
	for qemu-trivial@nongnu.org; Sat, 29 Aug 2015 06:07:41 -0400
Received: from mail-vk0-f53.google.com ([209.85.213.53]:34947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZVd2w-0007DC-AR
	for qemu-trivial@nongnu.org; Sat, 29 Aug 2015 06:07:38 -0400
Received: by vkaw128 with SMTP id w128so19581351vka.2
	for <qemu-trivial@nongnu.org>; Sat, 29 Aug 2015 03:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UUnB/bNxIl3rwmRsAqC2/XmPPkXRN4TocqKtt7ctCbQ=;
	b=d2zmtjBzYA8gw+D4jPk8a9Rvv75cNJXQ7uJsMHLUWihpBuqSkw04nDfLhwDovmaiNP
	0U5qIfj0QgpwR9DsThA5xDA+oVwRrngppjih+GWSFzrNNhCezLY5RrKPCn7OtXveHT98
	iIa7t2Lxx6ecNWHBz7Tgz0ZqH4EUAFbKDV5wnnLPn5eukHrm+NecBHqlOn8cfYj8ulTL
	pTPac6svmL9kgymCpoq882Sbmpt/uGS3fw7+NIXLcalAQa2RzIVelnyp/fUrdlm9IRFI
	F4w0LA2U7A4YpFtLIb6eMXJNY6KcS8JtHilmjiOLq4BAlHwpkZyYbsXWbDaO0Laah55K
	20pw==
X-Gm-Message-State: ALoCoQlDChQiYCXfBtBCgK1nJoDBVPpZa/69oYiCwwjdZ6HgAGKgEVGu6oID1rsTcBKrY+pHGVpT
X-Received: by 10.52.9.68 with SMTP id x4mr12901327vda.90.1440842856690; Sat,
	29 Aug 2015 03:07:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Sat, 29 Aug 2015 03:07:17 -0700 (PDT)
In-Reply-To: <1440833392-5555-1-git-send-email-sw@weilnetz.de>
References: <1440833392-5555-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 29 Aug 2015 11:07:17 +0100
Message-ID: <CAFEAcA8dQqYo=ajLCRDyFBkgzXzyu9d3cBbGyQzA6NqAHyT6Bw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.53
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: Fix warnings
 caused by missing 'static' attribute
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
X-List-Received-Date: Sat, 29 Aug 2015 10:07:42 -0000

On 29 August 2015 at 08:29, Stefan Weil <sw@weilnetz.de> wrote:
> Warnings from the Sparse static analysis tool:
>
> linux-user/main.c:40:12: warning:
>  symbol 'filename' was not declared. Should it be static?
> linux-user/main.c:41:12: warning:
>  symbol 'argv0' was not declared. Should it be static?
> linux-user/main.c:42:5: warning:
>  symbol 'gdbstub_port' was not declared. Should it be static?
> linux-user/main.c:43:11: warning:
>  symbol 'envlist' was not declared. Should it be static?
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

