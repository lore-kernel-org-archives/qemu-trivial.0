Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cCiif-0003dU-Sw
	for mharc-qemu-trivial@gnu.org; Fri, 02 Dec 2016 02:57:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cCiid-0003bc-OP
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2016 02:57:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cCiid-00087n-10
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2016 02:57:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44956)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1cCiiY-00086H-Hm; Fri, 02 Dec 2016 02:57:14 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CFCA4AE8A;
	Fri,  2 Dec 2016 07:57:12 +0000 (UTC)
Received: from [10.36.112.32] (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uB27v4qf007971; Fri, 2 Dec 2016 02:57:06 -0500
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>, Eric Blake
	<eblake@redhat.com>, qemu devel <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
References: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
	<a1593129-ddb9-8e74-5865-b1e8400c991d@redhat.com>
	<8b90a1da-a129-f2cb-4545-355348387925@cn.fujitsu.com>
Cc: Stefan Weil <sw@weilnetz.de>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <063dfa33-2015-e566-c623-d59578c20fcd@redhat.com>
Date: Fri, 2 Dec 2016 08:57:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8b90a1da-a129-f2cb-4545-355348387925@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 02 Dec 2016 07:57:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.8] docs: Fix
 description of the sentence
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
X-List-Received-Date: Fri, 02 Dec 2016 07:57:20 -0000



On 02/12/2016 03:59, Zhang Chen wrote:
> 
> 
> On 12/01/2016 10:57 PM, Eric Blake wrote:
>> On 12/01/2016 12:55 AM, Zhang Chen wrote:
>>> Say it in another way to make it easier to understand.
>>>
>>> Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> I guess that's because I suggested the replacement text to use, even
>> though I didn't write the patch.
> 
> Yes, In that case, should I change the signed-off-by to acked-by or
> remove it?

You can use "Suggested-by:"

https://www.kernel.org/doc/Documentation/SubmittingPatches

Laurent

