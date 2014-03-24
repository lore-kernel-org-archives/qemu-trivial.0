Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WS74r-0008NO-Om
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 11:46:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WS74k-0008DS-Ja
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 11:46:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WS74e-0005NS-KB
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 11:46:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1WS74S-0005K6-8A; Mon, 24 Mar 2014 11:45:52 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2OFjnFi020720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Mar 2014 11:45:49 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-69.ams2.redhat.com
	[10.36.112.69])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2OFji8q006623; Mon, 24 Mar 2014 11:45:45 -0400
Message-ID: <53305328.6070307@redhat.com>
Date: Mon, 24 Mar 2014 16:45:44 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Prasad Joshi <prasadjoshi.linux@gmail.com>
References: <1395675886-3357-1-git-send-email-prasadjoshi.linux@gmail.com>
In-Reply-To: <1395675886-3357-1-git-send-email-prasadjoshi.linux@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	stefanha@redhat.com, agraf@suse.de
Subject: Re: [Qemu-trivial] [PATCH] spapr_vscsi: remove duplicate condition
	check
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
X-List-Received-Date: Mon, 24 Mar 2014 15:46:16 -0000

Il 24/03/2014 16:44, Prasad Joshi ha scritto:
> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
> ---
>  hw/scsi/spapr_vscsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
> index 34478f0..d4ada4f 100644
> --- a/hw/scsi/spapr_vscsi.c
> +++ b/hw/scsi/spapr_vscsi.c
> @@ -690,7 +690,7 @@ static void vscsi_inquiry_no_target(VSCSIState *s, vscsi_req *req)
>      int rc, len, alen;
>
>      /* We dont do EVPD. Also check that page_code is 0 */
> -    if ((cdb[1] & 0x01) || (cdb[1] & 0x01) || cdb[2] != 0) {
> +    if ((cdb[1] & 0x01) || cdb[2] != 0) {
>          /* Send INVALID FIELD IN CDB */
>          vscsi_makeup_sense(s, req, ILLEGAL_REQUEST, 0x24, 0);
>          vscsi_send_rsp(s, req, CHECK_CONDITION, 0, 0);
>

Not trivial---I have no idea if something else was meant to be checked.

Paolo

