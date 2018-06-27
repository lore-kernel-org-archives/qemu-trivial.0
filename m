Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYBgY-0002sX-JA
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 10:44:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYBgW-0002qM-17
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:44:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYBgV-0000sL-9j
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:44:40 -0400
Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234]:41714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fYBgP-0000iD-M7; Wed, 27 Jun 2018 10:44:33 -0400
Received: by mail-ua0-x234.google.com with SMTP id z12-v6so1303724uac.8;
	Wed, 27 Jun 2018 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z7V2wXgwxrETGg1xnUctY/NHQEuSX71buowKHKtdCwA=;
	b=PCcLOhI6ADihDqMukmwE0sn4Yq2ujGyYqBsSS79sGcljJhbHtjqz6MeNL2QoRI1f07
	E/t2aA+7+Kfk9gRvWq2KSx+nExjoHE3Ig+3LTLVrq2IzLgiT0FXRtdQ2+ax6KmFzWGtV
	I6z2TRQb3LVB3DZ+IN3q5ku+zb1QiZITZZabEx8qogl7I2FpGNJoeUuomBC4n1e75pL3
	HNdG441AqQHn/hEYxOkOc5Tzp5iab6q+fwLLmrm+/uUZNjaYYejP4X5CsBU9GzR9M4TI
	7JBQBr5OJ44cYaGAR11l3Ty+4x/sZ4Lyg32wf2sTfzksaTmQsY1yiV64HPvZwGX96cvw
	IcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=z7V2wXgwxrETGg1xnUctY/NHQEuSX71buowKHKtdCwA=;
	b=CWEUadsQN63TNS5cGfFEigRH/2XsUp1pPfM0VqVvTOuSazbOoZKY2UJXLjpwJ03GEr
	/szqealJ2eL+oZDYDL8mMG2RNNbf8jRea9xAMPje3IhCJF9hnm07Skcc0zRZhMcnEY3X
	HX3Fwxz0wIN74WjDRvhB16NeZFGTHnLr98DiN7qsgRqvGPeXdinvym5fdDV74nTPpkgF
	jKSFvmvifT9AebNu1T7XPUSje7rBh6ZOHeNOxXQGp+/H42neBQ6kxt0bQap5DNli6+mO
	iTJW1swpfRWxjHLQrP1K3k+tahw3ltUr9GrdyzKidkaxyLt+PhFLJXj6D9LdT2vILlqL
	UfyQ==
X-Gm-Message-State: APt69E22eRwR1Xm82ljDapugbXMF7nmgFakCB1c3j4OdoqwoYYoO8eCR
	bep/UgxERSDNW4Am3Ck27bkdiXAP
X-Google-Smtp-Source: AAOMgpfpSJ17HVRHNkMREl2lrGzCZN/fD7FEJn1QI6/YxPSyHNpJzi7gWwTr5CW5GWmnpy1Zt+Fr4g==
X-Received: by 2002:a9f:23a1:: with SMTP id 30-v6mr3931530uao.42.1530110672799;
	Wed, 27 Jun 2018 07:44:32 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	b39-v6sm1069270uaa.47.2018.06.27.07.44.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jun 2018 07:44:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-36-f4bug@amsat.org>
	<3c5eef2f-115c-9c6d-2dba-0407fcebcdc4@linaro.org>
	<45330ee3-4dcf-3c9c-6781-2db11ff4e8c5@amsat.org>
	<c487ad94-5a1c-64da-5e26-61202e0e6d69@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <607204a2-26a2-ff6e-8df9-a91ad8ab1290@amsat.org>
Date: Wed, 27 Jun 2018 11:43:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <c487ad94-5a1c-64da-5e26-61202e0e6d69@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::234
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
X-List-Received-Date: Wed, 27 Jun 2018 14:44:41 -0000

On 06/27/2018 10:47 AM, Richard Henderson wrote:
> On 06/27/2018 06:03 AM, Philippe Mathieu-Daudé wrote:
>> On 06/27/2018 04:04 AM, Richard Henderson wrote:
>>> On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
>>>> -#define VSCARD_IN_SIZE 65536
>>>> +#define VSCARD_IN_SIZE      (64 * KiB)
>>>>  
>>>>  /* maximum size of ATR - from 7816-3 */
>>>>  #define MAX_ATR_SIZE        40
>>>> @@ -276,7 +277,7 @@ static void ccid_card_vscard_read(void *opaque, const uint8_t *buf, int size)
>>>>  
>>>>      if (card->vscard_in_pos + size > VSCARD_IN_SIZE) {
>>>>          error_report(
>>>> -            "no room for data: pos %d +  size %d > %d. dropping connection.",
>>>> +            "no room for data: pos %u +  size %d > %ld. dropping connection.",
>>>>              card->vscard_in_pos, size, VSCARD_IN_SIZE);
>>>
>>> Did you test this with i686 host?  %ld doesn't look right.
>>
>> Yes...
>>
>> $ uname -m
>> x86_64
>> $ make hw/usb/ccid-card-passthru.o
>>   CC      hw/usb/ccid-card-passthru.o
>> $
> 
> Ah, no, I mean 32-bit i686, not x86_64.

I built using the MXE MinGW32 toolchain, but since the libcacard is not
packaged for this target I didn't notice...

win32# make hw/usb/ccid-card-passthru.o
  CC      hw/usb/ccid-card-passthru.o
hw/usb/ccid-card-passthru.c:13:23: fatal error: libcacard.h: No such
file or directory
compilation terminated.

win32# apt install libcacard-dev
E: Unable to locate package libcacard-dev

I forgot to run 'make vm-build-ubuntu.i386' on this series.

