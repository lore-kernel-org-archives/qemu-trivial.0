Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eg3Be-0000BX-3y
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jan 2018 01:45:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1eg3Bc-0000Av-Ix
	for qemu-trivial@nongnu.org; Mon, 29 Jan 2018 01:45:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1eg3BZ-0008Eh-GB
	for qemu-trivial@nongnu.org; Mon, 29 Jan 2018 01:45:00 -0500
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244]:45465)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1eg3BZ-0008EP-9A
	for qemu-trivial@nongnu.org; Mon, 29 Jan 2018 01:44:57 -0500
Received: by mail-io0-x244.google.com with SMTP id p188so6446803ioe.12
	for <qemu-trivial@nongnu.org>; Sun, 28 Jan 2018 22:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wyjTSA3aEzDISjEp34a18pmn8ixmEKSuM95Dp2qEw+A=;
	b=fFr0tzuO55fXoD8L0XC7qSa24QWpiXFwnzsQd0E1h94H/S3tEbRzniUjzF7wEW4ljN
	q4SJSOvuceWqDnfn6P9cOsq7ways1dYRG3+3hg2y0PrSdhfkz3O1eUE1KyIr3gXXV9cR
	dfMTRJ6MF7ZGWGXwZOJa38WMiL23iF1gG+ZVWcGYpfe11HLdnMD8qUzQOHZSi3mYUs7h
	/i0s+WmMURG3Owzmr7vp9W9aKScybCe1q8tTL9feENVJoxT/bdYhMlvqJ7WN7sUn/8pC
	y60MgrYq6u29SbccficY96tvqVSljS79EFs80BPoOhr4OpYiDL3s/fnzbkmpj80qZ8OA
	YMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wyjTSA3aEzDISjEp34a18pmn8ixmEKSuM95Dp2qEw+A=;
	b=oiqB1FWGqOdndlfkzy40aDD42BTFJzkfcZySx7KEmJMXamRsZkQ3PdejAzWteFLbkE
	WyftNzup9ojylOAQEeCOkXVZ22iC50IlHMuAesO0dtQ/I1IaG4QmHy/i2bRZWJzqXuiG
	DxhbIRrBKIOTMyCO8BKu53wJzvuwQCfszae7zzwRoMzHRrI0wln2hWlfw76QC1iFvIvF
	WnTGrdroA3iEA7LQfD3/nu+wujU06eTSmH4XI4Av2jYGy7Rlw3diIa6cgKxncYHb2glJ
	X9OhOT6YnfAmbdNcqsx61Cmw6uEEEVGY0mHIwQ62lJze2JRyaA4lKfY67POFgTzgtic7
	GYlA==
X-Gm-Message-State: AKwxytfWEZNBr9Dkui/DN1MB47806UgR/scmmrw67gSY4KV6n6Ky23+X
	Xubvvfin3Pg8uTTw3aPjcyIqa2Mp
X-Google-Smtp-Source: AH8x224yLh7oxYBu5LRFiO19HJ5O3sh9HvkpPCbaozfGjcJ7g5c6nPhNjxBCYr/tGAH4PUGZFXkrhA==
X-Received: by 10.107.191.130 with SMTP id p124mr23340367iof.228.1517208295754;
	Sun, 28 Jan 2018 22:44:55 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
	by smtp.googlemail.com with ESMTPSA id
	s99sm3733733ioe.63.2018.01.28.22.44.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jan 2018 22:44:55 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20180115023501.37361-1-aik@ozlabs.ru>
	<7b942fc7-a061-789a-4223-030d234602ca@redhat.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <4482df3b-8700-9b5f-43f4-08d5fe31d42a@ozlabs.ru>
Date: Mon, 29 Jan 2018 17:44:51 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <7b942fc7-a061-789a-4223-030d234602ca@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH qemu] configure: Allow
 capstone=git only if git update is not disabled
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
X-List-Received-Date: Mon, 29 Jan 2018 06:45:01 -0000

On 15/01/18 17:48, Thomas Huth wrote:
> On 15.01.2018 03:35, Alexey Kardashevskiy wrote:
>> Even with --disable-git-update, ./configure tries updating the capstone
>> submodule instead of marking it "no"; this disables capstone submodule
>> if git update is disabled.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>  configure | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index 89bd662..92c21b3 100755
>> --- a/configure
>> +++ b/configure
>> @@ -4502,7 +4502,7 @@ case "$capstone" in
>>    "" | yes)
>>      if $pkg_config capstone; then
>>        capstone=system
>> -    elif test -e "${source_path}/.git" ; then
>> +    elif test -e "${source_path}/.git" -a $git_update = 'yes' ; then
>>        capstone=git
>>      elif test -e "${source_path}/capstone/Makefile" ; then
>>        capstone=internal
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>


Thanks mate. What's next? :)


-- 
Alexey

