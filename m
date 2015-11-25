Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a1WaF-0005uY-Uz
	for mharc-qemu-trivial@gnu.org; Wed, 25 Nov 2015 04:41:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1a1WaD-0005re-Pw
	for qemu-trivial@nongnu.org; Wed, 25 Nov 2015 04:41:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1a1WaC-0007Qq-RH
	for qemu-trivial@nongnu.org; Wed, 25 Nov 2015 04:41:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41859)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1a1Wa6-0007Pt-NC; Wed, 25 Nov 2015 04:41:42 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 50FC0684;
	Wed, 25 Nov 2015 09:41:42 +0000 (UTC)
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id tAP9feZJ011049; Wed, 25 Nov 2015 04:41:40 -0500
Date: Wed, 25 Nov 2015 10:41:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20151125094140.GC5957@noname.str.redhat.com>
References: <1448407631-9405-1-git-send-email-jsnow@redhat.com>
	<871tbeijay.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871tbeijay.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jcody@redhat.com, John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [trivial for-2.6] util/id: fully
 allocate names table
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
X-List-Received-Date: Wed, 25 Nov 2015 09:41:50 -0000

Am 25.11.2015 um 09:18 hat Markus Armbruster geschrieben:
> John Snow <jsnow@redhat.com> writes:
> 
> > Trivial: this array should be allocated to have ID_MAX entries always.
> > Otherwise if someone were to forget to expand this table, the assertion
> > in the id generator won't actually trigger; it will read junk data.
> 
> You mean this one:
> 
>     assert(id < ID_MAX);
> 
> The assertion is crap, because it fails to protect array access
> id_subsys_str[id].  Here's one that does:
> 
>     assert(0 <= id && id < ARRAY_SIZE(id_subsys_str));

Or without the kraxelism id >= 0. However, depending on whether enums
are signed or unsigned, I seem to remember that this could trigger
compiler warnings (comparison is always true). And this one should be
unsigned with gcc because it doesn't include negative values.

Kevin

