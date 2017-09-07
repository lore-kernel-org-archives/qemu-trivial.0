Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpsLK-0005nm-MA
	for mharc-qemu-trivial@gnu.org; Thu, 07 Sep 2017 04:39:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dpsLI-0005lb-4v
	for qemu-trivial@nongnu.org; Thu, 07 Sep 2017 04:39:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dpsLD-0006Qj-JI
	for qemu-trivial@nongnu.org; Thu, 07 Sep 2017 04:39:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35534)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1dpsL2-0006Lw-3j; Thu, 07 Sep 2017 04:39:04 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5C73C04B924;
	Thu,  7 Sep 2017 08:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C5C73C04B924
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader (ovpn-117-116.ams2.redhat.com [10.36.117.116])
	by smtp.corp.redhat.com (Postfix) with SMTP id A982E60603;
	Thu,  7 Sep 2017 08:38:56 +0000 (UTC)
Date: Thu, 7 Sep 2017 10:38:55 +0200
From: Eduardo Otubo <otubo@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170907083855.GC2441@vader>
References: <20170901110332.32650-1-otubo@redhat.com>
	<20170901143016.GK7570@localhost.localdomain>
	<20170902091520.bxecfhisvy46o4cb@aurel32.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170902091520.bxecfhisvy46o4cb@aurel32.net>
User-Agent: Mutt/1.8.3+47 (5f034395e53d) (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 07 Sep 2017 08:39:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] dma/i82374: avoid double creation of
 i82374 device
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
X-List-Received-Date: Thu, 07 Sep 2017 08:39:21 -0000

On Sat, Sep 02, 2017 at 11:15:20AM +0200, Aurelien Jarno wrote:
> On 2017-09-01 11:30, Eduardo Habkost wrote:
> > i82374 is compiled in only on ppc and sh4, so I'm CCing the
> > maintainers for those architectures.
> 
> The i82374 device is not useful nor usable on SH4. It has just been
> added in commit 85d3846a39 to be able to run the tests.
> 
> Aurelien
> 

Any word from the ppc guys?

-- 
Eduardo Otubo
Senior Software Engineer @ RedHat

