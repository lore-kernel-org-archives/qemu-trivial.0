Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e5BXd-0004ul-VO
	for mharc-qemu-trivial@gnu.org; Thu, 19 Oct 2017 10:11:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e5BXa-0004sO-0Y
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 10:11:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e5BXW-00047U-8p
	for qemu-trivial@nongnu.org; Thu, 19 Oct 2017 10:11:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50608)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1e5BXN-00042V-3W; Thu, 19 Oct 2017 10:11:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F58D3E2DB;
	Thu, 19 Oct 2017 14:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5F58D3E2DB
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-61.pek2.redhat.com [10.72.12.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B4ACD6061;
	Thu, 19 Oct 2017 14:11:00 +0000 (UTC)
Date: Thu, 19 Oct 2017 22:10:58 +0800
From: Fam Zheng <famz@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20171019141058.GB29815@lemon>
References: <150841324224.31292.4012464539983692364.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <150841324224.31292.4012464539983692364.stgit@bahia.lan>
User-Agent: Mutt/1.9.0 (2017-09-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 19 Oct 2017 14:11:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] docker: fix out-of-tree 'make
 docker-test-build@debian-powerpc-cross'
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
X-List-Received-Date: Thu, 19 Oct 2017 14:11:20 -0000

On Thu, 10/19 13:40, Greg Kurz wrote:
> Without this patch, it fails with:
> 
> IOError: [Errno 2] No such file or directory:
>  'tests/docker/dockerfiles/debian-apt-fake.sh'
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reasonable. Queued, thanks!

Fam

