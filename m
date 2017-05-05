Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d6X91-00075b-3U
	for mharc-qemu-trivial@gnu.org; Fri, 05 May 2017 02:55:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1d6X8z-00073G-HG
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 02:55:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1d6X8y-0006Ld-Um
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 02:55:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45688)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1d6X8u-0006HY-Ln; Fri, 05 May 2017 02:55:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5C178046D;
	Fri,  5 May 2017 06:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B5C178046D
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B5C178046D
Received: from localhost (ovpn-8-36.pek2.redhat.com [10.72.8.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4CF618C54;
	Fri,  5 May 2017 06:55:05 +0000 (UTC)
Date: Fri, 5 May 2017 14:55:04 +0800
From: Fam Zheng <famz@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, thuth@redhat.com, dgilbert@redhat.com
Message-ID: <20170505065504.GA21435@lemon.lan>
References: <20170428022329.30726-1-eblake@redhat.com>
	<20170428085407.GC23819@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170428085407.GC23819@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 05 May 2017 06:55:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Ignore another built
 executable
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
X-List-Received-Date: Fri, 05 May 2017 06:55:14 -0000

On Fri, 04/28 09:54, Daniel P. Berrange wrote:
> On Thu, Apr 27, 2017 at 09:23:29PM -0500, Eric Blake wrote:
> > Commit 78f86a2b7 added a new test, but forgot to exclude the built
> > binary from version control.
> 
> CC Fam
> 
> I wonder if the patchew test system could be made to report an error
> if git identifies built files that are not ignored.
> 

If we had .git in the docker tests that patchew uses, it would be easy.  That's
an unfortunate dependency for a number of other features, I'll see what I can
do.

Fam

