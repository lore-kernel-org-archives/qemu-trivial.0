Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T6nKQ-00088R-8t
	for mharc-qemu-trivial@gnu.org; Wed, 29 Aug 2012 14:49:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1T6nKO-00088L-AM
	for qemu-trivial@nongnu.org; Wed, 29 Aug 2012 14:49:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1T6nKN-00072m-CE
	for qemu-trivial@nongnu.org; Wed, 29 Aug 2012 14:49:24 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:64074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1T6nKN-00072h-6Z; Wed, 29 Aug 2012 14:49:23 -0400
Received: by wgbfm10 with SMTP id fm10so576439wgb.10
	for <multiple recipients>; Wed, 29 Aug 2012 11:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=eGEWk2+gvp1YEQMFe29vSb0krJNE9lYfhcnZ/8pQvwc=;
	b=fjB1bdiETw+J2zUsOrZPZm+2FQdaXm643Ti5myoExxw1hcvGcynPLI1Im8tnxF8Nqw
	cEPfXl/3k3xnCEBUywZEsJfKQpGKi1BGpGc5A6Jqu50mZw1GvDOsyU3oXX6ADEg6H6sD
	xNgNKm1pq0bnoPke3CIk8rgKkNHGMlQD/kuNhAyAc2FeLAFprF6ewKPfDid6XhRT/q5y
	1ErYJCQKqxdRfr29O/YgObpHNr2LhgaVGzCyk7kEow5g4Ho0sbRFsYcj1UchwOGV0xMr
	AnoipbV7r94C5BDNSRgjxCqWhH4nPDNxEe634WVu2lFPTs1VoSyqJO5GdCyNS10bKPCD
	Utag==
Received: by 10.216.153.207 with SMTP id f57mr1432982wek.196.1346266162121;
	Wed, 29 Aug 2012 11:49:22 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id l5sm17463844wix.5.2012.08.29.11.49.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 11:49:20 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <503E642E.6080109@redhat.com>
Date: Wed, 29 Aug 2012 20:49:18 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1346265565-27501-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1346265565-27501-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for 1.2] scsi-disk: Fix typo (uint32 ->
	uint32_t)
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
X-List-Received-Date: Wed, 29 Aug 2012 18:49:25 -0000

Il 29/08/2012 20:39, Stefan Weil ha scritto:
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/scsi-disk.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/scsi-disk.c b/hw/scsi-disk.c
> index 409f760..cd72afd 100644
> --- a/hw/scsi-disk.c
> +++ b/hw/scsi-disk.c
> @@ -1461,7 +1461,7 @@ static void scsi_unmap_complete(void *opaque, int ret)
>      SCSIDiskReq *r = data->r;
>      SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
>      uint64_t sector_num;
> -    uint32 nb_sectors;
> +    uint32_t nb_sectors;
>  
>      r->req.aiocb = NULL;
>      if (ret < 0) {
> 

Good catch.

I added it to the pending pull request.

Paolo

