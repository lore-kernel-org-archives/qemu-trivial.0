Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7nPd-0002j8-O2
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 13:25:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7nPb-0002gO-CS
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 13:25:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7nPZ-00086p-Ax
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 13:25:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39757)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7nPT-00085q-05; Tue, 31 May 2016 13:24:55 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CF56C049D52;
	Tue, 31 May 2016 17:24:54 +0000 (UTC)
Received: from [10.36.112.32] (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VHOoef007703; Tue, 31 May 2016 13:24:52 -0400
To: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
	<1464712565-14857-2-git-send-email-lvivier@redhat.com>
	<574DC600.8010904@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <bc0ca712-a704-8195-1127-b8b8a6e6986b@redhat.com>
Date: Tue, 31 May 2016 19:24:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <574DC600.8010904@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 31 May 2016 17:24:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/16] coccinelle: use macro
 DIV_ROUND_UP instead of (((n) + (d) - 1) /(d))
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
X-List-Received-Date: Tue, 31 May 2016 17:25:04 -0000



On 31/05/2016 19:12, Eric Blake wrote:
> On 05/31/2016 10:35 AM, Laurent Vivier wrote:
>> sample from http://coccinellery.org/
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>  scripts/coccinelle/round.cocci | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>  create mode 100644 scripts/coccinelle/round.cocci
>>
>> diff --git a/scripts/coccinelle/round.cocci b/scripts/coccinelle/round.cocci
>> new file mode 100644
>> index 0000000..ed06773
>> --- /dev/null
>> +++ b/scripts/coccinelle/round.cocci
>> @@ -0,0 +1,19 @@
>> +// Use macro DIV_ROUND_UP instead of (((n) + (d) - 1) /(d))
>> +@@
>> +expression e1;
>> +expression e2;
>> +@@
>> +(
>> +- ((e1) + e2 - 1) / (e2)
>> ++ DIV_ROUND_UP(e1,e2)
> 
> Should this also cover things like:
> 
> ((e1) & e2) / (e2 + 1)

It's true only if (e2 + 1) is a power of two... and I don't know if we
can check that with coccinelle... perhaps we can filter them manually then.

> or with bit-shifts in place of division? I don't know how much
> coccinelle can spot other issues (at least until I review the rest of
> your series), but at any rate your patch looks like a good first start.
> I also like the fact that we are committing the script into the repo, so
> that we can reuse it to catch future additions of the open-coded forms.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 

Thanks,
Laurent

