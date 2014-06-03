Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wrp2x-0004QY-6p
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jun 2014 09:46:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wrp2m-0004I2-FB
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 09:46:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wrp2d-0008IB-EI
	for qemu-trivial@nongnu.org; Tue, 03 Jun 2014 09:46:24 -0400
Received: from mail-pb0-x232.google.com ([2607:f8b0:400e:c01::232]:36636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Wrp2d-0008Hz-6w; Tue, 03 Jun 2014 09:46:15 -0400
Received: by mail-pb0-f50.google.com with SMTP id ma3so5582892pbc.9
	for <multiple recipients>; Tue, 03 Jun 2014 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=gFChUCUPYSKjs4z/DnR/0rh9cWgeIZyQ2TlQMqWA8ZE=;
	b=b3FfKJc1GYIs52vYyRgO5iQ8eS4W7u54ZIid+hD+2cthMM47zYuh6Cmhy1dYBEpZZv
	M2AEcPrOtwVolULWvwqbDVZLo9rnULQT13upMY3tjGDeyNMwa84mwd6ndB8AED77K3+I
	hfh5p8DFJoRyBkx4SDN7ZgZeQXQL9Ai3XmWLfLgXqpqrd4SHXuFW8pZzbaX976z7a34+
	tpL2d/yiHNAUzMbjjlGl0oV2E2WGtWRKUjjXILjwmT9zQ3xYXJCY7aUPqpxC/gRk+xO1
	ySF8SaUR2mVI87zJv942BtEBXyVIB30svQqMJDYdry852W0+72GaXgXaXwx6rWSTaFqD
	IIMg==
X-Received: by 10.68.171.4 with SMTP id aq4mr51229245pbc.150.1401803173569;
	Tue, 03 Jun 2014 06:46:13 -0700 (PDT)
Received: from [192.168.1.119] ([124.127.118.42])
	by mx.google.com with ESMTPSA id
	fx5sm28291506pbb.62.2014.06.03.06.46.08 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Jun 2014 06:46:13 -0700 (PDT)
Message-ID: <538DD187.5050400@gmail.com>
Date: Tue, 03 Jun 2014 21:45:43 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: ChenLiang <chenliang88@huawei.com>
References: <538C6F98.5070005@gmail.com> <538D79D4.5000900@huawei.com>
In-Reply-To: <538D79D4.5000900@huawei.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::232
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
X-List-Received-Date: Tue, 03 Jun 2014 13:46:33 -0000


Firstly, thank you very much for reviewing the related 2 patches.

On 06/03/2014 03:31 PM, ChenLiang wrote:
> On 2014/6/2 20:35, Chen Gang wrote:
> 
>> 'encoded_buf' and 'current_buf' are lock protected during using in
>> save_xbzrle_page() in ram_save_page(), and during freeing in
>> migration_end().
>>
>> So recommend to let them lock protected during starting, just like we
>> have done to 'cache'.
>>
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>> ---
>>  arch_init.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch_init.c b/arch_init.c
>> index 23044c1..784922c 100644
>> --- a/arch_init.c
>> +++ b/arch_init.c
>> @@ -783,12 +783,12 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>>              error_report("Error creating cache");
>>              return -1;
>>          }
>> -        XBZRLE_cache_unlock();
>>
>>          /* We prefer not to abort if there is no memory */
>>          XBZRLE.encoded_buf = g_try_malloc0(TARGET_PAGE_SIZE);
>>          if (!XBZRLE.encoded_buf) {
>>              error_report("Error allocating encoded_buf");
>> +            XBZRLE_cache_unlock();
>>              return -1;
>>          }
>>
>> @@ -797,8 +797,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>>              error_report("Error allocating current_buf");
>>              g_free(XBZRLE.encoded_buf);
>>              XBZRLE.encoded_buf = NULL;
>> +            XBZRLE_cache_unlock();
>>              return -1;
>>          }
>> +        XBZRLE_cache_unlock();
>>
>>          acct_clear();
>>      }
> 
> 
> It isn't necessary.
> 

For me, it is still necessary to be improved.

 - If this code is not performance sensitive:

   "always lock protected" will let source code easy understanding for
   readers, and easy sustainable for maintainers.

 - Else (performance sensitive):

   Need give related comments to it (e.g. for performance reason, let it
   out of lock protected). So readers easily understand, and the related
   maintainers may notice about it at any time.

     It is not good to give comments in a function, except the code is
     not used in normal way.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

