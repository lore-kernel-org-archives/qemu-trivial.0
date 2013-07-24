Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V23IJ-0005nL-BQ
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jul 2013 13:56:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V23IG-0005hd-74
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 13:56:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V23IF-00028t-G6
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 13:56:08 -0400
Received: from mail-lb0-f175.google.com ([209.85.217.175]:47452)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V23IF-00028S-0a
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 13:56:07 -0400
Received: by mail-lb0-f175.google.com with SMTP id r10so739470lbi.34
	for <qemu-trivial@nongnu.org>; Wed, 24 Jul 2013 10:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=aAYu0ZNTDmF/xFEPuzSttrfArUF5JOb+yoUr5+hSdLc=;
	b=gVEm4sUXjo64lo6pzMJnD8azx8hcY++oWkQ+IRBBbAueQpvvaZXbnMjnHq+h4vOcje
	vfRGSLtgAwKXPccoH8ElvtNRTGPDGWc1HCiFJJBaPQ/tuC1fKaHSMhR6KIz2iej8Z22a
	Tm3BYI0eQYLY1gUe/h1HRsN3sQNg4c7pfbB5YsdcZd7XOsiH+VL+g27yNOObuwdEROhv
	KqHflbfhqINihUv5ZaPm640KdTYcGfa5Ey4WcQn2reTOammoQzGwrAY8XbL6S/KHWtY6
	vYX4VBvOVCAF/TZokbxp++UVL+0xHnkZWPewo5EXmiCJXVw0SXnjBYltcOScKiPbUx3U
	PdOg==
X-Received: by 10.152.4.163 with SMTP id l3mr17435505lal.60.1374688565861;
	Wed, 24 Jul 2013 10:56:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.13.2 with HTTP; Wed, 24 Jul 2013 10:55:45 -0700 (PDT)
In-Reply-To: <1374688136-7733-1-git-send-email-sw@weilnetz.de>
References: <1374688136-7733-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Jul 2013 18:55:45 +0100
Message-ID: <CAFEAcA-LzZKuSVce0jgK64JUrXk7stkrBzpxyA_Gp4CcsQ+L2g@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnrV8+47N4HQIYHl3++slVqYeuzAGVonc+BJMnTWSO6SAzpYFA7ed21BxE1GBSV7+M+w8rZ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.175
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: Fix new typos in
	comments and strings
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
X-List-Received-Date: Wed, 24 Jul 2013 17:56:09 -0000

On 24 July 2013 18:48, Stefan Weil <sw@weilnetz.de> wrote:
> All these typos were found by codespell.
>
> sould -> should
> emperical -> empirical
> intialization -> initialization
> successfuly -> successfully
> gaurantee -> guarantee
>
> Fix also another error (before before) in the same context.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

