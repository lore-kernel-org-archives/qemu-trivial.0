Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXkCh-0005PU-JZ
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jul 2017 04:19:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dXkCf-0005Nt-3W
	for qemu-trivial@nongnu.org; Wed, 19 Jul 2017 04:19:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dXkCe-0008Hm-8J
	for qemu-trivial@nongnu.org; Wed, 19 Jul 2017 04:19:29 -0400
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:36048)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dXkCe-0008HK-15
	for qemu-trivial@nongnu.org; Wed, 19 Jul 2017 04:19:28 -0400
Received: by mail-wm0-x234.google.com with SMTP id t70so34266546wmt.1
	for <qemu-trivial@nongnu.org>; Wed, 19 Jul 2017 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gExJR68hxC+7cNi6IVFsjrRFnCUTonsuzIibUhh5Nm0=;
	b=YoEsW+Kk0RZRrx5u8dvKF3A+Op2pkzcY840rOPMu6LTTTCESGi1cFMFga+MhPlS/Fp
	mNzfLgO5+EbnScvMQIlq+wrpK1LPeUFj14xMq1yNPNbHw1BG6ZN8xmef802fOF2YHSUD
	81BPgJ551EoZfN9B2J+ArU531TxNtDZmGeVNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gExJR68hxC+7cNi6IVFsjrRFnCUTonsuzIibUhh5Nm0=;
	b=EGzUf3DKfLw5kBqsK0lmnMm5QmGKMM3sywSPpaSzj4lc0SLgvv3EqcG73JJXLKIq3r
	tUUejpBs5qYWmLW/n0U87qQPZryT9JsXt9z+clSlzyV1nRbZYkQoF5F6a1mu9TaTgFHq
	wym2bDVVMj4K01kiK5jb93pjjkcLLd+0fgcGNSyva3M5A7zU/9FAew9lcTOzcl8RANkb
	3+8m46wRBWYdPuqVLnqyAg40dKarhtrnIJ8A/wbjwVk3NRQltxQEwCgbCy2PLzdaRcd4
	/dvz7hWthgdwrVupWYAJ8JPfgOr3F0CCtM4yLngevmE8tqaflf0VHLt3dDSE91mbFA8o
	HoaA==
X-Gm-Message-State: AIVw111rO2N3axIffwJ5+pnLrrQqGrQuZi4Z+i99DT8lHI4uSU4t703k
	IGDQLIXNjgW6irdm+OWRvWuyOw47AP/f
X-Received: by 10.28.129.205 with SMTP id c196mr4653412wmd.120.1500452366967; 
	Wed, 19 Jul 2017 01:19:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Wed, 19 Jul 2017 01:19:06 -0700 (PDT)
In-Reply-To: <b27c6322-49f7-3f73-6df3-e8f4ddae9652@redhat.com>
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
	<1500395194-21455-5-git-send-email-peter.maydell@linaro.org>
	<b27c6322-49f7-3f73-6df3-e8f4ddae9652@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Jul 2017 09:19:06 +0100
Message-ID: <CAFEAcA9vTrpRL-cihQ-DtDj2TYAbNtzLf8b-WTAx+4Mz5xoKiA@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10 4/4]
 bsd-user/main.c: Fix unused variable warning
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jul 2017 08:19:30 -0000

On 18 July 2017 at 23:01, Eric Blake <eblake@redhat.com> wrote:
> On 07/18/2017 11:26 AM, Peter Maydell wrote:
>> On OpenBSD the compiler warns:
>> bsd-user/main.c:622:21: warning: variable 'sig' set but not used [-Wunused-but-set-variable]
>>
>> This is because a lot of the signal delivery code is #if-0'd
>> out as unused. Reshuffle #ifdefs a bit to silence the warning.
>
> Why not just nuke the #if 0 code instead (we can always 'git revert' it
> later as a starting point for someone that wants to implement it).

I went for the minimal change, especially given we know
that the freebsd folks have a big patchset on top of
us fixing a lot of bsd-user code and it didn't seem worth
giving them a more awkward rebase task.

thanks
-- PMM

