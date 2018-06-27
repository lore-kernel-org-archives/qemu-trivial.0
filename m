Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYA72-0007U9-Ej
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 09:03:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYA6x-0007Pj-0x
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 09:03:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYA6s-0000wb-LB
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 09:03:51 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:43560)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYA6i-0000om-8n; Wed, 27 Jun 2018 09:03:36 -0400
Received: by mail-qk0-x243.google.com with SMTP id z74-v6so941223qkb.10;
	Wed, 27 Jun 2018 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7fcwH0WFf9iN3laEKt7Kss63v0E+2kou3OJCCvXf32Q=;
	b=g0ZK8qEDJdk9KQK/gqEvBtbrQYbQ3EL4Bdl8Zt2l3EV5udlascq8eNM2eMI7Napwyc
	R4jtR+wBFIq9pt0QJob4EcQLFthQdvwuz2oI3cKbxvRo2i90ccJLXlq7Hcj7AkUXVTXZ
	oKqGmaVObd0DeIJT3mAlVZ84yKd0oYEBOhiq3nDW7D4X6MsbaECUM/Bj3cYey3+hcBw7
	Hn8RcI+DxQl8qMzpMU0X0KM3ALloWeGmH8xjQ3cUVSii8/Wpei5t/iQtMTa++yHjj/vD
	fQnzm0zJkIYBOa9KTIjSF6eteT4lGkL2yxejUIkzcJuQDknCBTHIEYMMnhLh8H9x6gZS
	dxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=7fcwH0WFf9iN3laEKt7Kss63v0E+2kou3OJCCvXf32Q=;
	b=uAnjWzmDXCA02/OhQO7RwmQoIh4Ylzj+QIxOFVoJo++z4jAtY5pHC+fE2aJRPcbek1
	2Zkylq02nEmJaX8z3RNaIAPY/4a9ZLS7jYRVG7G9VbUac1LAxTjuGrhp2ytJResXoB4p
	0rSbdQwo/UjYNybVSsOVmF0l9b4WnDjYXLHXLX/HUdBQUTMuAUSgJUxAGJGlAmGVdYqs
	MSahG5my/f89pJ0yBLjILKCZj1VKmN3p0/2mo4D1dpIJoCah+Ttwh5K2vtMQpg41EgLI
	bjidh5pos8oszh9zhxPyWruH9weBPH5FywMc5ixIsoWqYozh2B9hptyZJbiaOa+hwRn4
	gmag==
X-Gm-Message-State: APt69E1y00iVicdHFrKAe5nMaChl8N4UijhnC1w1X/gd9WEeVDw9vkpR
	56W0+u73ZG9bch/YOJAMKy10b2N3
X-Google-Smtp-Source: AAOMgpcVo+/wV3Zu53DZnbOuJgHmDNAKNHti3YoN57ihzQgUDZ9oYWC0scVNC4S5BOicVprkBvBCCA==
X-Received: by 2002:a37:4ac4:: with SMTP id
	x187-v6mr5021141qka.156.1530104615341; 
	Wed, 27 Jun 2018 06:03:35 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	u41-v6sm3182093qte.93.2018.06.27.06.03.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jun 2018 06:03:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-36-f4bug@amsat.org>
	<3c5eef2f-115c-9c6d-2dba-0407fcebcdc4@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <45330ee3-4dcf-3c9c-6781-2db11ff4e8c5@amsat.org>
Date: Wed, 27 Jun 2018 10:03:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <3c5eef2f-115c-9c6d-2dba-0407fcebcdc4@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 35/46] hw/usb: Use the
 IEC binary prefix definitions
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
X-List-Received-Date: Wed, 27 Jun 2018 13:03:55 -0000

On 06/27/2018 04:04 AM, Richard Henderson wrote:
> On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
>> -#define VSCARD_IN_SIZE 65536
>> +#define VSCARD_IN_SIZE      (64 * KiB)
>>  
>>  /* maximum size of ATR - from 7816-3 */
>>  #define MAX_ATR_SIZE        40
>> @@ -276,7 +277,7 @@ static void ccid_card_vscard_read(void *opaque, const uint8_t *buf, int size)
>>  
>>      if (card->vscard_in_pos + size > VSCARD_IN_SIZE) {
>>          error_report(
>> -            "no room for data: pos %d +  size %d > %d. dropping connection.",
>> +            "no room for data: pos %u +  size %d > %ld. dropping connection.",
>>              card->vscard_in_pos, size, VSCARD_IN_SIZE);
> 
> Did you test this with i686 host?  %ld doesn't look right.

Yes...

$ uname -m
x86_64
$ make hw/usb/ccid-card-passthru.o
  CC      hw/usb/ccid-card-passthru.o
$

If there are no other changes asked on this series, the maintainer
taking this can update to use PRId64 with:

-- >8 --
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -276,9 +276,9 @@ static void ccid_card_vscard_read(void *opaque,
const uint8_t *buf, int size)
     VSCMsgHeader *hdr;

     if (card->vscard_in_pos + size > VSCARD_IN_SIZE) {
-        error_report(
-            "no room for data: pos %u +  size %d > %ld. dropping
connection.",
-            card->vscard_in_pos, size, VSCARD_IN_SIZE);
+        error_report("no room for data: pos %u +  size %d > %" PRId64 "."
+                     " dropping connection.",
+                     card->vscard_in_pos, size, VSCARD_IN_SIZE);
         ccid_card_vscard_drop_connection(card);
         return;
     }
--

Or I can send as a cleanup patch once the series get merged.

Thanks for your review!

Phil.

