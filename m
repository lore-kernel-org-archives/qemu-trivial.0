Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ws8RE-0001wj-QA
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jun 2014 06:28:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Ws8R4-0001uT-HN
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 06:28:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Ws8Qv-0001s7-7j
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 06:28:46 -0400
Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236]:62921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Ws8Qv-0001rz-0h; Wed, 04 Jun 2014 06:28:37 -0400
Received: by mail-pd0-f182.google.com with SMTP id r10so5897083pdi.41
	for <multiple recipients>; Wed, 04 Jun 2014 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=YSDbSlLnQQxDbw9Jd5eWgUZsVaq+Ohsvf4WX41Cmue4=;
	b=UZhYxhbHBCFXNwyTk9p5DUCmKnSqjnTkmMFnXrLPuOqXPsvurZQXrSqJ4iod2QwsB2
	mCFna3k9xGPvNGacu0yvcwODFBJsi1eVzFyvaeib9jxLdmTJjhlLpSry06FfPjXds1PV
	gBEgaV0xZ4NXnFL1SQqpNGTNl2dEfEN6G2+F0n3ucyeD9Ze2lJkwg240gxTiREcM4Cl6
	H/kLXcXeJlOSLiLXBSIK0RS9+AEgTMBxnmndl2rkGbHGCx0HyT+fS+BOJNhSC8/zZiQH
	4LzdN/LxPk0aIkcsGM9D7QHzF0d+JWRVqyy6DiXzwi2nMilPgkfL0aVWwdGb6PswaxcV
	QDHg==
X-Received: by 10.68.170.131 with SMTP id am3mr62313249pbc.97.1401877715672;
	Wed, 04 Jun 2014 03:28:35 -0700 (PDT)
Received: from [192.168.1.119] ([124.127.118.42])
	by mx.google.com with ESMTPSA id no9sm8237788pbc.83.2014.06.04.03.28.31
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Jun 2014 03:28:35 -0700 (PDT)
Message-ID: <538EF4CC.8010703@gmail.com>
Date: Wed, 04 Jun 2014 18:28:28 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <538C6B37.2030400@gmail.com> <8761kh2iok.fsf@blackfin.pond.sub.org>
In-Reply-To: <8761kh2iok.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::236
Cc: quintela@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, dgilbert@redhat.com,
	QEMU Developers <qemu-devel@nongnu.org>, owasserm@redhat.com,
	arei.gonglei@huawei.com, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH-trivial] arch_init.c: Free
 'cache' in cache_fini() to avoid memory leak
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
X-List-Received-Date: Wed, 04 Jun 2014 10:28:56 -0000



On 06/04/2014 04:16 PM, Markus Armbruster wrote:
> Chen Gang <gang.chen.5i5j@gmail.com> writes:
> 
>> Call g_free() after cache_fini() in migration_end(), but do not call
>> g_free() after call cache_fini() in xbzrle_cache_resize() which will
>> cause memory leak.
>>
>> cache_init() and cache_fini() are pair, so need let cache_fini() call
>> g_free(cache) to match cache_init(), then fix current issue too.
> 
> I'm not sure I get you.  Is the following accurate?
> 
>     migration: Plug memory leak in migrate-set-cache-size command
> 
>     We call g_free() after cache_fini() in migration_end(), but we don't
>     call it after cache_fini() in xbzrle_cache_resize(), leaking the
>     memory.
> 
>     cache_init() and cache_fini() are a pair.  Since cache_init()
>     allocates the cache, let cache_fini() free it.  This plugs the leak.
> 

Yeah, and excuse me for my poor English.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

