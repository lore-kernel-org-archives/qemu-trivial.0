Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SU248-0001XO-5X
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2012 16:40:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SU245-0001UW-6i
	for qemu-trivial@nongnu.org; Mon, 14 May 2012 16:40:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SU243-0001Ri-2d
	for qemu-trivial@nongnu.org; Mon, 14 May 2012 16:40:20 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:40143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1SU242-0001RP-Rn; Mon, 14 May 2012 16:40:18 -0400
Received: by yhoo21 with SMTP id o21so6034219yho.4
	for <multiple recipients>; Mon, 14 May 2012 13:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kQ/2Qq5b208ILmx27b+WQJJJBNKiyE53H81/GG2IEo4=;
	b=vkJGzjwRvrPXbreb18WX40iMd8JsTPYfHJGpa0uCLHcrO0LXnSlXQGCNZg0ElwJMk0
	eI0U8lKMjcMsILfxchq2wV1d3s10L/h1/VxlpSWrmll77Zt/A7TfS6+2s3le3OOsWxCh
	v2R3g1b8Brf//hBQ6cMMMq6mxkqAbPZjjqGM03sWomLTP1gPzfCiQJYvDquhJwjiUk33
	EdpX0UGn3o1iDg0DlakrqN27ccIUbaSEXjB3JZHMv05F/4uDcOrR6XVG+GvFn1JkA/bj
	BEei95IjGPwPv7eWm2Mn7mznNaA10TLyOJwPkafXN6OmEK4rGzIsjyPCwwug/li7LSIv
	zqzA==
Received: by 10.60.13.134 with SMTP id h6mr4485761oec.11.1337028016498;
	Mon, 14 May 2012 13:40:16 -0700 (PDT)
Received: from illuin.morrigu.org ([32.97.110.59])
	by mx.google.com with ESMTPS id ju5sm20386583obb.23.2012.05.14.13.40.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 13:40:15 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
Received: by illuin.morrigu.org (sSMTP sendmail emulation);
	Mon, 14 May 2012 15:40:11 -0500
Date: Mon, 14 May 2012 15:40:11 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120514204011.GF28865@illuin>
References: <1336034082-5288-1-git-send-email-riegamaths@gmail.com>
	<4FB15EC4.3050206@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4FB15EC4.3050206@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org, dunrong huang <riegamaths@gmail.com>
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
X-List-Received-Date: Mon, 14 May 2012 20:40:22 -0000

On Mon, May 14, 2012 at 09:36:36PM +0200, Stefan Weil wrote:
> Hello,
> 
> Am 03.05.2012 10:34, schrieb dunrong huang:
> >The str allocated in visit_type_str was not freed
> >
> >Signed-off-by: dunrong huang <riegamaths@gmail.com>
> >---
> >hw/qdev-properties.c | 8 ++++++--
> >1 files changed, 6 insertions(+), 2 deletions(-)
> >
> >diff --git a/hw/qdev-properties.c b/hw/qdev-properties.c
> >index 98dd06a..8088699 100644
> >--- a/hw/qdev-properties.c
> >+++ b/hw/qdev-properties.c
> >@@ -726,7 +726,7 @@ static void set_mac(Object *obj, Visitor *v,
> >void *opaque,
> >MACAddr *mac = qdev_get_prop_ptr(dev, prop);
> >Error *local_err = NULL;
> >int i, pos;
> >- char *str, *p;
> >+ char *str = NULL, *p;
> 
> Is this change really needed?
> 
> >
> >if (dev->state != DEV_STATE_CREATED) {
> >error_set(errp, QERR_PERMISSION_DENIED);
> >@@ -753,10 +753,12 @@ static void set_mac(Object *obj, Visitor *v,
> >void *opaque,
> >}
> >mac->a[i] = strtol(str+pos, &p, 16);
> >}
> >+ g_free(str);
> >return;
> >
> >inval:
> >error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
> >+ g_free(str);
> >}
> >
> >PropertyInfo qdev_prop_macaddr = {
> >@@ -825,7 +827,7 @@ static void set_pci_devfn(Object *obj, Visitor
> >*v, void *opaque,
> >uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
> >unsigned int slot, fn, n;
> >Error *local_err = NULL;
> >- char *str = (char *)"";
> >+ char *str = NULL;
> 
> As far as I could see, str does not need an initial value, so
> neither the old nor the new code is optimal (both versions do
> work).
> 
> >
> >if (dev->state != DEV_STATE_CREATED) {
> >error_set(errp, QERR_PERMISSION_DENIED);
> >@@ -847,10 +849,12 @@ static void set_pci_devfn(Object *obj,
> >Visitor *v, void *opaque,
> >goto invalid;
> >}
> >*ptr = slot << 3 | fn;
> >+ g_free(str);
> >return;
> >
> >invalid:
> >error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
> >+ g_free(str);
> >}
> >
> >static int print_pci_devfn(DeviceState *dev, Property *prop, char
> >*dest, size_t len)
> 
> Maybe some expert (Michael Roth?) can comment on the correct
> usage of visit_type_str.
> 
> Is the initial value for the 2nd argument really needed?
> The current QEMU code sometimes uses initialization,
> but not always (see the code above, for example), so it is confusing.

For an output visitor (native-to-<QMP/String/etc>), we assume we're
getting a pointer to a valid string, and generally treat NULL as an indication
to generate an empty string, so the initial value matters in that case.
For that situation the changes would be warranted.

But for an input visitor (<QMP/String/etc>-to-native) like we're using in the
setters this patch modifies, the initial value gets clobbered with a pointer
to whatever the visitor allocates, so initializing the pointers isn't
neccessary.

> 
> Otherwise the patch is ok. It fixes memory leaks,
> therefore it should be added to QEMU 1.1.
> 
> Tested-by: Stefan Weil <sw@weilnetz.de>
> > Regards,
> 
> Stefan Weil
> 
> 

