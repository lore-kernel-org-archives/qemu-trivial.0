Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TCU1t-0003AU-Uq
	for mharc-qemu-trivial@gnu.org; Fri, 14 Sep 2012 07:25:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TCU1g-00034X-VF
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 07:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TCU1b-0003qj-1o
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 07:25:36 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:64401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TCU1a-0003qa-PL
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 07:25:30 -0400
Received: by wibhm2 with SMTP id hm2so3516506wib.10
	for <qemu-trivial@nongnu.org>; Fri, 14 Sep 2012 04:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gkVthdSCFFVDIkAGZUEekwMBuFilBLYfX0QulJJir20=;
	b=b07QTUtsM+QbLzaxFnJedqK+5iRryflAoe8GtSvw7RBM6zJr9bUkc+oSI8Ms1Vzq2J
	jKW6v0d2dyWDLtEToL1oC64cfQYaB/VqGBPCy659OTTZydMozOc6c1q62429pPc9BECm
	JZ7PV7x4egIUd1r54s/i3wE0N7rtTAbyLdukQohD59LnKBgbiCOAFxzHLYNMAJqfxKxW
	t+ZBZQJha4YmdBq50qI5QAV2GLzxPmyrLl6jMCxV1YZIO+eFaM+86uRycbZb09IElMcP
	xTOzhRid544brOLdmv5Tfj8wrZwwiIW6CxkcJ43OzB6v4f6VpZFZveNJl+fh3JOcvz3b
	vEdg==
MIME-Version: 1.0
Received: by 10.180.97.135 with SMTP id ea7mr47487760wib.11.1347621927137;
	Fri, 14 Sep 2012 04:25:27 -0700 (PDT)
Received: by 10.227.206.201 with HTTP; Fri, 14 Sep 2012 04:25:27 -0700 (PDT)
In-Reply-To: <20120914075328.GC25596@stefanha-thinkpad.localdomain>
References: <1347453510-32284-1-git-send-email-h.mitake@gmail.com>
	<20120914075328.GC25596@stefanha-thinkpad.localdomain>
Date: Fri, 14 Sep 2012 20:25:27 +0900
Message-ID: <CAMO-S2hQ6LhmUeiUa1_GSFegWjpwYe4XZOZWQTP8J=_eeCJPdg@mail.gmail.com>
From: Hitoshi Mitake <h.mitake@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Andrzej Zaborowski <balrog@zabor.org>
Subject: Re: [Qemu-trivial] [PATCH] curses: don't initialize curses when
	qemu is daemonized
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
X-List-Received-Date: Fri, 14 Sep 2012 11:25:48 -0000

On Fri, Sep 14, 2012 at 4:53 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Wed, Sep 12, 2012 at 09:38:30PM +0900, Hitoshi Mitake wrote:
>> Current qemu initializes curses even if -daemonize option is
>> passed. This cause problem because shell prompt appears without
>> calling endwin().
>>
>> This patch adds new function, is_daemonized(), to OS dependent
>> code. With this function, curses_display_init() can check that qemu is
>> daemonized or not. If daemonized, curses_display_init() returns
>> immediately.
>>
>> Of course, -daemonize && -curses doesn't make sense. Users shouldn't
>> pass the arguments at the same time. But the problem is very painful
>> because Ctrl-C cannot be delivered to the terminal. So if this
>> approach isn't acceptable, -daemonize && -curses combination should be
>> treated as error.
>
> I think it makes sense to explicitly check that -daemonize is used with
> -nographic | -vnc | -spice.

Yes. But -curses doesn't make sense when it is passed with -daemonize.

>
> Making curses aware of daemonize seems strange and doesn't stop the same
> issue with SDL.
>

What is the same issue with SDL?

Thanks,
Hitoshi

