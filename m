Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YD6k8-0002Vb-Cw
	for mharc-qemu-trivial@gnu.org; Mon, 19 Jan 2015 02:27:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YD6k5-0002Sf-HD
	for qemu-trivial@nongnu.org; Mon, 19 Jan 2015 02:27:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YD6k4-0004Ol-Fp
	for qemu-trivial@nongnu.org; Mon, 19 Jan 2015 02:27:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YD6jz-0004ND-AX; Mon, 19 Jan 2015 02:27:15 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0J7R8Bn005924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 19 Jan 2015 02:27:08 -0500
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0J7R6Yv007666; Mon, 19 Jan 2015 02:27:07 -0500
Message-ID: <1421652425.18666.0.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: arei.gonglei@huawei.com
Date: Mon, 19 Jan 2015 08:27:05 +0100
In-Reply-To: <1421638950-12056-1-git-send-email-arei.gonglei@huawei.com>
References: <1421638950-12056-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] usb/desc-msos: using g_free instead of
 free in usb_desc_msos()
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
X-List-Received-Date: Mon, 19 Jan 2015 07:27:22 -0000

On Mo, 2015-01-19 at 11:42 +0800, arei.gonglei@huawei.com wrote:
> It's important to match g_malloc() with g_free(), plain
> malloc() with free(). Otherwise bad things can happen,
> since these allocators may use different memory pools.

added to usb queue.

thanks,
  Gerd


