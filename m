Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wlyik-0005XP-Sa
	for mharc-qemu-trivial@gnu.org; Sun, 18 May 2014 06:53:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wlyia-0005Wf-Dc
	for qemu-trivial@nongnu.org; Sun, 18 May 2014 06:53:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WlyiR-0007x6-Cx
	for qemu-trivial@nongnu.org; Sun, 18 May 2014 06:53:24 -0400
Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236]:50892)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WlyiR-0007wt-5q; Sun, 18 May 2014 06:53:15 -0400
Received: by mail-pa0-f54.google.com with SMTP id bj1so4502463pad.13
	for <multiple recipients>; Sun, 18 May 2014 03:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=QQeBQDaHcf8BpRKWHiRFf3uyCwffLHAMkBN60U9pSCY=;
	b=sGQRikRTIrhQNMaM5xydzgfzAjvXxsCX/NahXsg1t1kKK8BwZXhv/UAapbaWgEbSUS
	seodUTu66BY/CWjQ0KEW2xJZmuz2LJ7pgSv6Xlc/Xi2AawTUDs2A/ovRbegThTpBDjb6
	36SLbZAV/grS5oetFT7j91aOvfUeqIumoXWCaNfBex8RIpPAZ58z9Sfg4Hu8jsfwtK2o
	yfA6RDXI2zb2DxbfjZZLf9MyRBDLoKyanoErLbe5wor8PAkc6fBXUmVYK9J/KPxlIhP1
	3bhAUvMxQ6SFqMG+kpKFyRx45FJ1M8tBk06Y84tSWvOjUvpuv85HLhkJR3qRXuqj4p2H
	03EQ==
X-Received: by 10.69.26.70 with SMTP id iw6mr34656187pbd.98.1400410393288;
	Sun, 18 May 2014 03:53:13 -0700 (PDT)
Received: from [192.168.1.102] ([223.72.65.45])
	by mx.google.com with ESMTPSA id
	iv2sm24212297pbc.19.2014.05.18.03.53.10 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 18 May 2014 03:53:12 -0700 (PDT)
Message-ID: <53789122.7080904@gmail.com>
Date: Sun, 18 May 2014 18:53:22 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <536E20CC.4030401@gmail.com> <537715BF.90005@msgid.tls.msk.ru>
In-Reply-To: <537715BF.90005@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::236
Cc: mst@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>, quintela@redhat.com,
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
X-List-Received-Date: Sun, 18 May 2014 10:53:33 -0000

On 05/17/2014 03:54 PM, Michael Tokarev wrote:
> 10.05.2014 16:51, Chen Gang wrote:
>> For xbzrle_decode_buffer(), when decoding contents will exceed writing
>> buffer, it will return -1, so need not check the return value whether
>> large than writing buffer.
>>
>> And when failure occurs within load_xbzrle(), it always return -1
>> without any resources which need release.
>>
>> So can remove the related checking statements, and also can remove 'rc'
>> and 'ret' local variables,
> 
> Just one comment below.
> 
>> @@ -933,18 +932,13 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
>>      qemu_get_buffer(f, xbzrle_decoded_buf, xh_len);
>>  
>>      /* decode RLE */
>> -    ret = xbzrle_decode_buffer(xbzrle_decoded_buf, xh_len, host,
>> -                               TARGET_PAGE_SIZE);
>> -    if (ret == -1) {
>> +    if (xbzrle_decode_buffer(xbzrle_decoded_buf, xh_len, host,
>> +                             TARGET_PAGE_SIZE) == -1) {
> 
> Can we compare like '< 0' here, not like '== -1' ?

That's fine to me.

> Are there any other possible return values from xbzrle_decode_buffer()
> which are less than zero but non-error?
> 

Although, at present, when it fails, it will only return -1.


> To me, anything less than zero is always error (unless it is one of the
> possible non-error values, like offset for example which can be negative).
> 

That sounds reasonable to me, too.

> Especially having in mind that in the future, some function may extend
> its error return to include the actual error code (like -errno), in which
> case code which compares with -1 will not work anymore.
> 

Yeah, in the future, it may do.

> Is it okay to me to apply this with s/== -1/< 0/ ?
> 

At least, it is OK to me.


BTW: the related test code for xbzrle_decode_buffer() may also need
improved (although, after read through, I still don't known what it
really want to do).

diff --git a/tests/test-xbzrle.c b/tests/test-xbzrle.c
index db93b0a..c8b4e58 100644
--- a/tests/test-xbzrle.c
+++ b/tests/test-xbzrle.c
@@ -162,7 +162,7 @@ static void encode_decode_range(void)
                                 PAGE_SIZE);
 
     rc = xbzrle_decode_buffer(compressed, dlen, test, PAGE_SIZE);
-    g_assert(rc < PAGE_SIZE);
+    g_assert(rc < PAGE_SIZE && rc >= 0);
     g_assert(memcmp(test, buffer, PAGE_SIZE) == 0);
 
     g_free(buffer);

Please help check when you have time. If necessary, I shall send related
patch for it. (this fix may be still incorrect, if so, please help send
related patch for it, and welcome to mark me as Reported-by for it).


Thanks.
-- 
Chen Gang

Open, share and attitude like air, water and life which God blessed

