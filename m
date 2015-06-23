Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7Ima-0007Tk-CU
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 03:38:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z7ImY-0007Qy-Jz
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:38:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z7ImX-0004HS-Kv
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:38:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z7ImQ-0004EP-03; Tue, 23 Jun 2015 03:38:02 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 86F7E8F2FD;
	Tue, 23 Jun 2015 07:38:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-62.ams2.redhat.com
	[10.36.116.62])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5N7bxUL028880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 23 Jun 2015 03:38:01 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 649AD303E586; Tue, 23 Jun 2015 09:37:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1435024385-9084-1-git-send-email-arei.gonglei@huawei.com>
	<1435024385-9084-3-git-send-email-arei.gonglei@huawei.com>
Date: Tue, 23 Jun 2015 09:37:59 +0200
In-Reply-To: <1435024385-9084-3-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Tue, 23 Jun 2015 09:53:05 +0800")
Message-ID: <87k2uuzxgo.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	mst@redhat.com, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] qdev: fix
	OVERFLOW_BEFORE_WIDEN
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
X-List-Received-Date: Tue, 23 Jun 2015 07:38:11 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> Potentially overflowing expression "1 << prop->bitnr" with
> type "int" (32 bits, signed) is evaluated using 32-bit arithmetic,
> and then used in a context that expects an expression of type
> "uint64_t" (64 bits, unsigned).
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/core/qdev-properties.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index a1606de..f78b335 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -130,7 +130,7 @@ PropertyInfo qdev_prop_bit = {
>  static uint64_t qdev_get_prop_mask64(Property *prop)
>  {
>      assert(prop->info == &qdev_prop_bit);
> -    return 0x1 << prop->bitnr;
> +    return 0x1ull << prop->bitnr;
>  }
>  
>  static void bit64_prop_set(DeviceState *dev, Property *props, bool val)

In my opionion, the 0x in 0x1ull is pure noise :)

