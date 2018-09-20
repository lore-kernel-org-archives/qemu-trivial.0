Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g34BR-0000bW-Mx
	for mharc-qemu-trivial@gnu.org; Thu, 20 Sep 2018 15:00:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1g34BQ-0000Zo-Be
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 15:00:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1g34BP-0000FE-Ja
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 15:00:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49364)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1g34BC-0008MU-BZ; Thu, 20 Sep 2018 14:59:58 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7EB73082144;
	Thu, 20 Sep 2018 18:59:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-77.ams2.redhat.com
	[10.36.116.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 341933DE1;
	Thu, 20 Sep 2018 18:59:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 905FD11385CB; Thu, 20 Sep 2018 20:59:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, thuth@redhat.com,
	sagark@eecs.berkeley.edu, mst@redhat.com,
	qemu-trivial@nongnu.org, kbastian@mail.uni-paderborn.de,
	palmer@sifive.com, qemu-devel@nongnu.org, agraf@suse.de,
	mjc@sifive.com, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, rth@twiddle.net
References: <1537441712-17177-1-git-send-email-maozhongyi@cmss.chinamobile.com>
	<20180920173453.GP30558@habkost.net>
Date: Thu, 20 Sep 2018 20:59:51 +0200
In-Reply-To: <20180920173453.GP30558@habkost.net> (Eduardo Habkost's message
	of "Thu, 20 Sep 2018 14:34:53 -0300")
Message-ID: <87pnx8dmfs.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 20 Sep 2018 18:59:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop the "qemu:" prefix
 from error_report()
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
X-List-Received-Date: Thu, 20 Sep 2018 19:00:13 -0000

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Sep 20, 2018 at 07:08:32AM -0400, Mao Zhongyi wrote:
>> error_report and friends already add a "qemu-system-xxx" prefix
>> to the string, so a "qemu:" prefix is redundant in the string.
>> Just drop it.
>> 
>> Reported-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>
> Markus, do you want to merge it through your tree?

Yes.

> If we are already touching those messages, it would be nice if we
> removed punctuation too on some cases below[1].

Yes.  Done in my tree.

I'm also tweaking the subject to

    Drop "qemu:" prefix from error_report() arguments

Queued, thanks!

