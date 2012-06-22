Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Si0Ct-0003JX-Tb
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 05:31:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Si0Cq-00039X-IJ
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:31:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Si0Cl-0001BB-Py
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:31:08 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:34778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Si0CX-000158-KB; Fri, 22 Jun 2012 05:30:49 -0400
Received: by lbok6 with SMTP id k6so3838628lbo.4
	for <multiple recipients>; Fri, 22 Jun 2012 02:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WZYxGhWD5s6163g4r8HcZe1zrV47LrbRelUdVvwr0/g=;
	b=KeFjvlZ+fn5SHB20nobG2WpGuKOhmSE3lL1E8fYBz/hpw6sWoaduec4rutu3/9EVXS
	lKl45cTn7jIH8P3DAEtu00JUL73ljRcrBJuaSe8tPFCD8tKpW6fctutWJfrNUQpTNoZa
	YUu3GG9XAUkHRd9ZObCamv5Xxwqg77oFoir8fRwUwEk7V/nP8ZGEHpT5wkAiAqG3mC3L
	TT7VxfH+wZpmNmPJbVFpNKp40CnECsCb2OQeTx5rhJGKaj2U1/p2dpfsfyBA+8Gm4m3l
	igbUZh7MrkTZq4EsiIFPUhp3EidG6flztU8W8C8e4wCP+JXlwE6nqJEPonC6rfHupoCy
	sfpg==
MIME-Version: 1.0
Received: by 10.152.135.200 with SMTP id pu8mr1458832lab.8.1340357445846; Fri,
	22 Jun 2012 02:30:45 -0700 (PDT)
Received: by 10.112.71.73 with HTTP; Fri, 22 Jun 2012 02:30:45 -0700 (PDT)
In-Reply-To: <CAFEAcA82QdVH0vzQA8+SDJbBTkANLLEFAi1Z6DnK3Sf-=cyG6A@mail.gmail.com>
References: <1340088278-8406-1-git-send-email-peter.crosthwaite@petalogix.com>
	<20120622090331.GB27038@stefanha-thinkpad.localdomain>
	<CAFEAcA82QdVH0vzQA8+SDJbBTkANLLEFAi1Z6DnK3Sf-=cyG6A@mail.gmail.com>
Date: Fri, 22 Jun 2012 10:30:45 +0100
Message-ID: <CAJSP0QUGO2OtKW5v71gP9FGoJUUyKu_ii46frsHKVTP-MvXmOA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
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
X-List-Received-Date: Fri, 22 Jun 2012 09:31:09 -0000

On Fri, Jun 22, 2012 at 10:09 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 22 June 2012 10:03, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> On Tue, Jun 19, 2012 at 04:44:38PM +1000, Peter A. G. Crosthwaite wrote:
>>> From: Jim Meyering <meyering@redhat.com>
>>>
>>> Use sizeof(rxbuf)-size (not sizeof(rxbuf-size)) as the number
>>> of bytes to clear.
>
>> Thanks, applied to the trivial patches tree:
>> https://github.com/stefanha/qemu/commits/trivial-patches
>
> This patch is already in an outstanding arm-devs pullreq (possibly
> due to confusion on my part); it would probably be better not to
> put it in the trivial-patches tree I guess.

Okay, I've dropped it.

Stefan

