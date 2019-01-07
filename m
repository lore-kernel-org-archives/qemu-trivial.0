Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ggV9K-0004vO-Ac
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jan 2019 08:41:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ggV9G-0004uN-Ho
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2019 08:40:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ggV9B-0007l4-Tt
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2019 08:40:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40308)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1ggV8r-0006m6-3Q; Mon, 07 Jan 2019 08:40:33 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D58482D7EC;
	Mon,  7 Jan 2019 13:40:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D85E600C5;
	Mon,  7 Jan 2019 13:40:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 54FA11138648; Mon,  7 Jan 2019 14:40:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org,  Fam Zheng <fam@euphon.net>,  Thomas Huth
	<thuth@redhat.com>,  David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>, Cornelia
	Huck <cohuck@redhat.com>,  Michael Roth <mdroth@linux.vnet.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,  Christian Borntraeger
	<borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, 
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>,  David Gibson
	<david@gibson.dropbear.id.au>
References: <20190104181208.7809-1-philmd@redhat.com>
	<20190104181208.7809-4-philmd@redhat.com>
	<349cd87b-0526-30b8-d9cd-0eee537ab5a4@redhat.com>
Date: Mon, 07 Jan 2019 14:40:01 +0100
In-Reply-To: <349cd87b-0526-30b8-d9cd-0eee537ab5a4@redhat.com> (Eric Blake's
	message of "Fri, 4 Jan 2019 14:17:14 -0600")
Message-ID: <874lakk2mm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 07 Jan 2019 13:40:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 3/3] util/cutils: Move
 function documentations to the header
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
X-List-Received-Date: Mon, 07 Jan 2019 13:40:59 -0000

Eric Blake <eblake@redhat.com> writes:

> On 1/4/19 12:12 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Many functions have documentation before the implementation in
>> cutils.c. Since we expect documentation around the prototype
>> declaration in headers, move the comments in cutils.h.
>>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  include/qemu/cutils.h | 224 ++++++++++++++++++++++++++++++++++++++++++
>>  util/cutils.c         | 185 ----------------------------------
>>  2 files changed, 224 insertions(+), 185 deletions(-)
>
> I find documentation in .c files slightly easier to use (you can then
> read the code right below to see if the documentation is still
> accurate);

This is the kicker for me.  I try to cultivate a healthy suspicion of
comments in general, x10 for comments acting at a distance.

>            but as we had an inconsistent mix, I'm also okay with your
> patch consolidating all the documentation to one of the two files,
> rather than the bad mix of half-and-half.

Concur.

