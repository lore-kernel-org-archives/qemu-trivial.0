Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ws8Uj-0004zF-5c
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jun 2014 06:32:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Ws8UY-0004fz-9n
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 06:32:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Ws8UP-0003Wy-97
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 06:32:22 -0400
Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230]:47441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Ws8UP-0003Wh-2K; Wed, 04 Jun 2014 06:32:13 -0400
Received: by mail-pb0-f48.google.com with SMTP id rr13so6803241pbb.35
	for <multiple recipients>; Wed, 04 Jun 2014 03:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=MaHSrr2i/dfz9BvynMBR9hlKKVnhc0/XTsDZzH8lrrY=;
	b=iSzYARm2nArs/WikHR0k2TcgGUz2+fO5e0zZgMaKFTFlPBLey4jC1SgMiYIJr25L1Z
	68gHrCDAJdoBGdLEaEnP55F2B6EgzCbuRkzJ5uqMjYY/D/MaROCOqUndXS/EKEhJYN2l
	i5R/kZlpbv+ETsM/CMq2QjR6bnjRnn7yWjUWbZLDhfly4MEgMU4Ero3doU1CwA1uH8az
	uxGam9jcZLAHezI3mk7d3W217ftfmjh1PIwhGXPoyVNMaim/doH/9llUm1WGGxTRdIQZ
	1RzRVXyc2jbub87SYQ47ChbqpvCh//NTWS7KjCzmsiD3EMEwWDM41vid83qvE+tFwbJa
	Xxqg==
X-Received: by 10.68.114.195 with SMTP id ji3mr32419211pbb.46.1401877931902;
	Wed, 04 Jun 2014 03:32:11 -0700 (PDT)
Received: from [192.168.1.119] ([124.127.118.42])
	by mx.google.com with ESMTPSA id pu5sm8389149pbb.4.2014.06.04.03.32.07
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Jun 2014 03:32:11 -0700 (PDT)
Message-ID: <538EF5A4.1030500@gmail.com>
Date: Wed, 04 Jun 2014 18:32:04 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <538C6F98.5070005@gmail.com> <871tv52ihw.fsf@blackfin.pond.sub.org>
In-Reply-To: <871tv52ihw.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::230
Cc: quintela@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, dgilbert@redhat.com,
	QEMU Developers <qemu-devel@nongnu.org>, owasserm@redhat.com,
	arei.gonglei@huawei.com, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH-trivial] arch_init.c: Always
 be sure that 'encoded_buf' and 'current_buf' are lock protected
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
X-List-Received-Date: Wed, 04 Jun 2014 10:32:31 -0000



On 06/04/2014 04:20 PM, Markus Armbruster wrote:
> Chen Gang <gang.chen.5i5j@gmail.com> writes:
> 
>> 'encoded_buf' and 'current_buf' are lock protected during using in
>> save_xbzrle_page() in ram_save_page(), and during freeing in
>> migration_end().
>>
>> So recommend to let them lock protected during starting, just like we
>> have done to 'cache'.
> 
> I'd recommend against routing locking patches through -trivial.  The
> code has maintainers, and you cc'ed them.
> 

OK, I shall remove -trivial for locking patches, next time.

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

