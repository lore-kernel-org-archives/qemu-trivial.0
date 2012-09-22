Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFSQy-0001UZ-PN
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 12:20:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TFSQw-0001T7-5s
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:19:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TFSQv-0007h9-2B
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:19:58 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:63880)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <h.mitake@gmail.com>) id 1TFSQu-0007h1-Re
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 12:19:56 -0400
Received: by wgbdr1 with SMTP id dr1so2786517wgb.10
	for <qemu-trivial@nongnu.org>; Sat, 22 Sep 2012 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=G7k0V+jnWtpn5n+zrJ+2YY5Yu77eRuhadYYIFWiacoA=;
	b=NgzRVug9XSbEd3524DYhlTg7UDBSZp4LTvEJ8nej0Q6xugWN4areSci0LsgTcmxeFm
	XgNC9IGgYZhYjbDWvGBqbzfR8yvFzhbOmiFKWcDxkq84Y6B4ptN0hOU7UUo7RSS0HgDy
	vI8ePoUSGbfZrG24tQtnxF1511N8isNtmE/bY0DGOUe7lErzIraxpRKLBJeiFJrqJ4an
	L4sub5Q/pcbeyfsy6WlKoKb0HOwWxiv/WCeZqBCraebfMF2YLXqdPMyhgTQv6uhJTXIV
	NAemWEknS88HhymaDXRar5l493fYaYYXJ2FBtLobZWO4Ae2NfGFcbOVNH220TAJUxezr
	vJJQ==
MIME-Version: 1.0
Received: by 10.216.240.3 with SMTP id d3mr4866614wer.87.1348330795658; Sat,
	22 Sep 2012 09:19:55 -0700 (PDT)
Received: by 10.227.206.201 with HTTP; Sat, 22 Sep 2012 09:19:55 -0700 (PDT)
In-Reply-To: <20120922160652.GH13216@stefanha-thinkpad.localdomain>
References: <1347639341-4970-1-git-send-email-h.mitake@gmail.com>
	<20120922160652.GH13216@stefanha-thinkpad.localdomain>
Date: Sun, 23 Sep 2012 01:19:55 +0900
Message-ID: <CAMO-S2iSTsdOiVmeWNsPa0L9CEEVYzOb=78f0s4DmqhU5++w4Q@mail.gmail.com>
From: Hitoshi Mitake <h.mitake@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Andrzej Zaborowski <balrog@zabor.org>
Subject: Re: [Qemu-trivial] [PATCH v2] curses: don't initialize curses when
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
X-List-Received-Date: Sat, 22 Sep 2012 16:19:59 -0000

On Sun, Sep 23, 2012 at 1:06 AM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Sat, Sep 15, 2012 at 01:15:41AM +0900, Hitoshi Mitake wrote:
>> Current qemu initializes curses even if -daemonize option is
>> passed. This cause problem because shell prompt appears without
>> calling endwin().
>>
>> This patch adds new function, is_daemonized(), to OS dependent
>> code. With this function, curses_display_init() can check that qemu is
>> daemonized or not. If daemonized, curses_display_init() isn't called
>> and the problem is avoided.
>>
>> Of course, -daemonize && -curses doesn't make sense. Users shouldn't
>> pass the arguments at the same time. But the problem is very painful
>> because Ctrl-C cannot be delivered to the terminal.
>>
>> Cc: Andrzej Zaborowski  <balrog@zabor.org>
>> Cc: Stefan Hajnoczi <stefanha@gmail.com>
>> Cc: Anthony Liguori <aliguori@us.ibm.com>
>> Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
>> Signed-off-by: Hitoshi Mitake <h.mitake@gmail.com>
>> ---
>>
>> v2: is_daemonized() is now called in main(), not in curses_display_init()
>>
>> 8<---
>>  os-posix.c      |    5 +++++
>>  qemu-os-posix.h |    2 ++
>>  qemu-os-win32.h |    5 +++++
>>  vl.c            |    3 ++-
>>  4 files changed, 14 insertions(+), 1 deletions(-)
>
> There has been no further discussion so this patch is ready to go.  I
> have fixed up the coding style issues - please use scripts/checkpatch.pl
> next time (and see ./CODING_STYLE and ./HACKING).

Sorry for my coding style problems and thanks for your fix!

Thanks,
Hitoshi

