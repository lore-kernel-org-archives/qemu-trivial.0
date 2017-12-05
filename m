Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eM22q-0005dJ-K7
	for mharc-qemu-trivial@gnu.org; Mon, 04 Dec 2017 20:29:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eM22m-0005bP-LQ
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 20:29:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eM22l-0008Ke-TA
	for qemu-trivial@nongnu.org; Mon, 04 Dec 2017 20:29:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45728)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1eM22i-0008Iu-8g; Mon, 04 Dec 2017 20:29:04 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2050B5D686;
	Tue,  5 Dec 2017 01:29:03 +0000 (UTC)
Received: from [10.18.17.231] (dhcp-17-231.bos.redhat.com [10.18.17.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A5C16025B;
	Tue,  5 Dec 2017 01:29:02 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
References: <1512069154-16814-1-git-send-email-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <0f19f53c-cab9-f7d1-e411-04e38e21fba1@redhat.com>
Date: Mon, 4 Dec 2017 20:29:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512069154-16814-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 05 Dec 2017 01:29:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.12] hw/ide: Remove
 duplicated definitions from ahci_internal.h
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
X-List-Received-Date: Tue, 05 Dec 2017 01:29:09 -0000



On 11/30/2017 02:12 PM, Thomas Huth wrote:
> The same definitions can also be found in include/hw/ide/ahci.h
> so let's remove these #defines from ahci_internal.h.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/ide/ahci_internal.h | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
> index ce2e818..1080a34 100644
> --- a/hw/ide/ahci_internal.h
> +++ b/hw/ide/ahci_internal.h
> @@ -375,11 +375,4 @@ void ahci_uninit(AHCIState *s);
>  
>  void ahci_reset(AHCIState *s);
>  
> -#define TYPE_SYSBUS_AHCI "sysbus-ahci"
> -#define SYSBUS_AHCI(obj) OBJECT_CHECK(SysbusAHCIState, (obj), TYPE_SYSBUS_AHCI)
> -
> -#define TYPE_ALLWINNER_AHCI "allwinner-ahci"
> -#define ALLWINNER_AHCI(obj) OBJECT_CHECK(AllwinnerAHCIState, (obj), \
> -                       TYPE_ALLWINNER_AHCI)
> -
>  #endif /* HW_IDE_AHCI_H */
> 

Whoops, looks like I got a little carried away with my split and didn't
quite finish the job :(

Sadly, TYPE_ICH9_AHCI is also duplicated ... and used outside of the
core layer. Would you like to do v2 or shall I?

