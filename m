Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TCWsq-00029i-MQ
	for mharc-qemu-trivial@gnu.org; Fri, 14 Sep 2012 10:28:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TCWsf-00026k-9i
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 10:28:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TCWsH-0003m0-St
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 10:28:29 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:50422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TCWsH-0003le-5R
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 10:28:05 -0400
Received: by wibhm2 with SMTP id hm2so6103395wib.10
	for <qemu-trivial@nongnu.org>; Fri, 14 Sep 2012 07:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IB4Rnh42kHWxnn/AAFnH/Qa18Ga87s0vyMF0pnCPT8A=;
	b=AiDilkqnH/fnsNgURyY+6QmTPKDkO5krSk/omtk3YV2Srl0B4Qj6oROPzshFCxiKqP
	CSLn3hn0fLWRzjTaYZuHxvFsY76QblA447bLA5byg9si3seplHro5uUNYsah1AdtGNLI
	pHdM/Eby6mNX776ZsR5ucDZu83rW0PCLgBrgEwiQmxPBqCCzKREHxYXzljM5doiync26
	H9TF7arl09x+9pqYMzk1FZDU5WseWXaJSb0y3OTm2XCpMqdwpbF+niBLaDkphOyDuESx
	3kaGOJjNLc09qWBXTK0wpvdSlr5ZrA0qMu5aUGGPAQTaztdZ2TpTZhl3Gsmh4mqea2ZU
	13Cw==
MIME-Version: 1.0
Received: by 10.180.84.164 with SMTP id a4mr6313022wiz.12.1347632884212; Fri,
	14 Sep 2012 07:28:04 -0700 (PDT)
Received: by 10.227.206.201 with HTTP; Fri, 14 Sep 2012 07:28:04 -0700 (PDT)
In-Reply-To: <CAJSP0QX=9NPEahKCSk2_Yts-eB6pu1BNAaRm6MANtNWczAq2GA@mail.gmail.com>
References: <1347453510-32284-1-git-send-email-h.mitake@gmail.com>
	<20120914075328.GC25596@stefanha-thinkpad.localdomain>
	<CAMO-S2hQ6LhmUeiUa1_GSFegWjpwYe4XZOZWQTP8J=_eeCJPdg@mail.gmail.com>
	<CAJSP0QX=9NPEahKCSk2_Yts-eB6pu1BNAaRm6MANtNWczAq2GA@mail.gmail.com>
Date: Fri, 14 Sep 2012 23:28:04 +0900
Message-ID: <CAMO-S2ixP8nx2cVKiUPPWXrQYBJEhpkO_WoC65un0gwRnQVb9g@mail.gmail.com>
From: Hitoshi Mitake <h.mitake@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
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
X-List-Received-Date: Fri, 14 Sep 2012 14:28:38 -0000

On Fri, Sep 14, 2012 at 9:40 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Fri, Sep 14, 2012 at 12:25 PM, Hitoshi Mitake <h.mitake@gmail.com> wrote:
>> On Fri, Sep 14, 2012 at 4:53 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>> On Wed, Sep 12, 2012 at 09:38:30PM +0900, Hitoshi Mitake wrote:
>>>> Current qemu initializes curses even if -daemonize option is
>>>> passed. This cause problem because shell prompt appears without
>>>> calling endwin().
>>>>
>>>> This patch adds new function, is_daemonized(), to OS dependent
>>>> code. With this function, curses_display_init() can check that qemu is
>>>> daemonized or not. If daemonized, curses_display_init() returns
>>>> immediately.
>>>>
>>>> Of course, -daemonize && -curses doesn't make sense. Users shouldn't
>>>> pass the arguments at the same time. But the problem is very painful
>>>> because Ctrl-C cannot be delivered to the terminal. So if this
>>>> approach isn't acceptable, -daemonize && -curses combination should be
>>>> treated as error.
>>>
>>> I think it makes sense to explicitly check that -daemonize is used with
>>> -nographic | -vnc | -spice.
>>
>> Yes. But -curses doesn't make sense when it is passed with -daemonize.
>>
>>>
>>> Making curses aware of daemonize seems strange and doesn't stop the same
>>> issue with SDL.
>>>
>>
>> What is the same issue with SDL?
>
> You are right, it's fine to have an SDL display when QEMU is daemonized.
>
> What bugged me about the patch is that ui/curses.c shouldn't know
> about daemonize.  It would be cleaner to check this before
> initializing the curses display.  An error could be printed instead of
> silently skipping curses initialization.
>
> Can you move the check to vl.c:main() so it calls is_daemonized() and
> exits with an error message?
>

I agree with moving is_daemonized() to main(). I'll include this change
in the next version.

But I'm worrying about the way of printing error message and exiting.
This may break scripts which execute qemu with -daemonize && -curses.

So I like the way of skipping initialization of curses silently.
It doesn't change the semantics of command line option of qemu.

I'd like to hear your comments.

Thanks,
Hitoshi

