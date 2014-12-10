Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XycaH-0003Nm-8t
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 03:25:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XycaA-00039p-3M
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:25:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xyca3-000432-Vr
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:25:14 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XycZr-0003RC-Ce; Wed, 10 Dec 2014 03:24:55 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 22ACC419A1;
	Wed, 10 Dec 2014 11:24:54 +0300 (MSK)
Message-ID: <54880356.3090905@msgid.tls.msk.ru>
Date: Wed, 10 Dec 2014 11:24:54 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, Jun Li <junmuzi@gmail.com>
References: <1416380263-1274-1-git-send-email-junmuzi@gmail.com>
	<20141119070916.GA9314@fam-t430.nay.redhat.com>
In-Reply-To: <20141119070916.GA9314@fam-t430.nay.redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, juli@redhat.com, qemu-devel@nongnu.org,
	kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] usb: delete redundant
 brackets in usb_host_handle_control()
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
X-List-Received-Date: Wed, 10 Dec 2014 08:25:20 -0000

19.11.2014 10:09, Fam Zheng wrote:
> On Wed, 11/19 14:57, Jun Li wrote:
>> When see usb codes, find there are redundant brackets !((udev->port->speedmask
>> & USB_SPEED_MASK_SUPER)) here. So delete it.

Applied to -trivial, thank you!

/mjt

