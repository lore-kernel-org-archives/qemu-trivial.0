Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihdUy-0007hC-HL
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2019 12:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihdUv-0007ed-5K
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 12:52:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihdUr-0001aE-LK
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 12:52:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28872
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihdUq-0001X4-3Y
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 12:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576691547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqg0Hqh1h6ScbTcwhh5SWMh3HUuJu7TKLUZYNxshdFk=;
 b=Dy/nyYMMF6TqTPyVZGu680cuFD39HB0nxQM04CVUyBtMR7GNX1VL7SLLcUH+OhG45TMHj9
 KPmdcvwJEeWBomeKlBSIItYaDziywrG4weeyOO06Vhw3BtVYq/XdZqHHFoFKTFAFnmz5fT
 0ACDesd0MyNXpNvy6r1iK6gyfM6Cgas=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-aSb59H-7NWeyhUPOgAayQw-1; Wed, 18 Dec 2019 12:52:24 -0500
Received: by mail-wr1-f69.google.com with SMTP id c17so332366wrp.10
 for <qemu-trivial@nongnu.org>; Wed, 18 Dec 2019 09:52:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X0c5BkxyPTbFBv2YtbtERUODj2FEvP0pkA9OscXlgoI=;
 b=nclkpJvrfgL1jloYzs/T/zJYCCvHaXZNcE2gjpRhMMXQ2y+vxKdNklvqh6CgKwJ2CZ
 tz2hBetf5jRAdsYz0SKj7d878UPECNTszr/aY/xap0BVmgKsVaxPu/cQWUJej0tDCwpm
 FyNQXaVM3Kt4ko0rMO4zxayTvAdRvLI2dPFd/13aZzXOKtKQ7pV3bk8ICoaaUcoJer7k
 79adlMLuLzBKzYyMNCvxl1qEEN+0NCxaY2i9DjNwV+l/UnFRYsC1JdrGxHP/IFpAaSgw
 Ozhetse6n8xE/YDoqgiNMfOhck21mKrhRrFjn9I0kFUgYPWTnKa36Zioa2g9JTX8TXQ5
 wdIQ==
X-Gm-Message-State: APjAAAUx8QvNrOmJpj6ft3JavesAU/93oTWISwrktrZBcXFaIANBVYDO
 FcBkL44CIrVm5mqyEh6NjxhKpOej9bcB00jeJAvlWKy3b0gIFVKz3KJvNAJp17ndRv3KJ9NbqTu
 t5QzmLMi9U4tpdoTKXw==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr4046217wrr.309.1576691542865; 
 Wed, 18 Dec 2019 09:52:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZ+auCFqkdFehZbjyhHOVhI4hmNTdDc8guXDzGXH19VY7mXGxd2Hr1yAgs9b08yxgkvnU9ww==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr4046194wrr.309.1576691542645; 
 Wed, 18 Dec 2019 09:52:22 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id v22sm3070737wml.11.2019.12.18.09.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 09:52:22 -0800 (PST)
Subject: Re: [PATCH 5/6] hw/scsi/megasas: Silent GCC9 duplicated-cond warning
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-6-philmd@redhat.com>
 <b29f856a-5199-6f62-4aee-5a2cfc9f05a3@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <71c58178-6bd5-bbb9-5691-77bdae7d2788@redhat.com>
Date: Wed, 18 Dec 2019 18:52:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b29f856a-5199-6f62-4aee-5a2cfc9f05a3@linaro.org>
Content-Language: en-US
X-MC-Unique: aSb59H-7NWeyhUPOgAayQw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2019 17:52:35 -0000

On 12/18/19 5:03 AM, Richard Henderson wrote:
> On 12/17/19 7:34 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> GCC9 is confused when building with CFLAG -O3:
>>
>>    hw/scsi/megasas.c: In function =E2=80=98megasas_scsi_realize=E2=80=99=
:
>>    hw/scsi/megasas.c:2387:26: error: duplicated =E2=80=98if=E2=80=99 con=
dition [-Werror=3Dduplicated-cond]
>>     2387 |     } else if (s->fw_sge >=3D 128 - MFI_PASS_FRAME_SIZE) {
>>    hw/scsi/megasas.c:2385:19: note: previously used here
>>     2385 |     if (s->fw_sge >=3D MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE)=
 {
>>    cc1: all warnings being treated as errors
>>
>> When this device was introduced in commit e8f943c3bcc, the author
>> cared about modularity, using a definition for the firmware limit.
>> If we modify the limit, the code is valid. Add a check if the
>> definition got modified to a bigger limit.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> Cc: Hannes Reinecke <hare@suse.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Fam Zheng <fam@euphon.net>
>> Cc: qemu-block@nongnu.org
>> ---
>>   hw/scsi/megasas.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
>> index de9bd20887..ece1601b66 100644
>> --- a/hw/scsi/megasas.c
>> +++ b/hw/scsi/megasas.c
>> @@ -2382,7 +2382,8 @@ static void megasas_scsi_realize(PCIDevice *dev, E=
rror **errp)
>>       if (!s->hba_serial) {
>>           s->hba_serial =3D g_strdup(MEGASAS_HBA_SERIAL);
>>       }
>> -    if (s->fw_sge >=3D MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
>> +    if (MEGASAS_MAX_SGE > 128
>> +        && s->fw_sge >=3D MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
>>           s->fw_sge =3D MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE;
>>       } else if (s->fw_sge >=3D 128 - MFI_PASS_FRAME_SIZE) {
>>           s->fw_sge =3D 128 - MFI_PASS_FRAME_SIZE;
>>
>=20
> I'm not keen on this.  It looks to me like the raw 128 case should be rem=
oved
> -- surely that's the point of the symbolic constant.  But I'll defer if a
> maintainer disagrees.

Is that approach acceptable?

-- >8 --
@@ -54,6 +54,9 @@
  #define MEGASAS_FLAG_USE_QUEUE64   1
  #define MEGASAS_MASK_USE_QUEUE64   (1 << MEGASAS_FLAG_USE_QUEUE64)

+QEMU_BUILD_BUG_MSG(MEGASAS_MAX_SGE > 128,
+                   "Firmware limit too big for this device model");
+
  static const char *mfi_frame_desc[] =3D {
      "MFI init", "LD Read", "LD Write", "LD SCSI", "PD SCSI",
      "MFI Doorbell", "MFI Abort", "MFI SMP", "MFI Stop"};
@@ -2382,9 +2385,7 @@ static void megasas_scsi_realize(PCIDevice *dev,=20
Error **errp)
      if (!s->hba_serial) {
          s->hba_serial =3D g_strdup(MEGASAS_HBA_SERIAL);
      }
-    if (s->fw_sge >=3D MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE) {
-        s->fw_sge =3D MEGASAS_MAX_SGE - MFI_PASS_FRAME_SIZE;
-    } else if (s->fw_sge >=3D 128 - MFI_PASS_FRAME_SIZE) {
+    if (s->fw_sge >=3D 128 - MFI_PASS_FRAME_SIZE) {
          s->fw_sge =3D 128 - MFI_PASS_FRAME_SIZE;
      } else {
          s->fw_sge =3D 64 - MFI_PASS_FRAME_SIZE;
---


