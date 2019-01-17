Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkDgk-0007zq-Vo
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2019 14:50:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1gkDgi-0007xE-Ir
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 14:50:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1gkDgh-0001du-VL
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 14:50:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1gkDge-0001ZD-RN; Thu, 17 Jan 2019 14:50:49 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 863C0C0B200D;
	Thu, 17 Jan 2019 19:50:46 +0000 (UTC)
Received: from [10.18.17.221] (dhcp-17-221.bos.redhat.com [10.18.17.221])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7D7E19741;
	Thu, 17 Jan 2019 19:50:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: yuchenlin <npes87184@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org, stefanha@redhat.com
References: <20181221135803.9583-1-npes87184@gmail.com>
	<8736abeb-60b6-e077-b6ad-0f01da4f8c0a@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
	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
	7/fPtaxuvJeIthhjv8Hwl3I=
Message-ID: <85ba040e-3e44-c8d5-568c-2b219939eb88@redhat.com>
Date: Thu, 17 Jan 2019 14:50:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <8736abeb-60b6-e077-b6ad-0f01da4f8c0a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 17 Jan 2019 19:50:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] dmg: fix binary search
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
X-List-Received-Date: Thu, 17 Jan 2019 19:50:53 -0000



On 1/17/19 2:29 PM, John Snow wrote:
> 
> 
> On 12/21/18 8:58 AM, yuchenlin wrote:
>> There is a possible hang in original binary searsh implemtation. That is
>> if chunk1 = 4, chunk2 = 5, chunk3 = 4, and we go else case.
>>
>> The chunk1 will be still 4, and so on.
>>
>> Signed-off-by: yuchenlin <npes87184@gmail.com>
> 
> Generally we ask that people use their full names for their
> Signed-off-by (for legal and copyright reasons) and not an alias.
> 
> If I am mistaken and your name is a mononym or written as a mononym,
> please forgive me and disregard.
> 

ah, just found the later threads. Still email backlogged, disregard.

