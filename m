Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WUbqi-0001On-3l
	for mharc-qemu-trivial@gnu.org; Mon, 31 Mar 2014 09:02:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WUbqY-0001LR-Tk
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:01:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WUbqR-0001QH-Db
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:01:50 -0400
Received: from mail-lb0-f170.google.com ([209.85.217.170]:49215)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WUbqR-0001Q7-7J
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:01:43 -0400
Received: by mail-lb0-f170.google.com with SMTP id s7so5745239lbd.15
	for <qemu-trivial@nongnu.org>; Mon, 31 Mar 2014 06:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=u3oXT18pR8bkdBtxdQMHk00QBUJMuXed1x7ZURZGgBs=;
	b=mefrd8jW+Uhvte2sHZOuSht+xjAEYu/MljMw/BYmpHnAMb318BcqbSDIt7YOtdK5U6
	wFAjaDw23FiQ8W5Pgvn9DEjApR0bxCyRtBPADYge+IUimYAx9Z9jni/SVt8qOtf6VL7D
	8tu7G9plQaajm3o4FRe/b++oQMrBLn9rrejorcG4GAWyky8QehR8v2WpLSeK4YlCzdB1
	U+Mej3vi+6TId58HiTqksLvSLW2AzIUNdkpyRkGDL4bRae/TEoFfyQaS4IzcwInIGyEk
	QV72F+2QALXV2Sf1HOdjNpJwVKOK8wHRtqkP6gZet+eTSp1y7PhJ3/XsCx7Hdpefdyim
	9+kA==
X-Gm-Message-State: ALoCoQkBn0PRammldELN4PpW2kdI2R/T2+EvIul1zSgiqo3HnvPEOnJetFjrxQsp1P16bkncXdP1
X-Received: by 10.112.142.68 with SMTP id ru4mr1007480lbb.49.1396270901925;
	Mon, 31 Mar 2014 06:01:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Mon, 31 Mar 2014 06:01:21 -0700 (PDT)
In-Reply-To: <53396545.805@gmail.com>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Mar 2014 14:01:21 +0100
Message-ID: <CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.170
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: use 'break' instead
	of 'continue' in configure_accelerator()
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
X-List-Received-Date: Mon, 31 Mar 2014 13:01:58 -0000

On 31 March 2014 13:53, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> On 03/31/2014 08:38 PM, Markus Armbruster wrote:
>> Chen Gang <gang.chen.5i5j@gmail.com> writes:
>>
>>> Hello Maintainers:
>>>
>>> If it is necessary to send patch v2 by me, please let me know, I
>>> will/should send.
>>
>> Not a maintainer, but if you send a v2 with an improved commit message,
>> I'll R-by it, which can only help getting it merged.
>>
>
> I guess your meaning is "not quite necessary" (for me, minor useful
> patches almost like spam). So if sending patch v2 is really required,
> please let me know, thanks.

Basically, asking a maintainer to make changes to a patch
as they apply it is asking them to do extra work beyond
what they would normally do. Sometimes people will agree
to do this, but in general it's better just to send a fixed
version of the patch yourself.

(I've cc'd qemu-trivial since that's probably the best tree
to take this patch.)

thanks
-- PMM

