Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqwdD-00076T-8m
	for mharc-qemu-trivial@gnu.org; Tue, 05 Feb 2019 04:03:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gqwdC-000760-2b
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 04:03:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gqwdB-0008Ss-6T
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 04:03:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35994)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1gqwd9-0008Ro-BU; Tue, 05 Feb 2019 04:02:59 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C7A6E6A6B;
	Tue,  5 Feb 2019 09:02:58 +0000 (UTC)
Received: from gondolin (dhcp-192-187.str.redhat.com [10.33.192.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 156711F1;
	Tue,  5 Feb 2019 09:02:50 +0000 (UTC)
Date: Tue, 5 Feb 2019 10:02:48 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, peter.maydell@linaro.org
Message-ID: <20190205100248.54f5d1cd.cohuck@redhat.com>
In-Reply-To: <9a93a2a0-f352-1fb6-eb27-49f607cd0b97@redhat.com>
References: <20190204225542.5597-1-eblake@redhat.com>
	<9a93a2a0-f352-1fb6-eb27-49f607cd0b97@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 05 Feb 2019 09:02:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] checkpatch: Flag
 suspicious attribution lines
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
X-List-Received-Date: Tue, 05 Feb 2019 09:03:02 -0000

On Tue, 5 Feb 2019 00:29:14 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 2/4/19 11:55 PM, Eric Blake wrote:
> > Flag commit attribution tags that are unusual (often because they
> > were a typo), but only as a warning (because sometimes a humorous
> > or otherwise useful tag is intentionally supplied).
> >=20
> > This picks the 6-most popular tags, each with 700 or more uses (well,
> > S-o-b was already checked for case-sensitivity and typos, leaving
> > only 5 new tags being checked), as determined by:
> > $ git log | sed -n 's/^ *\([A-Za-z-]*-by:\).*/\1/p' | \
> >   sort | uniq -c | sort -k1,1n | tail
> >=20
> > Most of the rejected lines were obvious typos (among others, we've
> > had 4 cases of someone being burnt, based on Singed-off-by; and 2
> > cases of list-reading via an e-reader, based on eviewed-by; there
> > are also lines forgetting a space after the ':') or otherwise
> > tongue-in-check (3 Approximately-suggested-by). A few lines not
> > whitelisted here may be legitimate, but as they are orders of
> > magnitude rarer, it is therefore not worth worrying about
> > (7 Requested-by, 3 Co-authored-by, 1 Inspired-by, etc.). =20

Hm, wasn't Co-authored-by: actually intended to cover the cases where
someone else did write significant parts of the patch? (I cannot point
to the source without searching, though...)

>=20
> 'Inspired-by' is kinda Zen :) And is from Peter!

I also like that one :)

