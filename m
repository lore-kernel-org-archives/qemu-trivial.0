Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g9RYn-0007ZO-1d
	for mharc-qemu-trivial@gnu.org; Mon, 08 Oct 2018 05:10:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1g9RYk-0007Xz-QJ
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 05:10:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1g9RYk-0002zV-2Z
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 05:10:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57648)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1g9RYe-0002l6-65; Mon, 08 Oct 2018 05:10:32 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A489308212C;
	Mon,  8 Oct 2018 09:10:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.117.0])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BD51173B8;
	Mon,  8 Oct 2018 09:10:24 +0000 (UTC)
Date: Mon, 8 Oct 2018 11:10:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Message-ID: <20181008091022.GA4604@localhost.localdomain>
References: <20181006183851.3797-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181006183851.3797-1-sw@weilnetz.de>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 08 Oct 2018 09:10:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] qemu-io-cmds: Fix two format strings
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
X-List-Received-Date: Mon, 08 Oct 2018 09:10:39 -0000

Am 06.10.2018 um 20:38 hat Stefan Weil geschrieben:
> Use %zu instead of %zd for unsigned numbers.
> 
> This fixes two error messages from the LSTM static code analyzer:
> 
> This argument should be of type 'ssize_t' but is of type 'unsigned long'
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Thanks, applied to the block branch.

Kevin

