Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1da1sv-0002JJ-PA
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 11:36:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1da1sr-0002HB-Ag
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:36:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1da1sm-0000hL-Bp
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:36:29 -0400
Received: from mail-wm0-f51.google.com ([74.125.82.51]:37206)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1da1sm-0000gW-60
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:36:24 -0400
Received: by mail-wm0-f51.google.com with SMTP id c184so59699770wmd.0
	for <qemu-trivial@nongnu.org>; Tue, 25 Jul 2017 08:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EAKnDSZBt9id2ql1XJUxJIaOnhU3sHcJUJKrgl5sP/A=;
	b=JKt/7qy6vqRyNV1b5sihOmUBaJZLfOpcOooL/g830zpZoGZCvZZWHxQRzloGTTLYdY
	aorACaM7ICJlIIPOvt5KcsfGvmsS3bDAboLKSR4nzIAmEeZKd++uMY3RlethVzIcEuQl
	TXilgEzgmjVb8Dmd0RMEh5IOp8kT6xuV7p2ePmVZuSmj64a3G5QLehf6TWrHn2Jo7UFy
	ID64do6nGVWUxRD6CHRryvryhQAYlPR/Y+FQobeTt6hupF4Qc9o+54De9PpIO9Th9djQ
	EFn2OBcx4R0DMBGn+eG4Jv653Yu04C4qF9OLmWvACWX7N8w56oFlMlNztTdznWfo3SaA
	Vo/w==
X-Gm-Message-State: AIVw110ED2YH/F+oiAT3dZhYDMx9/ZVV78fG6KD8CJBFux6CvW9ru6fy
	C09Qx3tAS6RwbYkz
X-Received: by 10.28.34.130 with SMTP id i124mr8571164wmi.135.1500996981259;
	Tue, 25 Jul 2017 08:36:21 -0700 (PDT)
Received: from [192.168.10.165] (94-39-195-172.adsl-ull.clienti.tiscali.it.
	[94.39.195.172]) by smtp.gmail.com with ESMTPSA id
	c34sm23848730wra.80.2017.07.25.08.36.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 08:36:20 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-7-f4bug@amsat.org>
	<35e2489f-9cd6-ae5e-39b6-297b6cf5d2ea@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f59b38db-f2a4-cb13-73a3-8167be3df217@redhat.com>
Date: Tue, 25 Jul 2017 17:36:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <35e2489f-9cd6-ae5e-39b6-297b6cf5d2ea@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.51
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 06/35] qcow2:
 remove inconsistent check
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
X-List-Received-Date: Tue, 25 Jul 2017 15:36:32 -0000

On 24/07/2017 20:42, Eric Blake wrote:
> On 07/24/2017 01:27 PM, Philippe Mathieu-Daudé wrote:
>> This is equivalent to assert(russian roulette) so better remove it.
>>
>> block/qcow2-bitmap.c:259:29: warning: The left operand of '==' is a garbage value
>>         assert(bitmap_table == NULL);
>>                ~~~~~~~~~~~~ ^
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  block/qcow2-bitmap.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
>> index 3e8735a20d..fe72df5057 100644
>> --- a/block/qcow2-bitmap.c
>> +++ b/block/qcow2-bitmap.c
>> @@ -254,7 +254,6 @@ static int free_bitmap_clusters(BlockDriverState *bs, Qcow2BitmapTable *tb)
>>  
>>      ret = bitmap_table_load(bs, tb, &bitmap_table);
>>      if (ret < 0) {
>> -        assert(bitmap_table == NULL);
> 
> Rather, we should fix bitmap_table_load() to ensure that bitmap_table is
> always assigned, even on error.

I think it's even better to initialize bitmap_table to NULL in
free_bitmap_clusters, as all other callers do.

Paolo


