Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QHZ55-0002Jh-AH
	for mharc-qemu-trivial@gnu.org; Wed, 04 May 2011 06:13:19 -0400
Received: from eggs.gnu.org ([140.186.70.92]:39835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1QHZ54-0002Ip-1O
	for qemu-trivial@nongnu.org; Wed, 04 May 2011 06:13:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1QHZ53-0003QC-BA
	for qemu-trivial@nongnu.org; Wed, 04 May 2011 06:13:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1QHZ50-0003PQ-MU; Wed, 04 May 2011 06:13:15 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p44ADAvn013486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 4 May 2011 06:13:10 -0400
Received: from playa.tlv.redhat.com (dhcp-3-110.tlv.redhat.com [10.35.3.110])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id p44AD51F027680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Wed, 4 May 2011 06:13:08 -0400
Date: Wed, 4 May 2011 13:13:05 +0300
From: Alon Levy <alevy@redhat.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110504101305.GK2991@playa.tlv.redhat.com>
Mail-Followup-To: Stefan Weil <weil@mail.berlios.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
	<1304004042-8334-7-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304004042-8334-7-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 07/18] Fix typo in comment
 (consistant -> consistent)
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
X-List-Received-Date: Wed, 04 May 2011 10:13:18 -0000

On Thu, Apr 28, 2011 at 05:20:31PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---

ACK. I assumed since you emailed qemu-trivial that these don't actually
require any acks.

>  libcacard/vcard_emul_nss.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
> index baada52..f3db657 100644
> --- a/libcacard/vcard_emul_nss.c
> +++ b/libcacard/vcard_emul_nss.c
> @@ -971,7 +971,7 @@ find_blank(const char *str)
>  
>  /*
>   *  We really want to use some existing argument parsing library here. That
> - *  would give us a consistant look */
> + *  would give us a consistent look */
>  static VCardEmulOptions options;
>  #define READER_STEP 4
>  
> -- 
> 1.7.2.5
> 
> 

