Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cxvfc-0000mN-Mb
	for mharc-qemu-trivial@gnu.org; Tue, 11 Apr 2017 09:17:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cxvfa-0000ks-Ms
	for qemu-trivial@nongnu.org; Tue, 11 Apr 2017 09:17:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cxvfZ-0006ms-QJ
	for qemu-trivial@nongnu.org; Tue, 11 Apr 2017 09:17:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cxvfV-0006lA-GU; Tue, 11 Apr 2017 09:17:13 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 513738123F;
	Tue, 11 Apr 2017 13:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 513738123F
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 513738123F
Received: from blackfin.pond.sub.org (ovpn-116-89.ams2.redhat.com
	[10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 185B678DDB;
	Tue, 11 Apr 2017 13:17:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8B2EA1138646; Tue, 11 Apr 2017 15:17:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Craig Jellick <craig@rancher.com>
Cc: <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
References: <1489765795-32398-1-git-send-email-craig@rancher.com>
Date: Tue, 11 Apr 2017 15:17:10 +0200
In-Reply-To: <1489765795-32398-1-git-send-email-craig@rancher.com> (Craig
	Jellick's message of "Fri, 17 Mar 2017 08:49:55 -0700")
Message-ID: <871ssz9j8p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 11 Apr 2017 13:17:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add 'none' as type for
 drive's if option
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
X-List-Received-Date: Tue, 11 Apr 2017 13:17:19 -0000

Perhaps this can go via qemu-trivial.

Craig Jellick <craig@rancher.com> writes:

> Signed-off-by: Craig Jellick <craig@rancher.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 99af8ed..8291e64 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -591,7 +591,7 @@ Special files such as iSCSI devices can be specified using protocol
>  specific URLs. See the section for "Device URL Syntax" for more information.
>  @item if=@var{interface}
>  This option defines on which type on interface the drive is connected.
> -Available types are: ide, scsi, sd, mtd, floppy, pflash, virtio.
> +Available types are: ide, scsi, sd, mtd, floppy, pflash, virtio, none.
>  @item bus=@var{bus},unit=@var{unit}
>  These options define where is connected the drive by defining the bus number and
>  the unit id.

