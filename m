Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRghn-0002vi-V2
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 11:59:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRghi-0002gP-8j
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 11:59:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRgZ0-0006ze-Qv
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 11:50:23 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:46621)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gRgZ0-0006yl-Ib; Tue, 27 Nov 2018 11:50:18 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1N0o3Z-1fV9xg0DNF-00wpnJ; Tue, 27 Nov 2018 17:50:13 +0100
To: Alex Williamson <alex.williamson@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-14-philmd@redhat.com>
	<20181127093552.4f53790d@x1.home>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <a752d154-7158-7729-2ea4-3a1e1766efbc@vivier.eu>
Date: Tue, 27 Nov 2018 17:50:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181127093552.4f53790d@x1.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AGCZPZpiFwM4vfTrSvN5ec2GXBx6oXtdNeFYNGtJ17XjVr8GTKV
	6Y7HpqIZwHNEEgIQMSfnFPf2MvCZPTxWqU23jI4RVCl54oFdQ25/B5c3ooh0+0rry12cNMQ
	PAwakUC69p7Nt+61XVgEtjM7vzZ/pCTVFnyaBLn/FI2FCnnTBhWZyQYTF3eXTZN4HUAj85t
	zXffWS2ntllXaLFUdtVVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PMawHdbbm7U=:dfkigCm+mM6YwXpN7F4Kkr
	DJKRRU46QKOPvzGD9JnuA4Mhgp3y2mJ4F3bMYccjS3eoAgKncDdCI0HoEyMyYBFy2hILA9nuo
	S47omHCdKLP7Pe+FuDzpOthgDayFDak+niTIDYtxsG+03Bdh+TS6ufpK82J8keCJ/hNBQ72Hx
	9RJz9zfe+c+GIewZ0edbYSEhv6IMxx4QDPR8kYujXUg+PSzblpnb44aQLmWOC47jZzwuWkgn/
	Ymn3Br/96qO/xP+7kF44JhhYErTFiGaKOm6W5OdshiM7hJzdKAyz/bNTNfELpw8KCNQrJvjm8
	/dxqYWDY79xR0Kzybf/hF7UcGQOKbwFEnNmiP2G+z+Xyqlq7S7YP8GWr9Au2worc+xLoCQWIP
	70uUGtZMxqerlHcVdQosSbPlxABryXC6qHAQz2dERWMmLLNWWo+0x5gHAdJ8MVOdRYPU5WvN7
	WsUm007XA2Rz+lPW+KjAFAQVT2Y9KCf0D3JeCpF6428S0DKszNCq9y7yKVHMUpSbA3yit2RYH
	Sasx4NU04D30go3UAD/6xVaPZ1AEB3MCwkDC8ESu3EQfmLfWdzRqZvuQPeEbKwWH0hnviz7r2
	pPvTE+l6O5IVfsKDD7Q+rgadVXHcSf1kUTi6hTuXhlmvNCBLUsmygRTWXaueDwB/iuCrN54rb
	UD/i4yuVhQ7KG50b2sVkQ/K49M3QebVNildtbsT1pCu/G1LZS2JhHc0L+ZHMrc9pnbxh/f7ad
	iWFdZ0KJPncz53JSVH8xvnJT/Zzqx0gfGsR5UaNindrNevmMXN8y8gr4znjFcWl05lJ6bF10Q
	VUVzcLFFYxz3MhddYofWnjjZthU4Q==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-3.1 13/25] MAINTAINERS:
 Add missing entries to VFIO
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
X-List-Received-Date: Tue, 27 Nov 2018 16:59:21 -0000

On 27/11/2018 17:35, Alex Williamson wrote:
> On Sun, 25 Nov 2018 21:49:48 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index bfe71f2555..e124792557 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1326,6 +1326,8 @@ M: Alex Williamson <alex.williamson@redhat.com>
>>  S: Supported
>>  F: hw/vfio/*
>>  F: include/hw/vfio/
>> +F: include/qemu/vfio-helpers.h
> 
> This misses util/vfio-helpers.c, both of which are contributed by Fam
> and currently only used by nvme.  I really haven't done anything with
> them, so they should probably be under the NVMe block driver, but if it
> makes more sense for me to look after them, I can start paying more
> attention to them.  I'm not sure signing someone up for new files
> they've never touched counts as trivial ;)  Thanks,

Un-applied to my trivial-patches branch...

Thanks,
Laurent

