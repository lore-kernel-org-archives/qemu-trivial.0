Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpWgS-0005DZ-8g
	for mharc-qemu-trivial@gnu.org; Wed, 06 Sep 2017 05:31:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1dpWgL-000561-QX
	for qemu-trivial@nongnu.org; Wed, 06 Sep 2017 05:31:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1dpWgK-00068B-UN
	for qemu-trivial@nongnu.org; Wed, 06 Sep 2017 05:31:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54092)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rjones@redhat.com>)
	id 1dpWgA-0005zF-UN; Wed, 06 Sep 2017 05:31:27 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06FBD4E049;
	Wed,  6 Sep 2017 09:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 06FBD4E049
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=rjones@redhat.com
Received: from localhost (ovpn-117-64.ams2.redhat.com [10.36.117.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54E0480F92;
	Wed,  6 Sep 2017 09:31:23 +0000 (UTC)
Date: Wed, 6 Sep 2017 10:31:22 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	famz@redhat.com, armbru@redhat.com
Message-ID: <20170906093122.GB18719@redhat.com>
References: <20170906085006.26983-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170906085006.26983-1-rjones@redhat.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 06 Sep 2017 09:31:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10] qemu-options:
 Document the -drive locking parameter.
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
X-List-Received-Date: Wed, 06 Sep 2017 09:31:42 -0000

On Wed, Sep 06, 2017 at 09:50:06AM +0100, Richard W.M. Jones wrote:
> Commit 16b48d5d66d2 ("file-posix: Add 'locking' option") added this
> option, but as it was not documented in the -help output it was not
> easily possible to tell if a particular qemu binary supports it.

My apologies, I think this patch is wrong.  I'm going to rethink it.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/

