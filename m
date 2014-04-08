Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXTiv-0004y4-AE
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 06:57:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WXTio-0004pH-Jh
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 06:57:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WXTik-00086S-99
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 06:57:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WXTib-00084y-2z; Tue, 08 Apr 2014 06:57:29 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s38AvPv2021742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 8 Apr 2014 06:57:26 -0400
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s38AvN3N028716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 Apr 2014 06:57:25 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7346B200D1; Tue,  8 Apr 2014 12:57:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA941ST_y3k3b5UjTZeKP220WnZE0Bp2Lok4czw58T74_A@mail.gmail.com>
	<5343B8CB.9050700@msgid.tls.msk.ru>
	<CAFEAcA9xr+fyjACcvn7N=dMdMmsm6j++Vosqz1XZmzr125WqoQ@mail.gmail.com>
Date: Tue, 08 Apr 2014 12:57:22 +0200
In-Reply-To: <CAFEAcA9xr+fyjACcvn7N=dMdMmsm6j++Vosqz1XZmzr125WqoQ@mail.gmail.com>
	(Peter Maydell's message of "Tue, 8 Apr 2014 10:41:22 +0100")
Message-ID: <87fvlot7fx.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL for-2.0 00/11] Trivial
	patches for 2014-04-08
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
X-List-Received-Date: Tue, 08 Apr 2014 10:57:47 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 8 April 2014 09:52, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> Well.  At least one of them is entirely safe (hw/ide/ahci.c).
>> Another - xbzrle.c - looks okay, and even maybe fixing a bug.
>> And this int128 thing is okay too, except that the whole thing
>> is questionable as has been mentioned in that thread.
>>
>> I can prepare another pull request without xbzrle and int128 changes,
>> or even without ahci change too, but I'm not sure it is worth the
>> effort - I think everything is okay to go.  I'll take your word for this.
>
> Well, anything that goes in today is going to get at best two
> days of being tested before the release. To me that argues
> fairly strongly for not putting anything in unless it is
> fixing a genuine bug.

Seconded.

