Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNwNv-0006MQ-N5
	for mharc-qemu-trivial@gnu.org; Tue, 07 May 2019 05:27:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hNwNp-0006LA-V9
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 05:27:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hNwNp-0003ts-0h
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 05:27:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55052)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hNwNk-0003qv-S0; Tue, 07 May 2019 05:27:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21DDB307CDD5;
	Tue,  7 May 2019 09:27:28 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-186.ams2.redhat.com
	[10.36.116.186])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEC0060BEC;
	Tue,  7 May 2019 09:27:26 +0000 (UTC)
Date: Tue, 7 May 2019 11:27:25 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Niels de Vos <ndevos@redhat.com>
Message-ID: <20190507092725.GD5808@localhost.localdomain>
References: <20190506061854.22207-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190506061854.22207-1-thuth@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 07 May 2019 09:27:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [QEMU PATCH] MAINTAINERS: Downgrade status of
 block sections without "M:" to "Odd Fixes"
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
X-List-Received-Date: Tue, 07 May 2019 09:27:38 -0000

Am 06.05.2019 um 08:18 hat Thomas Huth geschrieben:
> Fixes might still get picked up via the qemu-block mailing list,
> so the status is not "Orphan" yet.
> Also add the gluster mailing list as suggested by Niels here:
> 
>  https://patchwork.kernel.org/patch/10613297/#22409943
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, applied to the block branch.

Kevin

