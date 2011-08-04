Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qot59-0005le-Lv
	for mharc-qemu-trivial@gnu.org; Thu, 04 Aug 2011 04:15:07 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Qot56-0005cW-LL
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2011 04:15:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Qot55-0003Is-Or
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2011 04:15:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Qot53-0003I3-Rd; Thu, 04 Aug 2011 04:15:02 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p748Eu1U029526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 4 Aug 2011 04:14:56 -0400
Received: from blackfin.pond.sub.org (ovpn-113-25.phx2.redhat.com
	[10.3.113.25])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p748Es2p028106; Thu, 4 Aug 2011 04:14:55 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 7C09F6005D; Thu,  4 Aug 2011 10:14:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
References: <1312443635-21856-1-git-send-email-wuzhy@linux.vnet.ibm.com>
Date: Thu, 04 Aug 2011 10:14:53 +0200
In-Reply-To: <1312443635-21856-1-git-send-email-wuzhy@linux.vnet.ibm.com> (Zhi
	Yong Wu's message of "Thu, 4 Aug 2011 15:40:35 +0800")
Message-ID: <m3bow5ioea.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: aliguori@us.ibm.com, stefanha@linux.vnet.ibm.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, zwu.kernel@gmail.com, ryanh@us.ibm.com,
	luowenj@cn.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scsi-bus: use DO_UPCAST.
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
X-List-Received-Date: Thu, 04 Aug 2011 08:15:05 -0000

Zhi Yong Wu <wuzhy@linux.vnet.ibm.com> writes:

> Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
> ---
>  hw/scsi-bus.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/hw/scsi-bus.c b/hw/scsi-bus.c
> index ad6a730..f6c416e 100644
> --- a/hw/scsi-bus.c
> +++ b/hw/scsi-bus.c
> @@ -712,7 +712,7 @@ void scsi_device_purge_requests(SCSIDevice *sdev)
>  
>  static char *scsibus_get_fw_dev_path(DeviceState *dev)
>  {
> -    SCSIDevice *d = (SCSIDevice*)dev;
> +    SCSIDevice *d = DO_UPCAST(SCSIDevice, qdev, dev);
>      SCSIBus *bus = scsi_bus_from_device(d);
>      char path[100];
>      int i;

Reviewed-by: Markus Armbruster <armbru@redhat.com>

