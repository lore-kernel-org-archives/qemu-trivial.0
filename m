Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XRKSS-0003qI-Jq
	for mharc-qemu-trivial@gnu.org; Tue, 09 Sep 2014 08:23:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XRKSL-0003jH-I2
	for qemu-trivial@nongnu.org; Tue, 09 Sep 2014 08:23:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XRKSH-000823-30
	for qemu-trivial@nongnu.org; Tue, 09 Sep 2014 08:23:33 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:4105)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XRKSG-00080G-Ci; Tue, 09 Sep 2014 08:23:29 -0400
Received: from 172.24.2.119 (EHLO szxeml409-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BZF60423; Tue, 09 Sep 2014 20:23:23 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml409-hub.china.huawei.com
	(10.82.67.136) with Microsoft SMTP Server id 14.3.158.1; Tue, 9 Sep 2014
	20:23:18 +0800
Message-ID: <540EF130.4090902@huawei.com>
Date: Tue, 9 Sep 2014 20:23:12 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1410233038-15928-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<CAFEAcA_+MeAyajE=LpvAd3nvSgomucOsEYiipxPNEnGiDzN8Ug@mail.gmail.com>
In-Reply-To: <CAFEAcA_+MeAyajE=LpvAd3nvSgomucOsEYiipxPNEnGiDzN8Ug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix typos and misspellings
	in comments
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
X-List-Received-Date: Tue, 09 Sep 2014 12:23:39 -0000

On 2014/9/9 16:09, Peter Maydell wrote:
> On 9 September 2014 04:23, zhanghailiang<zhang.zhanghailiang@huawei.com>  wrote:
>> Found by codespell:
>>
>> occured ->  occurred
>> formated ->  formatted
>> Comander ->  Commander
>> gaurantee ->  guarantee
>>
>> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
>> ---
>>   hw/ppc/spapr.c                           | 2 +-
>>   hw/usb/quirks.h                          | 2 +-
>>   libcacard/vcard_emul_nss.c               | 2 +-
>>   linux-headers/asm-powerpc/epapr_hcalls.h | 4 ++--
>
> You can't change linux-headers files except by importing them from
> the kernel, I'm afraid. You'd need to submit that change as a patch
> to the kernel and then wait for it to be committed there and then
> we can re-sync our copies of the kernel's headers.
>

OK, i will remove this change from this patch, and send a patch to kernel:)

>>   4 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 2ab4460..bedef2f 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -541,7 +541,7 @@ static void *spapr_create_fdt_skel(hwaddr initrd_base,
>>       _FDT((fdt_property_cell(fdt, "rtas-error-log-max", RTAS_ERROR_LOG_MAX)));
>>
>>       /*
>> -     * According to PAPR, rtas ibm,os-term, does not gaurantee a return
>> +     * According to PAPR, rtas ibm,os-term, does not guarantee a return
>>        * back to the guest cpu.
>>        *
>>        * While an additional ibm,extended-os-term property indicates that
>
> OK
>
>> diff --git a/hw/usb/quirks.h b/hw/usb/quirks.h
>> index 8dc6065..2d5d98d 100644
>> --- a/hw/usb/quirks.h
>> +++ b/hw/usb/quirks.h
>> @@ -90,7 +90,7 @@ static const struct usb_device_id usbredir_raw_serial_ids[] = {
>>       { USB_DEVICE(0x10C4, 0x81E8) }, /* Zephyr Bioharness */
>>       { USB_DEVICE(0x10C4, 0x81F2) }, /* C1007 HF band RFID controller */
>>       { USB_DEVICE(0x10C4, 0x8218) }, /* Lipowsky Industrie Elektronik GmbH, HARP-1 */
>> -    { USB_DEVICE(0x10C4, 0x822B) }, /* Modem EDGE(GSM) Comander 2 */
>> +    { USB_DEVICE(0x10C4, 0x822B) }, /* Modem EDGE(GSM) Commander 2 */
>
> Google suggests this spelling for this device name is correct:
> http://www.agito.pl/iplus-usb-comander-2-edge-plus-1-37295.html
> (Polish product?)
>

Interesting;), i will drop this change also.

>>       { USB_DEVICE(0x10C4, 0x826B) }, /* Cygnal Integrated Products, Inc., Fasttrax GPS demonstration module */
>>       { USB_DEVICE(0x10C4, 0x8293) }, /* Telegesis ETRX2USB */
>>       { USB_DEVICE(0x10C4, 0x82F9) }, /* Procyon AVS */
>> diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
>> index f1bba57..ad9530c 100644
>> --- a/libcacard/vcard_emul_nss.c
>> +++ b/libcacard/vcard_emul_nss.c
>> @@ -286,7 +286,7 @@ vcard_emul_rsa_op(VCard *card, VCardKey *key,
>>               }
>>           }
>>           if ((i<  buffer_size)&&  (buffer[i] == 0)) {
>> -            /* yes, we have a properly formated PKCS #1 signature */
>> +            /* yes, we have a properly formatted PKCS #1 signature */
>
> OK
>
>>               /*
>>                * NOTE: even if we accidentally got an encrypt buffer, which
>>                * through shear luck started with 00, 01, ff, 00, it won't matter
>
> Another typo here: s/shear/sheer/.
>

OK!

>> diff --git a/linux-headers/asm-powerpc/epapr_hcalls.h b/linux-headers/asm-powerpc/epapr_hcalls.h
>> index 06f7247..33b3f89 100644
>> --- a/linux-headers/asm-powerpc/epapr_hcalls.h
>> +++ b/linux-headers/asm-powerpc/epapr_hcalls.h
>> @@ -78,7 +78,7 @@
>>   #define EV_SUCCESS             0
>>   #define EV_EPERM               1       /* Operation not permitted */
>>   #define EV_ENOENT              2       /*  Entry Not Found */
>> -#define EV_EIO                 3       /* I/O error occured */
>> +#define EV_EIO                 3       /* I/O error occurred */
>>   #define EV_EAGAIN              4       /* The operation had insufficient
>>                                           * resources to complete and should be
>>                                           * retried
>> @@ -89,7 +89,7 @@
>>   #define EV_ENODEV              7       /* No such device */
>>   #define EV_EINVAL              8       /* An argument supplied to the hcall
>>                                             was out of range or invalid */
>> -#define EV_INTERNAL            9       /* An internal error occured */
>> +#define EV_INTERNAL            9       /* An internal error occurred */
>>   #define EV_CONFIG              10      /* A configuration error was detected */
>>   #define EV_INVALID_STATE       11      /* The object is in an invalid state */
>>   #define EV_UNIMPLEMENTED       12      /* Unimplemented hypercall */
>
> These fixes should go via the kernel.

OK, Thanks.



