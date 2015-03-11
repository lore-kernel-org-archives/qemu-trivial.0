Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVggl-0000Fe-S9
	for mharc-qemu-trivial@gnu.org; Wed, 11 Mar 2015 09:28:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YVggk-0000Cd-0N
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 09:28:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YVggj-0000Lc-9Z
	for qemu-trivial@nongnu.org; Wed, 11 Mar 2015 09:28:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YVggd-0000Kp-HW; Wed, 11 Mar 2015 09:28:35 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2BDSUjO003955
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 11 Mar 2015 09:28:30 -0400
Received: from [10.36.116.56] (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2BDSStD013956; Wed, 11 Mar 2015 09:28:28 -0400
Message-ID: <1426080507.28125.9.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: arei.gonglei@huawei.com
Date: Wed, 11 Mar 2015 14:28:27 +0100
In-Reply-To: <1426062061-12128-1-git-send-email-arei.gonglei@huawei.com>
References: <1426062061-12128-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 0/2] ui: two small fixes
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
X-List-Received-Date: Wed, 11 Mar 2015 13:28:42 -0000

On Mi, 2015-03-11 at 16:20 +0800, arei.gonglei@huawei.com wrote:
> Gonglei (2):
>   ui/console: fix OVERFLOW_BEFORE_WIDEN
>   vnc: avoid possible file handler leak

added to vnc patch queue.

thanks,
  Gerd



