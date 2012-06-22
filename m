Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ShzsL-00030n-U1
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 05:09:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:32857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ShzsJ-00030b-Bo
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:09:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ShzsD-0000ET-BF
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:09:54 -0400
Received: from mail-gh0-f173.google.com ([209.85.160.173]:61554)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ShzsD-0000EC-6i
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:09:49 -0400
Received: by ghrr14 with SMTP id r14so1422827ghr.4
	for <qemu-trivial@nongnu.org>; Fri, 22 Jun 2012 02:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=h7z87BLBzeuLm46wC3KnRg9Ow5CbdpoL4L4ZfTYNtAI=;
	b=nxj7lBpaMwYfbVg7LHUKRAK8lNbW/3u4i6v3ScGmCv4hae8K0DG4QeCTzQHgZVNhuY
	lGv/ufJsQdp1bke6ZWamCMYtKYnMOM8CSFTmkTmwWVV/+phlM7gOxgs3W90fOy49U+Ot
	h7ikmVKtnH18XDL9qkB85zOpKDcmUaLqvErjs0UnYvplakI1bcDbCKSvQBtZVhUR594v
	UwrU2wV2Y3xXWsJSakEkLeb/+AXuzusXnw4owfBNbrJ5rF4TkyU7o4po+yR60XpnUVi1
	4ECTicH/QYOv/qQdWZd+ddsKwHEpvzvMO2gO+KzFPUDMmWF0A6iBvxRhUSz4LlmV5/CV
	ueaQ==
MIME-Version: 1.0
Received: by 10.60.14.68 with SMTP id n4mr1128233oec.24.1340356187203; Fri, 22
	Jun 2012 02:09:47 -0700 (PDT)
Received: by 10.182.179.67 with HTTP; Fri, 22 Jun 2012 02:09:47 -0700 (PDT)
In-Reply-To: <20120622090331.GB27038@stefanha-thinkpad.localdomain>
References: <1340088278-8406-1-git-send-email-peter.crosthwaite@petalogix.com>
	<20120622090331.GB27038@stefanha-thinkpad.localdomain>
Date: Fri, 22 Jun 2012 10:09:47 +0100
Message-ID: <CAFEAcA82QdVH0vzQA8+SDJbBTkANLLEFAi1Z6DnK3Sf-=cyG6A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQk1T6zWrUUqibEx59kmmxzLyrUtdNEtTFmT3fK9GIn+LXvcfQeRHoB6LEmqLv51CF/mziPi
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.173
Cc: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>,
	qemu-trivial@nongnu.org, Jim Meyering <meyering@redhat.com>,
	"Peter A. G. Crosthwaite" <peter.croshtwaite@petalogix.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cadence_gem: Avoid
 stack-writing buffer-overrun
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
X-List-Received-Date: Fri, 22 Jun 2012 09:09:57 -0000

On 22 June 2012 10:03, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Tue, Jun 19, 2012 at 04:44:38PM +1000, Peter A. G. Crosthwaite wrote:
>> From: Jim Meyering <meyering@redhat.com>
>>
>> Use sizeof(rxbuf)-size (not sizeof(rxbuf-size)) as the number
>> of bytes to clear.

> Thanks, applied to the trivial patches tree:
> https://github.com/stefanha/qemu/commits/trivial-patches

This patch is already in an outstanding arm-devs pullreq (possibly
due to confusion on my part); it would probably be better not to
put it in the trivial-patches tree I guess.

thanks and sorry for the confusion
-- PMM

