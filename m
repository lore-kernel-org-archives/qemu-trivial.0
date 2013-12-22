Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vuoaj-0000gz-4P
	for mharc-qemu-trivial@gnu.org; Sun, 22 Dec 2013 14:21:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vuoac-0000gc-Kk
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 14:21:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VuoaX-0004Ug-Ot
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 14:21:26 -0500
Received: from mail-pa0-f44.google.com ([209.85.220.44]:37707)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VuoaX-0004UX-ID
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 14:21:21 -0500
Received: by mail-pa0-f44.google.com with SMTP id fa1so4569534pad.31
	for <qemu-trivial@nongnu.org>; Sun, 22 Dec 2013 11:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PK/eIFhDOFqwuLc90vbQSeJfpFSlLN9IA/0iUU2omR0=;
	b=LhacpLvGRcII7lbsiU/114r03w70AOgQc4I5zXB0xWckyifHn1gdZ38Mh24MbmZbvs
	sxXmu9UUa2GoN94KgikKBW2tTR1TldCkicFC7nzLXyKaFNlMvsBrorJby9mtBzVgCXH2
	cTzqx5cxA1D0+c4U+64jPB+usD8pLVcQdUhE4dApoAbcIJBABrmogc2aTTpBBut2qc3d
	rs9YpFF57Qe5UyMaMKFr9Si2KY2tvXLSSetlynKtdfP80iT3c7MxWeYQ9NRV6PFmMSYT
	S9R4kue2fhCUdx5f8hEn0hN4O5YFExTXLHCFjdznn0J49NwSpz8IvqQtIFdnuRT1o6U6
	KaLg==
X-Gm-Message-State: ALoCoQkqGo+cNzu6tgXFgBprh4m9a0XtSjDWwASOgsblAYjf6hdDrblFikaiFarRi7C92QskOal0
X-Received: by 10.67.5.131 with SMTP id cm3mr21704425pad.92.1387740078986;
	Sun, 22 Dec 2013 11:21:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.70.82.227 with HTTP; Sun, 22 Dec 2013 11:20:58 -0800 (PST)
In-Reply-To: <1387738918-10035-1-git-send-email-sw@weilnetz.de>
References: <1387738918-10035-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 22 Dec 2013 19:20:58 +0000
Message-ID: <CAFEAcA-f+WcK_h61iu=OBMbAA63u1FN_SQuXaVq6R9WJ=MwMkQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] mainstone: Fix duplicate array values
	for key 'space'
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
X-List-Received-Date: Sun, 22 Dec 2013 19:21:31 -0000

On 22 December 2013 19:01, Stefan Weil <sw@weilnetz.de> wrote:
>
> v2: Address Peter Maydell's suggestions:
>     * Use first alternative, so there is no change of behaviour

No, I said that the compiler picked the last of the two, (5,3)

>      [0x39] = {5,2}, /* space */
> -    [0x39] = {5,3}, /* space */
> -    [0x1c] = {5,5}, /*  enter */
> +    /*
> +     * There are two matrix positions which map to space,
> +     * but QEMU can only use one of them for the reverse
> +     * mapping, so simply use the first one.
> +     */
> +    /* [0x39] = {5,3}, space */

So this is still wrong.

> +    /*
> +     * Matrix position {5,4} and other keys are missing here.
> +     * TODO: Compare with Linux code and test real hardware.
> +     */
> +    [0x1c] = {5,5}, /* enter (TODO: might be wrong) */
>      [0xc8] = {6,0}, /* up */
>      [0xd0] = {6,1}, /* down */
>      [0xcb] = {6,2}, /* left */

thanks
-- PMM

