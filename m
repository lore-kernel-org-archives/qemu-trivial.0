Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SU14a-0001UN-No
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2012 15:36:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SU14X-0001JP-C0
	for qemu-trivial@nongnu.org; Mon, 14 May 2012 15:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SU14V-00054A-Ld
	for qemu-trivial@nongnu.org; Mon, 14 May 2012 15:36:44 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:49254)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SU14S-00053e-3U; Mon, 14 May 2012 15:36:40 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1D2C27280019; Mon, 14 May 2012 21:36:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id j4G4+3I+Jcti; Mon, 14 May 2012 21:36:37 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086E111.dip.t-dialin.net [80.134.225.17])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	7B6E07280018; Mon, 14 May 2012 21:36:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1SU14P-0004bq-7I; Mon, 14 May 2012 21:36:37 +0200
Message-ID: <4FB15EC4.3050206@weilnetz.de>
Date: Mon, 14 May 2012 21:36:36 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120506 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: dunrong huang <riegamaths@gmail.com>
References: <1336034082-5288-1-git-send-email-riegamaths@gmail.com>
In-Reply-To: <1336034082-5288-1-git-send-email-riegamaths@gmail.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev: Fix memory leak
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
X-List-Received-Date: Mon, 14 May 2012 19:36:47 -0000

Hello,

Am 03.05.2012 10:34, schrieb dunrong huang:
> The str allocated in visit_type_str was not freed
>
> Signed-off-by: dunrong huang <riegamaths@gmail.com>
> ---
> hw/qdev-properties.c | 8 ++++++--
> 1 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/qdev-properties.c b/hw/qdev-properties.c
> index 98dd06a..8088699 100644
> --- a/hw/qdev-properties.c
> +++ b/hw/qdev-properties.c
> @@ -726,7 +726,7 @@ static void set_mac(Object *obj, Visitor *v, void 
> *opaque,
> MACAddr *mac = qdev_get_prop_ptr(dev, prop);
> Error *local_err = NULL;
> int i, pos;
> - char *str, *p;
> + char *str = NULL, *p;

Is this change really needed?

>
> if (dev->state != DEV_STATE_CREATED) {
> error_set(errp, QERR_PERMISSION_DENIED);
> @@ -753,10 +753,12 @@ static void set_mac(Object *obj, Visitor *v, 
> void *opaque,
> }
> mac->a[i] = strtol(str+pos, &p, 16);
> }
> + g_free(str);
> return;
>
> inval:
> error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
> + g_free(str);
> }
>
> PropertyInfo qdev_prop_macaddr = {
> @@ -825,7 +827,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, 
> void *opaque,
> uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
> unsigned int slot, fn, n;
> Error *local_err = NULL;
> - char *str = (char *)"";
> + char *str = NULL;

As far as I could see, str does not need an initial value, so
neither the old nor the new code is optimal (both versions do
work).

>
> if (dev->state != DEV_STATE_CREATED) {
> error_set(errp, QERR_PERMISSION_DENIED);
> @@ -847,10 +849,12 @@ static void set_pci_devfn(Object *obj, Visitor 
> *v, void *opaque,
> goto invalid;
> }
> *ptr = slot << 3 | fn;
> + g_free(str);
> return;
>
> invalid:
> error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
> + g_free(str);
> }
>
> static int print_pci_devfn(DeviceState *dev, Property *prop, char 
> *dest, size_t len)

Maybe some expert (Michael Roth?) can comment on the correct
usage of visit_type_str.

Is the initial value for the 2nd argument really needed?
The current QEMU code sometimes uses initialization,
but not always (see the code above, for example), so it is confusing.

Otherwise the patch is ok. It fixes memory leaks,
therefore it should be added to QEMU 1.1.

Tested-by: Stefan Weil <sw@weilnetz.de>

Regards,

Stefan Weil


