Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g9h2z-00048B-IK
	for mharc-qemu-trivial@gnu.org; Mon, 08 Oct 2018 21:42:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1g9h2x-00046r-EW
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 21:42:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1g9h2s-0004Ih-E0
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 21:42:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41598)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1g9h2A-0003qy-Om; Mon, 08 Oct 2018 21:42:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA6BB3082A23;
	Tue,  9 Oct 2018 01:42:01 +0000 (UTC)
Received: from localhost (ovpn-12-84.pek2.redhat.com [10.72.12.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9153B5EDE1;
	Tue,  9 Oct 2018 01:41:58 +0000 (UTC)
Date: Tue, 9 Oct 2018 09:41:56 +0800
From: Fam Zheng <famz@redhat.com>
To: Li Qiang <liq3ea@gmail.com>
Cc: stefanha@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20181009014156.GA431@magic>
References: <1538964972-3223-1-git-send-email-liq3ea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538964972-3223-1-git-send-email-liq3ea@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 09 Oct 2018 01:42:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] util: aio-posix: fix a typo
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
X-List-Received-Date: Tue, 09 Oct 2018 01:42:52 -0000

On Sun, 10/07 19:16, Li Qiang wrote:
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@gmail.com>

Reviewed-by: Fam Zheng <famz@redhat.com>

