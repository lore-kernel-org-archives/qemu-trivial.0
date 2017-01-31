Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYdhG-00010q-N2
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2017 14:02:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cYdhE-0000ys-I2
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 14:02:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cYdhD-0006ih-TL
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 14:02:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42978)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cYdh9-0006hD-7z; Tue, 31 Jan 2017 14:02:23 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C8D2C04B302;
	Tue, 31 Jan 2017 19:02:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0VJ2K5F021388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 31 Jan 2017 14:02:22 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 301451138645; Tue, 31 Jan 2017 20:02:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"patches\@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
	<87wpdbw2ki.fsf@dusky.pond.sub.org>
	<CAFEAcA-Ggv2VGszZg0Ld3-1wm=hVe8w=4ZcQ7TDRHf5Puq88ug@mail.gmail.com>
	<20170131181124.GF20303@redhat.com>
	<CAFEAcA_utwK=JxC7aa9chZa2DjuGkBfGAYrEfXVo86pZ5u5-zg@mail.gmail.com>
Date: Tue, 31 Jan 2017 20:02:19 +0100
In-Reply-To: <CAFEAcA_utwK=JxC7aa9chZa2DjuGkBfGAYrEfXVo86pZ5u5-zg@mail.gmail.com>
	(Peter Maydell's message of "Tue, 31 Jan 2017 18:32:38 +0000")
Message-ID: <87bmunnjd0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 31 Jan 2017 19:02:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop QEMU_GNUC_PREREQ()
 checks for gcc older than 4.1
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
X-List-Received-Date: Tue, 31 Jan 2017 19:02:29 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 31 January 2017 at 18:11, Daniel P. Berrange <berrange@redhat.com> wrote:
>> On Tue, Jan 31, 2017 at 06:00:13PM +0000, Peter Maydell wrote:
>>> We have attributes which we wrap in QEMU_ macros already
>>> even though they always expand to the same thing:
>>> QEMU_NORETURN and QEMU_ALIGNED. I'm happy to leave these
>>> to follow that pattern. (If you wanted to send a patch
>>> series that uninlined all of those then I wouldn't hugely
>>> object to it, but I think it touches enough files that it's
>>> a separate thing from removing the #if guards that this
>>> patch does.)
>>
>> The other option is just to replace QEMU_WARN_UNUSED_RESULT with
>>
>>   #define QEMU_WARN_UNUSED_RESULT  G_GNUC_WARN_UNUSED_RESULT
>>
>> and convert code to use G_GNUC_WARN_UNUSED_RESULT directly until we
>> can kill the QEMU specific define. There's no benefit to QEMU having
>> its own defines that duplicate stuff already covered by our min
>> required glib - G_GNUC_WARN_UNUSED_RESULT was added in 2.10 for
>> example.
>
> I wouldn't object to that either, but again it ought to be
> a different patch or patch series to this one...

I wouldn't exactly object, just say that to me, wrapping an attribute in
a GLib-provided macro even though we're not aware of a compiler that
profits from it feels a bit like "look ma, I've read all of the GLib
manual!"

