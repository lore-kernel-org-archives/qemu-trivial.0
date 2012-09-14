Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TCYXy-00040Q-3h
	for mharc-qemu-trivial@gnu.org; Fri, 14 Sep 2012 12:15:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TCYXo-0003v4-P5
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 12:15:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TCYXk-0007i0-D9
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 12:15:04 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:59063)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TCYXk-0007hw-5P
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 12:15:00 -0400
Received: by weyz53 with SMTP id z53so2426613wey.4
	for <qemu-trivial@nongnu.org>; Fri, 14 Sep 2012 09:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ndpSNuYiLsAIujs7uivLx/7DBkkb42oQ6p+b0egvdnQ=;
	b=nAwl4YgnMA/KBtPd9wX9zbyja+7PJw73NiADRv8pZGfaJduLwW3tjRBRFw8DY9Wj2D
	eSeLQxnfsGez/VKdNGumnvlwpRI7P6hVrG/GnqkfX7DAXtlIpscU2cPbFWs8ZQF37gZN
	m/sZNPxxNPDRIGET+QyKwnIBEnIogKXJK9fcf4xvDdtyIHMa0bUBoJsqFINRhsXzchUP
	Pjnk/r8X00xsQsRKaQRaTvtKDomIMnSDyG8SLmp70v8fV4csGW3mU6tKTpnu+zEjiPvg
	OdDsa1u7dAtiJ3GbiQu6RIm4MSxIThFYGfbBlk1rBK2AJDwE1eI1N5By41NJhepric9t
	w3Jw==
MIME-Version: 1.0
Received: by 10.216.179.205 with SMTP id h55mr1850371wem.100.1347639299261;
	Fri, 14 Sep 2012 09:14:59 -0700 (PDT)
Received: by 10.227.206.201 with HTTP; Fri, 14 Sep 2012 09:14:59 -0700 (PDT)
In-Reply-To: <CAJSP0QU8yX45dsQTanPHRA3J-xO0yuJ3wHzHKG_CTdLkyWrmzA@mail.gmail.com>
References: <1347453510-32284-1-git-send-email-h.mitake@gmail.com>
	<20120914075328.GC25596@stefanha-thinkpad.localdomain>
	<CAMO-S2hQ6LhmUeiUa1_GSFegWjpwYe4XZOZWQTP8J=_eeCJPdg@mail.gmail.com>
	<CAJSP0QX=9NPEahKCSk2_Yts-eB6pu1BNAaRm6MANtNWczAq2GA@mail.gmail.com>
	<CAMO-S2ixP8nx2cVKiUPPWXrQYBJEhpkO_WoC65un0gwRnQVb9g@mail.gmail.com>
	<CAJSP0QU8yX45dsQTanPHRA3J-xO0yuJ3wHzHKG_CTdLkyWrmzA@mail.gmail.com>
Date: Sat, 15 Sep 2012 01:14:59 +0900
Message-ID: <CAMO-S2h+2x_1H_BGkkdm_c9kjK6+-js9ovgY=46A=3HZGMM+GA@mail.gmail.com>
From: Hitoshi Mitake <h.mitake@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
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
X-List-Received-Date: Fri, 14 Sep 2012 16:15:12 -0000

On Fri, Sep 14, 2012 at 11:31 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Fri, Sep 14, 2012 at 3:28 PM, Hitoshi Mitake <h.mitake@gmail.com> wrote:
>> On Fri, Sep 14, 2012 at 9:40 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>> On Fri, Sep 14, 2012 at 12:25 PM, Hitoshi Mitake <h.mitake@gmail.com> wrote:
>>>> On Fri, Sep 14, 2012 at 4:53 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>>>> On Wed, Sep 12, 2012 at 09:38:30PM +0900, Hitoshi Mitake wrote:
>>>>>> Current qemu initializes curses even if -daemonize option is
>>>>>> passed. This cause problem because shell prompt appears without
>>>>>> calling endwin().
>>>>>>
>>>>>> This patch adds new function, is_daemonized(), to OS dependent
>>>>>> code. With this function, curses_display_init() can check that qemu is
>>>>>> daemonized or not. If daemonized, curses_display_init() returns
>>>>>> immediately.
>>>>>>
>>>>>> Of course, -daemonize && -curses doesn't make sense. Users shouldn't
>>>>>> pass the arguments at the same time. But the problem is very painful
>>>>>> because Ctrl-C cannot be delivered to the terminal. So if this
>>>>>> approach isn't acceptable, -daemonize && -curses combination should be
>>>>>> treated as error.
>>>>>
>>>>> I think it makes sense to explicitly check that -daemonize is used with
>>>>> -nographic | -vnc | -spice.
>>>>
>>>> Yes. But -curses doesn't make sense when it is passed with -daemonize.
>>>>
>>>>>
>>>>> Making curses aware of daemonize seems strange and doesn't stop the same
>>>>> issue with SDL.
>>>>>
>>>>
>>>> What is the same issue with SDL?
>>>
>>> You are right, it's fine to have an SDL display when QEMU is daemonized.
>>>
>>> What bugged me about the patch is that ui/curses.c shouldn't know
>>> about daemonize.  It would be cleaner to check this before
>>> initializing the curses display.  An error could be printed instead of
>>> silently skipping curses initialization.
>>>
>>> Can you move the check to vl.c:main() so it calls is_daemonized() and
>>> exits with an error message?
>>>
>>
>> I agree with moving is_daemonized() to main(). I'll include this change
>> in the next version.
>>
>> But I'm worrying about the way of printing error message and exiting.
>> This may break scripts which execute qemu with -daemonize && -curses.
>>
>> So I like the way of skipping initialization of curses silently.
>> It doesn't change the semantics of command line option of qemu.
>>
>> I'd like to hear your comments.
>
> It's a trade-off.  Silently skipping curses initialization allows
> users with broken command-lines to continue, but it may confuse new
> users who try out this combination (they will not get a clear error
> message explaining what is going on).
>
> I think it's better to be explicit because the risk of breaking
> existing user's setups is low.  If you prefer the other way, that's
> fine by me too.
>

I considered about the combination of -daemonize and -curses, and
concluded that it is odd but not an invalid thing.
So I decided not to treat it as an error.

I'll send the v2 later.

Thanks,
Hitoshi

