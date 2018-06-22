Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWSU7-0005D4-C3
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 16:16:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSU5-0005Be-6w
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 16:16:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSU4-0005j0-BZ
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 16:16:41 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33224)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSTz-0005gg-Vg; Fri, 22 Jun 2018 16:16:36 -0400
Received: by mail-qt0-x243.google.com with SMTP id l10-v6so7071364qtj.0;
	Fri, 22 Jun 2018 13:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XN/MPsGmDKtKO+OHwPvyw+JxQakgAoSeV1Qo6hKMB7Q=;
	b=nYrRFhkN9fYbX6L5gJqxYvr7cG3YtZvIzLNQc0jDNM0IVEPBczu+tlT6zkP2Aj3cbl
	Wbs241MG85R1Jvgk7ziELD3Moe8hxSX0kcuJJeO4zpViit7H7HoVzwZ4oMMtLKv/KQ9q
	dN+uLqU1ggmzutzfa0qaFX9y3tCzea0BPs/PsZTu5OkR2KDSLUOHQhXH0ZawhTiwfbcu
	FkJ8KNeji325QooQS5qagFELQjS87zANvOR3vfDqbEUWq6XH0d37/rn2fbUQzyYoVU3I
	OfiJBVD/KMJfOKy8iF9aE/Hgix7OD7/FnLr5XkCLkRVB/B5Hz+n5iGOPxoUN1fkSuHGV
	ZbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=XN/MPsGmDKtKO+OHwPvyw+JxQakgAoSeV1Qo6hKMB7Q=;
	b=VKiU/uQiLbpSSh7bjgBbW89mHLzW3poy/bCxoW5JrAMqbJxq526FE7w6hX3zms+ZIO
	Rgp9WHSESKXEHKBMXTlF+MvtgB6kneXOzL8aJfFAcrAGFkyClW2A6NEKQqPUXxQWsd1V
	OTP/xkAWc/s8LDv668TjFtS7LXCvk8QiF1H5bYpCbOy2N7Idjsdlpo9gJzez6n96//j+
	7t6s3erFF59JL7CQM/BYAEXFqY/E84+N72ePmeTb81ZZoYBKHojmaAGNZW+frFgiDXJL
	Iet1jjjpeiUZsOA2SfGqNp+Tjp8Sv5YXoNOMNnlGdwSL3R1e9OvsIfR1TitOETwUDzZn
	E51w==
X-Gm-Message-State: APt69E2mlINjpDp8w05fJ01E7vMKVVDvTP2eU7Slv/K9tTDz5UCMkvhm
	b5RdX5y6q/2rf5qPXNUd8JDZN2Nx
X-Google-Smtp-Source: AAOMgpc+NVbWERuwKoeUBMGSvZF7rFN7b4wxA349Xp8uP0W+7Vh+i+qVHM463NzkJzWDL55dCrjqfw==
X-Received: by 2002:a0c:f8c2:: with SMTP id
	h2-v6mr2823760qvo.163.1529698595421; 
	Fri, 22 Jun 2018 13:16:35 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	e97-v6sm5494692qtb.78.2018.06.22.13.16.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 13:16:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
References: <20180622134036.23182-1-f4bug@amsat.org>
	<20180622134036.23182-15-f4bug@amsat.org>
	<9e5b3eee-1335-9eae-709a-3f8d05729c03@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <49794564-eb8b-476e-6373-e70f814220ee@amsat.org>
Date: Fri, 22 Jun 2018 17:16:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <9e5b3eee-1335-9eae-709a-3f8d05729c03@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [PATCH v2 14/14] hw/arm/stellaris: Fix
 gptm_write() error message
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
X-List-Received-Date: Fri, 22 Jun 2018 20:16:42 -0000

On 06/22/2018 04:55 PM, Thomas Huth wrote:
> On 22.06.2018 15:40, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/arm/stellaris.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
>> index d06e366402..42baa768b2 100644
>> --- a/hw/arm/stellaris.c
>> +++ b/hw/arm/stellaris.c
>> @@ -294,7 +294,7 @@ static void gptm_write(void *opaque, hwaddr offset,
>>          break;
>>      default:
>>          qemu_log_mask(LOG_GUEST_ERROR,
>> -                      "GPTM: read at bad offset 0x%x\n", (int)offset);
>> +                      "GPTM: write at bad offset 0x%x\n", (int)offset);
> 
> While you're at it, remove the cast and use HWADDR_PRIx ?

Sure.

Thanks for your review!

