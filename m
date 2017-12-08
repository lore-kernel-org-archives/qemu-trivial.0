Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eNOwS-0004CH-6H
	for mharc-qemu-trivial@gnu.org; Fri, 08 Dec 2017 15:08:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eNOwN-00049J-P0
	for qemu-trivial@nongnu.org; Fri, 08 Dec 2017 15:08:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eNOwM-0002Uo-MK
	for qemu-trivial@nongnu.org; Fri, 08 Dec 2017 15:08:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1eNOwE-0002Mn-PK; Fri, 08 Dec 2017 15:08:02 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A72CD1546B;
	Fri,  8 Dec 2017 20:08:01 +0000 (UTC)
Received: from [10.18.17.231] (dhcp-17-231.bos.redhat.com [10.18.17.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 449E918B1B;
	Fri,  8 Dec 2017 20:07:59 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
References: <1512457825-3847-1-git-send-email-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <fb9ed70a-af7b-78eb-be57-5781cb44d1b8@redhat.com>
Date: Fri, 8 Dec 2017 15:07:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512457825-3847-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 08 Dec 2017 20:08:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/ide: Remove
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
X-List-Received-Date: Fri, 08 Dec 2017 20:08:15 -0000



On 12/05/2017 02:10 AM, Thomas Huth wrote:
> The same definitions can also be found in include/hw/ide/ahci.h
> so let's remove these #defines from ahci_internal.h.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Also remove TYPE_ICH9_AHCI as suggested by John
> 
>  hw/ide/ahci_internal.h | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
> index ce2e818..e3e3ed2 100644
> --- a/hw/ide/ahci_internal.h
> +++ b/hw/ide/ahci_internal.h
> @@ -311,11 +311,6 @@ struct AHCIPCIState {
>      AHCIState ahci;
>  };
>  
> -#define TYPE_ICH9_AHCI "ich9-ahci"
> -
> -#define ICH_AHCI(obj) \
> -    OBJECT_CHECK(AHCIPCIState, (obj), TYPE_ICH9_AHCI)
> -
>  extern const VMStateDescription vmstate_ahci;
>  
>  #define VMSTATE_AHCI(_field, _state) {                               \
> @@ -375,11 +370,4 @@ void ahci_uninit(AHCIState *s);
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

With edits:

Thanks, applied to my IDE tree:

https://github.com/jnsnow/qemu/commits/ide
https://github.com/jnsnow/qemu.git

--js

(PR will be sent when 2.12 opens; there's time to fiddle with it.)

