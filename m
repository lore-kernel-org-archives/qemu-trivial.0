Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYvA1-0007Km-Hb
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2015 08:04:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZYv9x-0007DZ-6j
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 08:04:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZYv9w-0001LT-Dl
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 08:04:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZYv9q-0001JJ-Fp; Mon, 07 Sep 2015 08:04:22 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id DFAAF8C1D8;
	Mon,  7 Sep 2015 12:04:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-17.ams2.redhat.com
	[10.36.116.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t87C4GhF003532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 7 Sep 2015 08:04:17 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 90C68303F90E; Mon,  7 Sep 2015 14:04:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1438235203-31311-1-git-send-email-sw@weilnetz.de>
	<55EC14A1.4030600@msgid.tls.msk.ru>
	<87y4givitu.fsf@blackfin.pond.sub.org>
	<55ED5DA7.2050506@msgid.tls.msk.ru>
Date: Mon, 07 Sep 2015 14:04:15 +0200
In-Reply-To: <55ED5DA7.2050506@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Mon, 07 Sep 2015 12:49:27 +0300")
Message-ID: <87lhciigg0.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?w4Frb3MgS292w6Fj?= =?utf-8?B?cw==?= <akoskovacs@gmx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developer <qemu-devel@nongnu.org>, qemu-stable@nongnu.org,
	Ozan =?utf-8?B?w4dhxJ9sYXlhbg==?= <ozancag@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.4] Update language
	files for QEMU 2.4.0
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
X-List-Received-Date: Mon, 07 Sep 2015 12:04:30 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 07.09.2015 09:34, Markus Armbruster wrote:
>> Michael Tokarev <mjt@tls.msk.ru> writes:
>> 
>>> Applied to -trivial-patches, unfortunately not for 2.4 but at least
>>> for 2.5 :)
>> 
>> Should we add "Cc: qemu-stable@nongnu.org" to the commit message?
>
> I don't think it is worth applying to stable.  YMMV ofcourse :)

Perhaps the stable maintainer (cc'ed) has an opinion.

