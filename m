Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZou5-0004i9-10
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 21:44:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZou2-0004gN-7E
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 21:44:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZou1-0007rS-AN
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 21:44:50 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38746)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZotw-0007nt-Qt; Mon, 24 Jul 2017 21:44:44 -0400
Received: by mail-qk0-x242.google.com with SMTP id t2so11525938qkc.5;
	Mon, 24 Jul 2017 18:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rjXT6E4Bhg7NKQoG2I+yfvc3jhZqyVXkR17yH3qKqV8=;
	b=LepgFKNQpSvK+My6Ve7e2vYmk9vKcMHoz6JkQvdoBChggF6VYbfWzq0fgPdxEJu9u7
	1FbUCKej5z9b1AJYxJxcnVucJnxqqBskawYkdZaE6jUWaSH9ZllNurvdL1cZ4YWAledl
	WLQJ7NN74YKJJwfv4Vnurq03pP30zD0vRkywLiBZ4KIF70VHOOGbRaCMjXejRs1b/w2c
	NNYGpdZdHQF9ooIYSpP5al8iV7CKJUEw90TdjeCWRSESt8aQHCJ3rJXjYKURwdmVzUUq
	oWVmyKLUsqI0r0cqWsqdF7ZhjBMR6xEH2di9cTg6W4y04w9J2zMOTJGZtWYrZR75/e40
	ByZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rjXT6E4Bhg7NKQoG2I+yfvc3jhZqyVXkR17yH3qKqV8=;
	b=VtrIlNJbOAHbz37ncE3ceuUqK2JZKRH1SySJ4LY6rSXR5CwtIcFrIwDoRg1uWXjP7a
	e9wO5RA6dqjI5oqErHbBqP+kWjvyLVRr9vVVyizY52hshfEjEEGJkFbYm5u92riFdAQZ
	k5988rGnX/7v0VITvt3OMc9MWRq6WMYrigpCxTsqL4vINirOBeiihX1dVMF1i/YuYN9l
	2qWzH9uIXmH2mPgEMyVTX9jMlSCQywOI5UKhuDy54poNIumOGheHloWm6QHEwXv2QnBO
	N2ls1gzKl2TxuUaLfflW7kGbQCaTBk4SHLyy3pS8MMJ6up0zEo3lFnELwe4g4z9hFvcy
	zPsA==
X-Gm-Message-State: AIVw111yBEIgCQBc5q3Ru3sXzwiqt3x01I9fgIc6ml4kIgs9lauZNu/N
	xUaVuHYIdrA7sY6+9JYVtA==
X-Received: by 10.233.235.132 with SMTP id b126mr23898457qkg.262.1500947083981;
	Mon, 24 Jul 2017 18:44:43 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	y133sm9216307qkb.71.2017.07.24.18.44.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 18:44:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-8-f4bug@amsat.org>
	<92a75f2c-d99c-a4c8-77c4-11898b16fe1b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2cbbd3d3-87b4-a276-079c-b4f2e97385fe@amsat.org>
Date: Mon, 24 Jul 2017 22:44:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <92a75f2c-d99c-a4c8-77c4-11898b16fe1b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [PATCH for 2.10 07/35] qcow2: fix null pointer
 dereference
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
X-List-Received-Date: Tue, 25 Jul 2017 01:44:51 -0000

Hi Eric,

On 07/24/2017 03:46 PM, Eric Blake wrote:
> On 07/24/2017 01:27 PM, Philippe Mathieu-Daudé wrote:
>> If find_bitmap_by_name() fails we have bm=NULL and go to the 'fail' label, then
>> call bitmap_free(bm) which does g_free(bm->name) with bm=NULL...
>>
>> Clang's scan-build-5.0 output:
>> block/qcow2-bitmap.c:492:12: warning: Access to field 'name' results in a dereference of a null pointer (loaded from variable 'bm')
>>      g_free(bm->name);
>>             ^~~~~~~~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   block/qcow2-bitmap.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Max already has a better patch from Vladimir pending on his block queue:
> https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg04398.html

Oh I missed that.
I'm not sure it is "better", it may be safer although ;)

Patch dropped.

Regards,

Phil.

