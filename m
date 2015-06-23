Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7Iwd-00043h-J0
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 03:48:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Z7Iwb-00041O-51
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:48:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Z7Iwa-0000GV-7s
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:48:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Z7IwU-0000FG-9z; Tue, 23 Jun 2015 03:48:26 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id D57B82CD856;
	Tue, 23 Jun 2015 07:48:25 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-26.ams2.redhat.com
	[10.36.116.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5N7mNCo007957; Tue, 23 Jun 2015 03:48:24 -0400
Message-ID: <1435045703.10077.47.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: arei.gonglei@huawei.com
Date: Tue, 23 Jun 2015 09:48:23 +0200
In-Reply-To: <1435024385-9084-3-git-send-email-arei.gonglei@huawei.com>
References: <1435024385-9084-1-git-send-email-arei.gonglei@huawei.com>
	<1435024385-9084-3-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 2/2] qdev: fix OVERFLOW_BEFORE_WIDEN
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
X-List-Received-Date: Tue, 23 Jun 2015 07:48:34 -0000

On Di, 2015-06-23 at 09:53 +0800, arei.gonglei@huawei.com wrote:
>  static uint64_t qdev_get_prop_mask64(Property *prop)
>  {
>      assert(prop->info == &qdev_prop_bit);
> -    return 0x1 << prop->bitnr;
> +    return 0x1ull << prop->bitnr;
>  }

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


