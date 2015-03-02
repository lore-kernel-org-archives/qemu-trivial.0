Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSNBw-0006BL-7r
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2015 05:03:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YSNBo-000620-7z
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 05:03:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YSNBn-0006DZ-9l
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 05:03:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42327)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YSNBi-0006CE-Oq; Mon, 02 Mar 2015 05:02:58 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t22A2tCX029922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 2 Mar 2015 05:02:55 -0500
Received: from blackfin.pond.sub.org (ovpn-116-68.ams2.redhat.com
	[10.36.116.68])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t22A2rLL005904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 2 Mar 2015 05:02:55 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6F6FA304303F; Mon,  2 Mar 2015 11:02:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1425114327-12136-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1425114327-12136-2-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Mon, 02 Mar 2015 11:02:53 +0100
In-Reply-To: <1425114327-12136-2-git-send-email-zhang.zhanghailiang@huawei.com>
	(zhanghailiang's message of "Sat, 28 Feb 2015 17:05:23 +0800")
Message-ID: <87oaobhg36.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RFC 1/5] serial-pci: Avoid
	qerror_report_err() outside QMP command handlers
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
X-List-Received-Date: Mon, 02 Mar 2015 10:03:10 -0000

zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> qerror_report_err() is a transitional interface to help with
> converting existing monitor commands to QMP.  It should not be used
> elsewhere.  Replace by error_report_err() in serial_pci_init() and
> multi_serial_pci_init().
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  hw/char/serial-pci.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
> index f05c9b4..2b0bf54 100644
> --- a/hw/char/serial-pci.c
> +++ b/hw/char/serial-pci.c
> @@ -27,7 +27,6 @@
>  
>  #include "hw/char/serial.h"
>  #include "hw/pci/pci.h"
> -#include "qapi/qmp/qerror.h"
>  
>  #define PCI_SERIAL_MAX_PORTS 4
>  
> @@ -57,8 +56,7 @@ static int serial_pci_init(PCIDevice *dev)
>      s->baudbase = 115200;
>      serial_realize_core(s, &err);
>      if (err != NULL) {
> -        qerror_report_err(err);
> -        error_free(err);
> +        error_report_err(err);
>          return -1;
>      }
>  
> @@ -116,8 +114,7 @@ static int multi_serial_pci_init(PCIDevice *dev)
>          s->baudbase = 115200;
>          serial_realize_core(s, &err);
>          if (err != NULL) {
> -            qerror_report_err(err);
> -            error_free(err);
> +            error_report_err(err);
>              return -1;
>          }
>          s->irq = pci->irqs[i];

This breaks the error reply when you hot plug the devices via QMP
device_add.

The correct solution is my "[PATCH 06/10] serial-pci: Convert to
realize".

