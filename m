Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UeTgI-00070x-RP
	for mharc-qemu-trivial@gnu.org; Mon, 20 May 2013 13:15:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UeTgA-0006ji-Ta
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 13:15:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UeTg5-00067G-Hl
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 13:15:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1UeTfv-00062A-Sa; Mon, 20 May 2013 13:15:08 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4KHF5gr016195
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 20 May 2013 13:15:05 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-19.ams2.redhat.com
	[10.36.112.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r4KHEtBn025657; Mon, 20 May 2013 13:15:02 -0400
Message-ID: <519A5A0B.9050301@redhat.com>
Date: Mon, 20 May 2013 19:14:51 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1369066884-431-1-git-send-email-peter.maydell@linaro.org>
	<519A50EE.8040804@redhat.com>
	<CAFEAcA9sECvGhLgawnOcFWrgpNJqa-Vub_0BmR7vR7Vu=wkQAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9sECvGhLgawnOcFWrgpNJqa-Vub_0BmR7vR7Vu=wkQAQ@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Anthony Liguori <aliguori@us.ibm.com>, patches@linaro.org,
	qemu-trivial@nongnu.org, John Rigby <john.rigby@linaro.org>,
	qemu-devel@nongnu.org, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] qapi-schema.json: Reformat TargetType
	enum to one-per-line
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
X-List-Received-Date: Mon, 20 May 2013 17:15:28 -0000

Il 20/05/2013 18:38, Peter Maydell ha scritto:
>> > I have queued a patch for 1.6 that would change this field to a free
>> > string.  There is no use of this enum, not even for introspection.  You
>> > don't need to know what targets were supported in the version that you
>> > compiled from.  Only one target is supported in this executable anyway.
> That sounds like a better solution. Do you have a pointer to the
> patch? I tried a quick list archive search but probably didn't
> use the right keywords.

No, I haven't quite tested it enough.

I'll send an RFC shortly, as soon as compilation finishes.

Paolo

