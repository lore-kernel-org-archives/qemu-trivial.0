Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g33Ge-0004ed-1V
	for mharc-qemu-trivial@gnu.org; Thu, 20 Sep 2018 14:01:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1g33GY-0004cY-Qn
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 14:01:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1g33GO-0006R4-8c
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2018 14:01:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39196)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1g33GI-0006BJ-HS; Thu, 20 Sep 2018 14:01:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A20528667D;
	Thu, 20 Sep 2018 18:01:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-77.ams2.redhat.com
	[10.36.116.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E7123789;
	Thu, 20 Sep 2018 18:01:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A13F711385CB; Thu, 20 Sep 2018 20:00:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Li Qiang <liq3ea@gmail.com>
Cc: pbonzini@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1536130141-2742-1-git-send-email-liq3ea@gmail.com>
Date: Thu, 20 Sep 2018 20:00:53 +0200
In-Reply-To: <1536130141-2742-1-git-send-email-liq3ea@gmail.com> (Li Qiang's
	message of "Tue, 4 Sep 2018 23:49:01 -0700")
Message-ID: <87musccalm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 20 Sep 2018 18:01:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev: fix a typo in comment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2018 18:01:30 -0000

Could be merged via qemu-trivial (cc'ed).

Li Qiang <liq3ea@gmail.com> writes:

> Found by reading code.
>
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---
>  hw/core/qdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 529b82de18..7e4bfcb8f7 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -643,7 +643,7 @@ static void qdev_get_legacy_property(Object *obj, Visitor *v,
>   * the string depends on the property type.  Legacy properties are only
>   * needed for "info qtree".
>   *
> - * Do not use this is new code!  QOM Properties added through this interface
> + * Do not use this in new code!  QOM Properties added through this interface
>   * will be given names in the "legacy" namespace.
>   */
>  static void qdev_property_add_legacy(DeviceState *dev, Property *prop,

