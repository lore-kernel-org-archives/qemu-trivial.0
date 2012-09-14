Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TCVCp-0002nL-1I
	for mharc-qemu-trivial@gnu.org; Fri, 14 Sep 2012 08:41:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TCVCl-0002cw-EC
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 08:41:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TCVCf-0005eV-Jk
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 08:41:07 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:42264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TCVCf-0005eN-95
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 08:41:01 -0400
Received: by lbbgm13 with SMTP id gm13so2568620lbb.4
	for <qemu-trivial@nongnu.org>; Fri, 14 Sep 2012 05:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Dj3UH5+148tQKeVc5guoQnEJolA76gJ6ANUVcFcNBx4=;
	b=pi/TXF86nr0tg2zugbvtVMz008kdDwdax/lBTgtSRwDk2HtgiWFJg6AMtcEvZkzLiT
	HyIZkcJfgEbHgF2EKdI7BVmL18OjBuJk/qq48pOd8J3T2CruOoxqeZeuJj4sEx29Gb0j
	qVEJTJbIG7jLYaRIjuca9Vw0aE2zwbJqIaR7L5cabr/NnzMieqe8VxB6+SlcLuvl96bR
	QFEcCowNgQMYwAN8TpEljQ0jexerVRHOQfVqPpuNdtwFt+JR82utbfC5ZSaBrnJqAIa1
	xwc9PpyID4A0ed/eccTRPBizmt2cUgZGz0TwuaWhW+Lu0yWnEh5hIt8B4VRbW5wFMYa8
	IuOA==
MIME-Version: 1.0
Received: by 10.112.83.35 with SMTP id n3mr1012014lby.68.1347626458562; Fri,
	14 Sep 2012 05:40:58 -0700 (PDT)
Received: by 10.112.24.69 with HTTP; Fri, 14 Sep 2012 05:40:58 -0700 (PDT)
In-Reply-To: <CAMO-S2hQ6LhmUeiUa1_GSFegWjpwYe4XZOZWQTP8J=_eeCJPdg@mail.gmail.com>
References: <1347453510-32284-1-git-send-email-h.mitake@gmail.com>
	<20120914075328.GC25596@stefanha-thinkpad.localdomain>
	<CAMO-S2hQ6LhmUeiUa1_GSFegWjpwYe4XZOZWQTP8J=_eeCJPdg@mail.gmail.com>
Date: Fri, 14 Sep 2012 13:40:58 +0100
Message-ID: <CAJSP0QX=9NPEahKCSk2_Yts-eB6pu1BNAaRm6MANtNWczAq2GA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hitoshi Mitake <h.mitake@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
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
X-List-Received-Date: Fri, 14 Sep 2012 12:41:09 -0000

On Fri, Sep 14, 2012 at 12:25 PM, Hitoshi Mitake <h.mitake@gmail.com> wrote:
> On Fri, Sep 14, 2012 at 4:53 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> On Wed, Sep 12, 2012 at 09:38:30PM +0900, Hitoshi Mitake wrote:
>>> Current qemu initializes curses even if -daemonize option is
>>> passed. This cause problem because shell prompt appears without
>>> calling endwin().
>>>
>>> This patch adds new function, is_daemonized(), to OS dependent
>>> code. With this function, curses_display_init() can check that qemu is
>>> daemonized or not. If daemonized, curses_display_init() returns
>>> immediately.
>>>
>>> Of course, -daemonize && -curses doesn't make sense. Users shouldn't
>>> pass the arguments at the same time. But the problem is very painful
>>> because Ctrl-C cannot be delivered to the terminal. So if this
>>> approach isn't acceptable, -daemonize && -curses combination should be
>>> treated as error.
>>
>> I think it makes sense to explicitly check that -daemonize is used with
>> -nographic | -vnc | -spice.
>
> Yes. But -curses doesn't make sense when it is passed with -daemonize.
>
>>
>> Making curses aware of daemonize seems strange and doesn't stop the same
>> issue with SDL.
>>
>
> What is the same issue with SDL?

You are right, it's fine to have an SDL display when QEMU is daemonized.

What bugged me about the patch is that ui/curses.c shouldn't know
about daemonize.  It would be cleaner to check this before
initializing the curses display.  An error could be printed instead of
silently skipping curses initialization.

Can you move the check to vl.c:main() so it calls is_daemonized() and
exits with an error message?

Stefan

