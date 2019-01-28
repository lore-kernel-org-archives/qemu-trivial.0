Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1go4nu-0006Sy-Vw
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2019 06:10:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1go4ns-0006QX-Du
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 06:10:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1go4nr-0005he-Kj
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 06:10:12 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1go4nq-0005h8-Pr
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 06:10:10 -0500
Received: by mail-wr1-f66.google.com with SMTP id p4so17550058wrt.7
	for <qemu-trivial@nongnu.org>; Mon, 28 Jan 2019 03:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=l4tenfaYhnUwlU6ZJ4c8+GdhStTt3X1eRvpanqxT3hg=;
	b=UoUUJAfHp+CILU6or1gk+k6wI8qpc+3seg1epeVESkZxgAOCxLRAtO43A2PRisTVMQ
	yaJt81ALXGE82+SLMwrFSw8Tg+5zkhd2RGJIo2nMIvLzS2Zsmb0aLIeQFGWNzj5D1wEP
	plo4d5WWqedS14zV0mOONqL5v33PI4bUsvmRIX5tSj0MCICh97SM+0tCHbc7QTJ1VYFD
	6IDevQAF7/WOyV9JiU/FivZq5UaxAbWf9M17G1l4p2UxmL2A0MHPQ5vAOB0AIe7zGb24
	tmLvpJXnf1pGdVFNe/y0JpBwgQ52elEHfcE7gyk43vBekgChXGaktyvU0wJd57Ofmznw
	NbzQ==
X-Gm-Message-State: AJcUukfxUpS+gQqmXz9zJuf8e5StTWEYbzxqDwPfHeLlX61z05+xC/9I
	WOysoQF9iS67gIm6DjPfbtI4JQ==
X-Google-Smtp-Source: ALg8bN48aM+fK44aljOlVoykt1EZ1MC9zVFXAqcmPqLrkRXXkdXl7sTGpMwS2+pIgri2CZIoGmK8yw==
X-Received: by 2002:adf:93e2:: with SMTP id 89mr22052193wrp.129.1548673809372; 
	Mon, 28 Jan 2019 03:10:09 -0800 (PST)
Received: from [192.168.1.40] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	o8sm109679915wrx.15.2019.01.28.03.10.08
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 03:10:08 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, kumar sourav <sourav.jb1988@gmail.com>,
	qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20190127101836.15451-1-sourav.jb1988@gmail.com>
	<33a499ed-6f6a-ccd2-a1f8-48646b6be6c9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <05c9ef91-39d7-0579-b007-443748559007@redhat.com>
Date: Mon, 28 Jan 2019 12:10:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <33a499ed-6f6a-ccd2-a1f8-48646b6be6c9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/input/lm832x: set device
 category of lm832x
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
X-List-Received-Date: Mon, 28 Jan 2019 11:10:13 -0000

Hi Thomas,

On 1/28/19 9:37 AM, Thomas Huth wrote:
>  Hi,
> 
> On 2019-01-27 11:18, kumar sourav wrote:
>> Sets the category of lm832x as DEVICE_CATEGORY_INPUT
>> Devices should be assigned to one of DEVICE_CATEGORY_XXXX
>>
>> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
>> ---
>>  hw/input/lm832x.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
>> index cffbf586d4..07ae5e0aee 100644
>> --- a/hw/input/lm832x.c
>> +++ b/hw/input/lm832x.c
>> @@ -509,6 +509,7 @@ static void lm8323_class_init(ObjectClass *klass, void *data)
>>      k->recv = lm_i2c_rx;
>>      k->send = lm_i2c_tx;
>>      dc->vmsd = &vmstate_lm_kbd;
>> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>>  }
> 
> This device already has DEVICE_CATEGORY_MISC set since it is derived
> from TYPE_I2C_SLAVE. If you now set another category bit here, the
> device shows up twice in the output of "-device help". That's not so nice.
> 
> I see multiple options here:
> 
> 1) Drop this patch since the device already has a category
> 
> 2) Make sure to clear_bit() the MISC category here again
> 
> 3) Remove the set_bit(DEVICE_CATEGORY_MISC, k->categories) in
>    hw/i2c/core.c - it does not make that much sense to set the
>    MISC category for an abstract parent class.
> 
> 4) Introduce a new DEVICE_CATEGORY_I2C which could be used
>    instead of the DEVICE_CATEGORY_MISC in hw/i2c/core.c
> 
> One of the last two options sound most appealing to me.

Can we go with 0/3/4 together? 0 being this patch:

  0) This devices inherited DEVICE_CATEGORY_I2C from his
     abstract parent, also select the DEVICE_CATEGORY_INPUT
     bit.

