Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T0UDR-0008Nq-UR
	for mharc-qemu-trivial@gnu.org; Sun, 12 Aug 2012 05:12:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T0UDO-0008Jn-HN
	for qemu-trivial@nongnu.org; Sun, 12 Aug 2012 05:12:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T0UDN-0002lz-4u
	for qemu-trivial@nongnu.org; Sun, 12 Aug 2012 05:12:06 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:35802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T0UDN-0002lq-0W
	for qemu-trivial@nongnu.org; Sun, 12 Aug 2012 05:12:05 -0400
Received: by yhpp34 with SMTP id p34so2402193yhp.4
	for <qemu-trivial@nongnu.org>; Sun, 12 Aug 2012 02:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=AK3VLiMgI+CISw2o2DlvOoZ36sezvpFyJ7TFpQfvRAM=;
	b=aSth8ACVBXdYifbm1ne26XLQJbAdBMJQ9uI1IYNpSHlnlYlRT7KAWZ6kCMZ/2XEH3U
	cBcLtH+bZDPrpUrAoanEevoohf8XfGjAl6RdZgr6r7x6BkMww3UeO3aZxCFQs3UTfSZN
	X8GjEuMpiMHAkQr2f/KwUeMFK5KtrX73a02Rjj4OVa7bCni2282e++mCxjqbPZMA9QmT
	4rY1bRreBVa+G++WaSD5JDjimi8a7K0WHjxzw5pTG0amTpN5xZFd2jExS8OND4JrtTbE
	xRLi3cmX530l1LVJ7R23vhgGMydVGipOs81+yigHhB9qGFg4mYdkh61Xd/KCWtHU43HA
	5umw==
MIME-Version: 1.0
Received: by 10.43.117.129 with SMTP id fm1mr4416010icc.1.1344762724237; Sun,
	12 Aug 2012 02:12:04 -0700 (PDT)
Received: by 10.50.3.9 with HTTP; Sun, 12 Aug 2012 02:12:04 -0700 (PDT)
In-Reply-To: <50273F30.5080905@msgid.tls.msk.ru>
References: <1344720275-26744-1-git-send-email-peter.maydell@linaro.org>
	<50273F30.5080905@msgid.tls.msk.ru>
Date: Sun, 12 Aug 2012 10:12:04 +0100
Message-ID: <CAFEAcA9QkQqBddjAnDXUe_z56pU+D_oPR61COvyO+aV0upzasw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnQxMBb+vnWhaqjty6KOC7O0m/PlzNIcs7h3YLRuUoheBWvsETWXW1SFtEE8eYfPfCuK4jV
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] iov_send_recv(): Handle zero bytes case
	even if OS does not
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
X-List-Received-Date: Sun, 12 Aug 2012 09:12:08 -0000

On 12 August 2012 06:29, Michael Tokarev <mjt@tls.msk.ru> wrote:
> On 12.08.2012 01:24, Peter Maydell wrote:
>> POSIX allows sendmsg() and recvmsg() to fail EMSGSIZE if passed a zero
>> msg.msg_iovlen (in particular the MacOS X implementation will do this).
>
>> Handle the case where iov_send_recv() is passed a zero byte count
>> explicitly, to avoid accidentally depending on the OS to treat zero
>> msg_iovlen as a no-op.
>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> This is what was causing 'make check' to fail on MacOS X.
>> The other option was to declare that a zero bytecount was illegal, I guess.
>
> I don't think sending/receiving zero bytes is a good idea in the
> first place.  Which test were failed on MacOS?  Was it failing at
> test-iov "random I/O"?
>
> I thought I ensured that the test does not call any i/o function
> with zero "count" argument.  Might be I was wrong, and in that
> case THAT place should be fixed instead.
>
> Can you provide a bit more details please?

Sure. It fails in test-iov:
#0  0x000000010000103a in do_send_recv (sockfd=4, iov=0x10060ffb0,
iov_cnt=0, do_send=false) at iov.c:101
#1  0x0000000100001318 in iov_send_recv (sockfd=4, iov=0x10060ffb0,
iov_cnt=3, offset=0, bytes=0, do_send=<value temporarily unavailable,
due to optimizations>) at iov.c:179
#2  0x00000001000025c4 in test_io () at tests/test-iov.c:229

because the test does:

      for (i = 0; i <= sz; ++i) {
           for (j = i; j <= sz; ++j) {
               k = i;
               iov_memset(iov, niov, 0, 0xff, -1);
               do {
                   s = g_test_rand_int_range(0, j - k + 1);
                   r = iov_recv(sv[0], iov, niov, k, s);

so on the first time round the loop i=0 so k=0 and we pass
a zero bytes count to iov_recv.

> The whole thing is actually interesting: this is indeed a system-
> dependent corner case which should be handled in the code to make
> the routine consistent.  But how to fix this is an open question
> I think.  Your approach seems to be best, but we as well may
> print a warning there...

Since sendmsg()/recvmsg() do permit you to send nothing by
having a non-zero length vector whose elements are all zero
bytes long, making the zero length vector a no-op seemed to
be the consistent approach.

-- PMM

