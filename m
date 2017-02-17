Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ceWkq-0000Ba-3X
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2017 19:50:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1ceWkn-0000A6-GO
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 19:50:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1ceWkm-0006rS-Q0
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 19:50:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35516)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1ceWkh-0006oV-Hl; Thu, 16 Feb 2017 19:50:23 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 297984E4C7;
	Fri, 17 Feb 2017 00:50:23 +0000 (UTC)
Received: from localhost (ovpn-8-33.pek2.redhat.com [10.72.8.33])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1H0oLUk017158; Thu, 16 Feb 2017 19:50:22 -0500
Date: Fri, 17 Feb 2017 08:50:18 +0800
From: Fam Zheng <famz@redhat.com>
To: Franklin Snaipe Mathieu <snaipe@diacritic.io>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, snaipe@arista.com,
	Riku Voipio <riku.voipio@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <20170217005018.GA21716@lemon.lan>
References: <20170216085857.23501-1-snaipe@diacritic.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170216085857.23501-1-snaipe@diacritic.io>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 17 Feb 2017 00:50:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] syscall: fixed mincore(2)
 not failing with ENOMEM
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
X-List-Received-Date: Fri, 17 Feb 2017 00:50:30 -0000

On Thu, 02/16 08:58, Franklin Snaipe Mathieu wrote:
> +            p = lock_user_string(arg3)
> +            if (!p) {

Please compile test at least, even if it is a trivial patch.

Fam

