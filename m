Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xxwrd-0005pq-Ll
	for mharc-qemu-trivial@gnu.org; Mon, 08 Dec 2014 06:52:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1XxwrW-0005hZ-U3
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 06:52:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1XxwrS-0005u3-16
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 06:52:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1XxwrI-0005rz-3Y; Mon, 08 Dec 2014 06:52:08 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB8Bpsgh004877
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 8 Dec 2014 06:51:55 -0500
Received: from [10.36.116.58] (ovpn-116-58.ams2.redhat.com [10.36.116.58])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB8BprPc010075; Mon, 8 Dec 2014 06:51:53 -0500
Message-ID: <1418039512.27021.57.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: arei.gonglei@huawei.com
Date: Mon, 08 Dec 2014 12:51:52 +0100
In-Reply-To: <1418038745-6728-1-git-send-email-arei.gonglei@huawei.com>
References: <1418038745-6728-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] keymaps: correct keymaps.c following
	Qemu coding style
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
X-List-Received-Date: Mon, 08 Dec 2014 11:52:27 -0000

On Mo, 2014-12-08 at 19:39 +0800, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> It's hard to read because of the confused coding
> style in this file. Let's correct it following Qemu
> coding style.

added to vnc patch queue.

thanks,
  Gerd



