Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQcKB-0001eg-0l
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2013 07:39:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UQcK7-0001e2-QP
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:39:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UQcK2-00049l-Cd
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:39:19 -0400
Received: from mail-lb0-f177.google.com ([209.85.217.177]:60784)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UQcK2-00049W-4v
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:39:14 -0400
Received: by mail-lb0-f177.google.com with SMTP id r10so2503216lbi.22
	for <qemu-trivial@nongnu.org>; Fri, 12 Apr 2013 04:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=jcVnJK/d+ap+CnM4GaXVULEpffwp4iUPf0acLEeVV0Y=;
	b=hpmC7hsU9m9QwuZdOuV4fQs/Hr6ssvwtoDEsN6LrK5QNc0zkY9LgWwHCqFWkLG/THF
	qRXHbLm+TzUeJCb1jmcIA1vRY+CBRKpq8rnh0nOkVgAg9aRGRo78X8Vm5P0I9Vtxf8hM
	3GNjzWF5ESKGQCndZlj9qllf+tQGsbyt4Qp4iDPFFIFpLM6PCx0waVcMn3CmeUJ5Dxc8
	3lUfz2zxXzC758Yr9vcfZWtDrdgoSefuNQz1iuoxCqsFRUeYdYfgitCUh+TrpxPAcdZc
	4WFH3+7LnqpFPY5kXXzRHJeCHoQ2l21/feHqM95b1FS+I8gJdDYDMnGfGE3P83XhwOIx
	+sog==
X-Received: by 10.152.110.74 with SMTP id hy10mr5118160lab.37.1365766753046;
	Fri, 12 Apr 2013 04:39:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.198.198 with HTTP; Fri, 12 Apr 2013 04:38:52 -0700 (PDT)
In-Reply-To: <20130412113534.GD9747@stefanha-thinkpad.redhat.com>
References: <1365438972-20259-1-git-send-email-peter.maydell@linaro.org>
	<20130412113534.GD9747@stefanha-thinkpad.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Apr 2013 12:38:52 +0100
Message-ID: <CAFEAcA9GU9XmkQeNN2g4975oOqsuveanNYCpskm_zFJqseNvMg@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmyldONHQ7r1xrkUslpLkNI0uBgXauKWVuVOCxAeftVtlKziYHpnXYmtis4YL4UjSMkf9dZ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.177
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] Typo, spelling and grammatical fixes
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
X-List-Received-Date: Fri, 12 Apr 2013 11:39:22 -0000

On 12 April 2013 12:35, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Mon, Apr 08, 2013 at 05:36:12PM +0100, Peter Maydell wrote:
>> Minor fixes to documentation and code comments, including
>> a set of lets-vs-let's corrections.

> Looks fine but please resend with hw/ reorganization conflicts resolved.

I already did a couple of days ago, v2 is here:
http://patchwork.ozlabs.org/patch/235059/

thanks
-- PMM

