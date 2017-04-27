Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d3jks-0004tN-9R
	for mharc-qemu-trivial@gnu.org; Thu, 27 Apr 2017 09:46:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1d3jkp-0004qv-Ha
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 09:46:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1d3jko-0003iL-Uw
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 09:46:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51066)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1d3jkh-0003aO-VA; Thu, 27 Apr 2017 09:46:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2A2CC04BD3D;
	Thu, 27 Apr 2017 13:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A2A2CC04BD3D
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=kwolf@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A2A2CC04BD3D
Received: from noname.str.redhat.com (dhcp-192-175.str.redhat.com
	[10.33.192.175])
	by smtp.corp.redhat.com (Postfix) with SMTP id 9380E18690;
	Thu, 27 Apr 2017 13:46:33 +0000 (UTC)
Date: Thu, 27 Apr 2017 15:46:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>
Message-ID: <20170427134632.GD4805@noname.str.redhat.com>
References: <20170426221046.4596-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170426221046.4596-1-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 27 Apr 2017 13:46:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] iotests: Fix typo in 026
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
X-List-Received-Date: Thu, 27 Apr 2017 13:46:44 -0000

Am 27.04.2017 um 00:10 hat Eric Blake geschrieben:
> s/refcout/refcount/
> 
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Eric Blake <eblake@redhat.com>

Thanks, applied to block-next.

Kevin

