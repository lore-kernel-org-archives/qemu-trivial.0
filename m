Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7HlO-0008UZ-4N
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 02:32:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Z7HlM-0008SG-8e
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 02:32:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Z7HlL-0002mE-9l
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 02:32:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58798)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1Z7HlF-0002jD-GS; Tue, 23 Jun 2015 02:32:45 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id A72B7359A6F;
	Tue, 23 Jun 2015 06:32:44 +0000 (UTC)
Received: from redhat.com (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t5N6WgaG028348; Tue, 23 Jun 2015 02:32:43 -0400
Date: Tue, 23 Jun 2015 08:32:42 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: arei.gonglei@huawei.com
Message-ID: <20150623083219-mutt-send-email-mst@redhat.com>
References: <1435024385-9084-1-git-send-email-arei.gonglei@huawei.com>
	<1435024385-9084-2-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435024385-9084-2-git-send-email-arei.gonglei@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/2] virito-pci: fix OVERRUN problem
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
X-List-Received-Date: Tue, 23 Jun 2015 06:32:53 -0000

Although the subject is virtio-pci. Fixed up.


