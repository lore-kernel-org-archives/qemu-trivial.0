Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ws9P0-0000wr-Mb
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jun 2014 07:30:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Ws9Oq-0000w1-Qw
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 07:30:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Ws9Oh-0001Uy-P2
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 07:30:32 -0400
Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233]:53092)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Ws9Oh-0001Uh-HD; Wed, 04 Jun 2014 07:30:23 -0400
Received: by mail-pd0-f179.google.com with SMTP id fp1so5997541pdb.10
	for <multiple recipients>; Wed, 04 Jun 2014 04:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=+GGquW5kYPRgjod/826+cj51zbFZGRYA5SfC4hjkUeg=;
	b=0BrBEQvEe7yXXnSlmAi4xNCAY/oIgED9jhqb5p/lz1gz/iA7/Hfcl2HNy2OyM7kbWc
	ZMezLSfqtNWFDCkljYwRoufNgY/HahP7Ta2W/Oc2dpwZq3fgDKEXBRcvrj9e2XXBwpEB
	2CIIuZdypeGtZPP7+u4q/5fAiIk5qafH7AImyVLF5N0wvSUnrbtEZKdd+KwD9yDsJYk1
	edHLrePBkdEQMYZ+cwLi+sYACjyZnJP8YLfTRpL963RQG/gKcm/vPVqAvscnVnJ+P333
	dQUEZosonyLCL8e8pZulWqzizZIh1bvB+m95ZIYkyVJ0w4gZ452A0TULYvnYGKd7RiUv
	OSEw==
X-Received: by 10.68.239.137 with SMTP id vs9mr63176040pbc.84.1401881422203;
	Wed, 04 Jun 2014 04:30:22 -0700 (PDT)
Received: from [192.168.1.119] ([124.127.118.42])
	by mx.google.com with ESMTPSA id zx1sm8932283pbc.60.2014.06.04.04.30.17
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Jun 2014 04:30:21 -0700 (PDT)
Message-ID: <538F0348.3090005@gmail.com>
Date: Wed, 04 Jun 2014 19:30:16 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <538C6B37.2030400@gmail.com>	<8761kh2iok.fsf@blackfin.pond.sub.org>
	<538EF4CC.8010703@gmail.com> <874n01vtan.fsf@blackfin.pond.sub.org>
In-Reply-To: <874n01vtan.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::233
Cc: quintela@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>, dgilbert@redhat.com,
	owasserm@redhat.com, arei.gonglei@huawei.com
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
X-List-Received-Date: Wed, 04 Jun 2014 11:30:42 -0000

On 06/04/2014 06:54 PM, Markus Armbruster wrote:
> Chen Gang <gang.chen.5i5j@gmail.com> writes:
> 
>> On 06/04/2014 04:16 PM, Markus Armbruster wrote:
>>> Chen Gang <gang.chen.5i5j@gmail.com> writes:
>>>
>>>> Call g_free() after cache_fini() in migration_end(), but do not call
>>>> g_free() after call cache_fini() in xbzrle_cache_resize() which will
>>>> cause memory leak.
>>>>
>>>> cache_init() and cache_fini() are pair, so need let cache_fini() call
>>>> g_free(cache) to match cache_init(), then fix current issue too.
>>>
>>> I'm not sure I get you.  Is the following accurate?
>>>
>>>     migration: Plug memory leak in migrate-set-cache-size command
>>>
>>>     We call g_free() after cache_fini() in migration_end(), but we don't
>>>     call it after cache_fini() in xbzrle_cache_resize(), leaking the
>>>     memory.
>>>
>>>     cache_init() and cache_fini() are a pair.  Since cache_init()
>>>     allocates the cache, let cache_fini() free it.  This plugs the leak.
>>>
>>
>> Yeah, and excuse me for my poor English.
> 
> No problem, we figured it out together :)
> 
> Would be nice to use the above text as commit message.  Perhaps it can
> be done on commit.
> 

That is fine to me.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

