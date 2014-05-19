Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmIHX-00088U-Q3
	for mharc-qemu-trivial@gnu.org; Mon, 19 May 2014 03:46:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WmIHQ-0007ud-5b
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 03:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WmIHK-0006po-0Q
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 03:46:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39208)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WmIH4-0006ig-Rf; Mon, 19 May 2014 03:46:19 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3C98F41BD9;
	Mon, 19 May 2014 11:46:10 +0400 (MSK)
Message-ID: <5379B6C2.8050402@msgid.tls.msk.ru>
Date: Mon, 19 May 2014 11:46:10 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>
References: <536E20CC.4030401@gmail.com> <537715BF.90005@msgid.tls.msk.ru>
	<53789122.7080904@gmail.com>
In-Reply-To: <53789122.7080904@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: quintela@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>, mst@redhat.com,
	QEMU Developers <qemu-devel@nongnu.org>, owasserm@redhat.com,
	pbonzini@redhat.com, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] arch_init: Simplify code for
	load_xbzrle()
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
X-List-Received-Date: Mon, 19 May 2014 07:46:46 -0000

Meanwhile the original version has been merged from
juanquintela/tags/migration/20140515 in the original form,
so the point is moot already.

Juan, can you please indicate that you applied something,
instead of just giving a Reviewed-by?

Thanks,

/mjt

18.05.2014 14:53, Chen Gang wrote:
> On 05/17/2014 03:54 PM, Michael Tokarev wrote:
>> 10.05.2014 16:51, Chen Gang wrote:
>>> For xbzrle_decode_buffer(), when decoding contents will exceed writing
>>> buffer, it will return -1, so need not check the return value whether
>>> large than writing buffer.
>>>
>>> And when failure occurs within load_xbzrle(), it always return -1
>>> without any resources which need release.
>>>
>>> So can remove the related checking statements, and also can remove 'rc'
>>> and 'ret' local variables,
>>
>> Just one comment below.
>>
>>> @@ -933,18 +932,13 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
>>>      qemu_get_buffer(f, xbzrle_decoded_buf, xh_len);
>>>  
>>>      /* decode RLE */
>>> -    ret = xbzrle_decode_buffer(xbzrle_decoded_buf, xh_len, host,
>>> -                               TARGET_PAGE_SIZE);
>>> -    if (ret == -1) {
>>> +    if (xbzrle_decode_buffer(xbzrle_decoded_buf, xh_len, host,
>>> +                             TARGET_PAGE_SIZE) == -1) {
>>
>> Can we compare like '< 0' here, not like '== -1' ?
> 
> That's fine to me.
> 
>> Are there any other possible return values from xbzrle_decode_buffer()
>> which are less than zero but non-error?
>>
> 
> Although, at present, when it fails, it will only return -1.
> 
> 
>> To me, anything less than zero is always error (unless it is one of the
>> possible non-error values, like offset for example which can be negative).
>>
> 
> That sounds reasonable to me, too.
> 
>> Especially having in mind that in the future, some function may extend
>> its error return to include the actual error code (like -errno), in which
>> case code which compares with -1 will not work anymore.
>>
> 
> Yeah, in the future, it may do.
> 
>> Is it okay to me to apply this with s/== -1/< 0/ ?
>>
> 
> At least, it is OK to me.
> 
> 
> BTW: the related test code for xbzrle_decode_buffer() may also need
> improved (although, after read through, I still don't known what it
> really want to do).
> 
> diff --git a/tests/test-xbzrle.c b/tests/test-xbzrle.c
> index db93b0a..c8b4e58 100644
> --- a/tests/test-xbzrle.c
> +++ b/tests/test-xbzrle.c
> @@ -162,7 +162,7 @@ static void encode_decode_range(void)
>                                  PAGE_SIZE);
>  
>      rc = xbzrle_decode_buffer(compressed, dlen, test, PAGE_SIZE);
> -    g_assert(rc < PAGE_SIZE);
> +    g_assert(rc < PAGE_SIZE && rc >= 0);
>      g_assert(memcmp(test, buffer, PAGE_SIZE) == 0);
>  
>      g_free(buffer);
> 
> Please help check when you have time. If necessary, I shall send related
> patch for it. (this fix may be still incorrect, if so, please help send
> related patch for it, and welcome to mark me as Reported-by for it).
> 
> 
> Thanks.
> 


