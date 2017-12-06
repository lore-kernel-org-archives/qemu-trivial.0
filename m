Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eMhzU-0001v6-0j
	for mharc-qemu-trivial@gnu.org; Wed, 06 Dec 2017 17:16:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eMhzR-0001uL-26
	for qemu-trivial@nongnu.org; Wed, 06 Dec 2017 17:16:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eMhzP-0004y2-Vd
	for qemu-trivial@nongnu.org; Wed, 06 Dec 2017 17:16:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42344)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1eMhzH-0004o9-3z; Wed, 06 Dec 2017 17:16:19 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38282806A8;
	Wed,  6 Dec 2017 22:16:18 +0000 (UTC)
Received: from [10.18.17.231] (dhcp-17-231.bos.redhat.com [10.18.17.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4BB56A85A;
	Wed,  6 Dec 2017 22:16:17 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
References: <1512457825-3847-1-git-send-email-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <ee0ee3e4-f8d4-048f-b772-49d15ada4254@redhat.com>
Date: Wed, 6 Dec 2017 17:16:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512457825-3847-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 06 Dec 2017 22:16:18 +0000 (UTC)
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
X-List-Received-Date: Wed, 06 Dec 2017 22:16:31 -0000

I tweaked this again, sorry:

The names need to stay public, but the wrappers to manipulate the
objects can stay internal. Minor difference.

If that's okay, I'll just merge this in.
OK?

--js

diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index ce2e818c8c..8c755d4ca1 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -311,8 +311,6 @@ struct AHCIPCIState {
     AHCIState ahci;
 };

-#define TYPE_ICH9_AHCI "ich9-ahci"
-
 #define ICH_AHCI(obj) \
     OBJECT_CHECK(AHCIPCIState, (obj), TYPE_ICH9_AHCI)

@@ -375,10 +373,8 @@ void ahci_uninit(AHCIState *s);

 void ahci_reset(AHCIState *s);

-#define TYPE_SYSBUS_AHCI "sysbus-ahci"
 #define SYSBUS_AHCI(obj) OBJECT_CHECK(SysbusAHCIState, (obj),
TYPE_SYSBUS_AHCI)

-#define TYPE_ALLWINNER_AHCI "allwinner-ahci"
 #define ALLWINNER_AHCI(obj) OBJECT_CHECK(AllwinnerAHCIState, (obj), \
                        TYPE_ALLWINNER_AHCI)

diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index 5a06537e6b..b7bb2b02d6 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -54,14 +54,10 @@ typedef struct AHCIPCIState AHCIPCIState;

 #define TYPE_ICH9_AHCI "ich9-ahci"

-#define ICH_AHCI(obj) \
-    OBJECT_CHECK(AHCIPCIState, (obj), TYPE_ICH9_AHCI)
-
 int32_t ahci_get_num_ports(PCIDevice *dev);
 void ahci_ide_create_devs(PCIDevice *dev, DriveInfo **hd);

 #define TYPE_SYSBUS_AHCI "sysbus-ahci"
-#define SYSBUS_AHCI(obj) OBJECT_CHECK(SysbusAHCIState, (obj),
TYPE_SYSBUS_AHCI)

 typedef struct SysbusAHCIState {
     /*< private >*/
@@ -73,8 +69,6 @@ typedef struct SysbusAHCIState {
 } SysbusAHCIState;

 #define TYPE_ALLWINNER_AHCI "allwinner-ahci"
-#define ALLWINNER_AHCI(obj) OBJECT_CHECK(AllwinnerAHCIState, (obj), \
-                       TYPE_ALLWINNER_AHCI)

 #define ALLWINNER_AHCI_MMIO_OFF  0x80
 #define ALLWINNER_AHCI_MMIO_SIZE 0x80


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

