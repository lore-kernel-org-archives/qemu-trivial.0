Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XUyxZ-0007GE-GW
	for mharc-qemu-trivial@gnu.org; Fri, 19 Sep 2014 10:14:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XUyxS-0007Ek-1H
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 10:14:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XUyxL-00080j-PH
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 10:14:45 -0400
Received: from mail-la0-f51.google.com ([209.85.215.51]:62921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XUyxL-0007zo-Hs
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 10:14:39 -0400
Received: by mail-la0-f51.google.com with SMTP id gi9so3182878lab.38
	for <qemu-trivial@nongnu.org>; Fri, 19 Sep 2014 07:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YHpD7yFRr8WcMi1Kw1nHwQ2T5IJSWK87zC3Xg5k1OpU=;
	b=Qk3BvvRM97fURmHUOnhYC61Kfdt9Jsx1Q9MCLADHnDyYPayxbj7Jo35HwdF4/hacv4
	mM7Jyu/lpRwKwdxNHBCeIYpIFyF6up5LI/C5uXUrJcihiooxtu2u7JGSPd7elVLgdj18
	JLDJKog2P6+CyV/Ex02H5M2jiwOSDXz99fB6kd2Mpjc3+6xN7/+8Gy7Px0mc8OHRSrVb
	JtGwO9edlEX0ZiYIRN+Kes6Xk451UhVzoqRGOsz6mVUBFHitf6kh1wCkUUOlh45FTOgL
	gZWNQVmWFLaYJ3n7pdWjOBstcDnItCzUR0vna+cspE2sSdolXx9P5oIS2nUKd7KXpAFX
	QqEg==
X-Gm-Message-State: ALoCoQmdsfhLxWio0Iv3ry6BsOEGfMLLZMxGkZpsiohjUdkkGYeQi0jw+sST9Evyfoa+QTmnPXJZ
X-Received: by 10.152.2.41 with SMTP id 9mr6955790lar.79.1411136073420; Fri,
	19 Sep 2014 07:14:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Fri, 19 Sep 2014 07:14:13 -0700 (PDT)
In-Reply-To: <87wq90drr6.fsf@blackfin.pond.sub.org>
References: <1411097848-3900-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<87wq90drr6.fsf@blackfin.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Sep 2014 07:14:13 -0700
Message-ID: <CAFEAcA-ehcEL0kp2RJ1dthRzy5aDi7Y-4S8QmcEo-965cGfVAg@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.51
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, peter.huangpeng@huawei.com,
	Luonengjun <luonengjun@huawei.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] vl: Fix possible freed
	memory accessing
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
X-List-Received-Date: Fri, 19 Sep 2014 14:14:52 -0000

On 18 September 2014 23:54, Markus Armbruster <armbru@redhat.com> wrote:
> I think we should remove the whole thing: pcmcia_sockets,
> pcmcia_socket_register(), pcmcia_socket_unregister, pcmcia_info().
> Here's why.
>
> It serves just one purpose: "info pcmcia".  HMP-only, therefore not a
> stable interface.  But is it a useful one?
>
> The only caller of pcmcia_socket_register() is pxa2xx_pcmcia_realize(),
> of device model "pxa2xx-pcmcia".  As far as I can tell, used only by a
> couple of ARM boards: "verdex", "mainstone", "akita", "spitz", "borzoi",
> "terrier", "z2", "connex", "tosa".
>
> Of these, only "akita", "spitz", "borzoi", "terrier" and "tosa" insert a
> card into the slot, and they do so right on board initialization.
> Nothing ever ejects a card from a slot.  Therefore, "info pcmcia"
> effectively prints a fixed, machine-specific string so far.  Doesn't
> sound useful to me.
>
> If we acquire PCMCIA devices where querying status is interesting, we'll
> want a QMP command, so this code will be pretty much useless.

I wouldn't particularly object to the info code disappearing. pxa2xx
is pretty old and crufty code at this point and I don't suppose
the pcmcia code has been modernised very much.

(Couldn't you implement a hypothetical pcmcia HMP/QMP command by
scanning the QOM tree for pcmcia device objects now anyway?)

-- PMM

