Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJMQb-0005MW-Vx
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2011 05:06:57 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJMQZ-0005Hd-R1
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 05:06:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJMQY-0007dj-Vs
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 05:06:55 -0400
Received: from mail-gy0-f173.google.com ([209.85.160.173]:50493)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QJMQX-0007dP-36; Mon, 09 May 2011 05:06:53 -0400
Received: by gyg4 with SMTP id 4so2056154gyg.4
	for <multiple recipients>; Mon, 09 May 2011 02:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=4ptWjFE0qHJv/iLhcVkD+DbSMpg3u30nfKkPbsFwWSQ=;
	b=Iz7DtKw7LLF7kKwUKN+4dRtEyVXKoAxbgjUdN0SnJp8uRlVskBpKABke6BGtOsJbQR
	8gmNylEr72j7179nEVK9EJ+mpSVZ6QEqle4vXS+tuXQJuHoKXm4vXr0/Hx86K0rLtduv
	AU0RYYGxZa5ZDRLo7L+wFlD9+X5ZuRmoEqn34=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=hXkrDoB0X0a2ATUOORTyUBuaeqYYXGCsMzi54w9N5g00h9LRlWam8wOwjakzu5SbpR
	8xDz0+Yn/N4HC+EUYp/YN6H9ULrZyzRnzvh1phey2CLs861BaQQvkslqQ+VRvkAJMXVA
	ads8gxGC+0kTXAE1JLxhFd8OIxH7I66uxDbbw=
MIME-Version: 1.0
Received: by 10.236.181.136 with SMTP id l8mr7740168yhm.117.1304932012370;
	Mon, 09 May 2011 02:06:52 -0700 (PDT)
Received: by 10.147.172.9 with HTTP; Mon, 9 May 2011 02:06:52 -0700 (PDT)
In-Reply-To: <4DC7A8E0.1020500@redhat.com>
References: <1304322846-24376-4-git-send-email-pbonzini@redhat.com>
	<BANLkTikq7uuwZOhdFdJD4a1PkHneD6a=Fg@mail.gmail.com>
	<4DC78F5D.7080505@redhat.com>
	<BANLkTinvh3YJMqJJG9mm27MSYShyBDeZtg@mail.gmail.com>
	<4DC7A8E0.1020500@redhat.com>
Date: Mon, 9 May 2011 10:06:52 +0100
Message-ID: <BANLkTikrHj7SCHids+rvSb2Aw9TNinSNXg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.160.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 4/4] fix compilation when reconfiguring
 without dtrace backend
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
X-List-Received-Date: Mon, 09 May 2011 09:06:56 -0000

On Mon, May 9, 2011 at 9:42 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 05/09/2011 10:34 AM, Stefan Hajnoczi wrote:
>> Is there some smart change detection you are thinking about or just
>> something like keeping the old copy of config-host.h and friends to
>> see if they have changed?
>
> Just that, perhaps for both .h and .mak files. =A0Consider this very patc=
h; it
> is plausible that switching to another tracing backend does not change th=
e
> .h files, right now the backend is only present in .h files to enable the
> monitor/cmdline interfaces.

Hmm...I was wrong when I said that just deleting .d files is enough.
If ./configure is run *and* an arbitrary header file was changed then
stale .o files will be used.  So we also need to delete .o files on
./configure.

Stefan

