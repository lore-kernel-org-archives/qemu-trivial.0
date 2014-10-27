Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XiipI-0001UG-Ng
	for mharc-qemu-trivial@gnu.org; Mon, 27 Oct 2014 07:51:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1XiipC-0001OD-IJ
	for qemu-trivial@nongnu.org; Mon, 27 Oct 2014 07:51:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Xiip7-00075w-L1
	for qemu-trivial@nongnu.org; Mon, 27 Oct 2014 07:51:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Xiiox-0006yW-Rq; Mon, 27 Oct 2014 07:50:48 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9RBofDS026289
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 27 Oct 2014 07:50:41 -0400
Received: from [10.36.116.55] (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9RBod0u009591; Mon, 27 Oct 2014 07:50:39 -0400
Message-ID: <1414410638.9909.9.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: arei.gonglei@huawei.com
Date: Mon, 27 Oct 2014 12:50:38 +0100
In-Reply-To: <1414405218-468-1-git-send-email-arei.gonglei@huawei.com>
References: <1414405218-468-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, weidong.huang@huawei.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] uhci: remove useless DEBUG
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
X-List-Received-Date: Mon, 27 Oct 2014 11:51:07 -0000

On Mo, 2014-10-27 at 18:20 +0800, arei.gonglei@huawei.com wrote:
> commit 50dcc0f8 (uhci: tracing support) had removed
> DPRINTF, the DEBUG marco is useless now, remove it.

Added to usb patch queue.

thanks,
  Gerd


