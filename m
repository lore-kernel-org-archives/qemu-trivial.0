Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZyQC7-0005pA-Bs
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2015 15:16:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1ZyDRe-0002Y3-U5
	for qemu-trivial@nongnu.org; Mon, 16 Nov 2015 01:39:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1ZyDRe-00059O-4j
	for qemu-trivial@nongnu.org; Mon, 16 Nov 2015 01:39:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60678)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1ZyDRY-00058a-3n; Mon, 16 Nov 2015 01:39:12 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 05F3E8C1A9;
	Mon, 16 Nov 2015 06:39:10 +0000 (UTC)
Received: from localhost (dhcp-14-148.nay.redhat.com [10.66.14.148])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAG6d7oi009814; Mon, 16 Nov 2015 01:39:09 -0500
Date: Mon, 16 Nov 2015 14:39:07 +0800
From: Fam Zheng <famz@redhat.com>
To: =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Message-ID: <20151116063907.GE20672@ad.usersys.redhat.com>
References: <1447363593-20637-1-git-send-email-hpoussin@reactos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1447363593-20637-1-git-send-email-hpoussin@reactos.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scsi: remove scsi_req_free
	prototype
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
X-List-Received-Date: Mon, 16 Nov 2015 06:39:19 -0000

On Thu, 11/12 22:26, Herv=E9 Poussineau wrote:
> Function has been deleted in ad2d30f79d3b0812f02c741be2189796b788d6d7.
>=20
> Signed-off-by: Herv=E9 Poussineau <hpoussin@reactos.org>
> ---
>  include/hw/scsi/scsi.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
> index cdaf0f8..1915a73 100644
> --- a/include/hw/scsi/scsi.h
> +++ b/include/hw/scsi/scsi.h
> @@ -250,7 +250,6 @@ SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqop=
s, SCSIDevice *d,
>  SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
>                            uint8_t *buf, void *hba_private);
>  int32_t scsi_req_enqueue(SCSIRequest *req);
> -void scsi_req_free(SCSIRequest *req);
>  SCSIRequest *scsi_req_ref(SCSIRequest *req);
>  void scsi_req_unref(SCSIRequest *req);
> =20
> --=20
> 2.1.4
>=20
>=20

Reviewed-by: Fam Zheng <famz@redhat.com>

