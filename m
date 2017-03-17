Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cojBn-0003wo-B5
	for mharc-qemu-trivial@gnu.org; Fri, 17 Mar 2017 00:08:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cojBl-0003v5-6I
	for qemu-trivial@nongnu.org; Fri, 17 Mar 2017 00:08:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cojBk-0005iK-5h
	for qemu-trivial@nongnu.org; Fri, 17 Mar 2017 00:08:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1cojBe-0005fe-4S; Fri, 17 Mar 2017 00:08:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECF757F359;
	Fri, 17 Mar 2017 04:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com ECF757F359
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com ECF757F359
Received: from localhost (ovpn-8-19.pek2.redhat.com [10.72.8.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EDC75C541;
	Fri, 17 Mar 2017 04:08:20 +0000 (UTC)
Date: Fri, 17 Mar 2017 12:08:17 +0800
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <20170317040817.GB13125@lemon.lan>
References: <20170317021739.16877-1-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170317021739.16877-1-famz@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 17 Mar 2017 04:08:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: Make
 'replication_state' an enum
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
X-List-Received-Date: Fri, 17 Mar 2017 04:08:30 -0000

On Fri, 03/17 10:17, Fam Zheng wrote:
> BDRVReplicationState.replication_state is a name with a bit of
> duplication, plus it could be an enum like BDRVReplicationState.mode,
> which is be more readable and also more straightforward in a debuuger.

s/is be/is/
s/debuuger/debugger/

Can I blame the hardware setup change I just did (further display and external
keyboard)? :-/

Fam

