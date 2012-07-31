Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwDYM-0002lo-4u
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 10:36:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1SwDYE-0002RZ-MF
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:36:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1SwDYA-0003aX-MA
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:35:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1SwDY3-0003Vk-Kn; Tue, 31 Jul 2012 10:35:47 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6VEZiK1026315
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 31 Jul 2012 10:35:44 -0400
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6VEZheX019274; Tue, 31 Jul 2012 10:35:43 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CD98720057; Tue, 31 Jul 2012 16:35:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
	<87pq7c9fng.fsf@blackfin.pond.sub.org>
	<CAFEAcA_M7RJdCjsxycJUJcOLGe+DdBPSKuagb_=Kspwp-29A2Q@mail.gmail.com>
Date: Tue, 31 Jul 2012 16:35:42 +0200
In-Reply-To: <CAFEAcA_M7RJdCjsxycJUJcOLGe+DdBPSKuagb_=Kspwp-29A2Q@mail.gmail.com>
	(Peter Maydell's message of "Tue, 31 Jul 2012 15:21:59 +0100")
Message-ID: <87k3xk577l.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: patches@linaro.org, qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Avoid explicit
	list of directories in clean target
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
X-List-Received-Date: Tue, 31 Jul 2012 14:36:04 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 31 July 2012 15:19, Markus Armbruster <armbru@redhat.com> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>> +     find . -name '*.[od]' | xargs rm -f
>>> + rm -f *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod
>>> *~ */*~
>>
>> Shit happens if you somehow manage to create a "mean" file name in the
>> build tree.  Sure you don't want to -print0 | xargs -0?
>
> -print0 isn't POSIX, so I wasn't sure it would be present on all
> our platforms. (It's probably fairly safe, though...)

Another option is "-exec rm {} +".

