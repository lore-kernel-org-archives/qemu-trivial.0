Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XpCGq-0002h5-EH
	for mharc-qemu-trivial@gnu.org; Fri, 14 Nov 2014 03:30:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1XpCGi-0002YP-WD
	for qemu-trivial@nongnu.org; Fri, 14 Nov 2014 03:30:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1XpCGZ-0004oF-5x
	for qemu-trivial@nongnu.org; Fri, 14 Nov 2014 03:30:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38018)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1XpCGY-0004mR-VE; Fri, 14 Nov 2014 03:30:03 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAE8TvMH005284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 14 Nov 2014 03:29:57 -0500
Received: from [10.36.116.41] (ovpn-116-41.ams2.redhat.com [10.36.116.41])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAE8TtQS004859; Fri, 14 Nov 2014 03:29:56 -0500
Message-ID: <1415953795.3012.8.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Date: Fri, 14 Nov 2014 09:29:55 +0100
In-Reply-To: <1415935528-11792-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1415935528-11792-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] gtk: fix possible memory leak about
	local_err
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Nov 2014 08:30:19 -0000

On Fr, 2014-11-14 at 11:25 +0800, zhanghailiang wrote:
> local_err in gd_vc_gfx_init() is not freed, and we don't use it,
> so remove it.

Added to gtk patch queue.

thanks,
  Gerd



