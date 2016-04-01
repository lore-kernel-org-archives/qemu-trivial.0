Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aloNv-0004AT-3n
	for mharc-qemu-trivial@gnu.org; Thu, 31 Mar 2016 22:00:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aloNt-000486-AD
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 22:00:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aloNs-0005Bk-A2
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 22:00:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1aloNn-0005Al-RC; Thu, 31 Mar 2016 22:00:19 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 640A9C0C114F;
	Fri,  1 Apr 2016 02:00:19 +0000 (UTC)
Received: from [10.72.7.199] (vpn1-7-199.pek2.redhat.com [10.72.7.199])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3120FF9002867
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 31 Mar 2016 22:00:17 -0400
To: Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
References: <1459434536-28145-1-git-send-email-pbonzini@redhat.com>
	<56FD4ECD.9040703@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <56FDD62F.7080702@redhat.com>
Date: Fri, 1 Apr 2016 10:00:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56FD4ECD.9040703@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: fix OptsVisitor memory
	leak
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
X-List-Received-Date: Fri, 01 Apr 2016 02:00:26 -0000



On 04/01/2016 12:22 AM, Eric Blake wrote:
> On 03/31/2016 08:28 AM, Paolo Bonzini wrote:
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> May want to add: regression introduced in commit 96a1616.
>
>> ---
>>  net/net.c | 1 +
>>  1 file changed, 1 insertion(+)
> Reviewed-by: Eric Blake <eblake@redhat.com>

Applied to -net.

Thanks

>
>> diff --git a/net/net.c b/net/net.c
>> index 594c3b8..3847a13 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -1100,6 +1100,7 @@ int net_client_init(QemuOpts *opts, int is_netdev, Error **errp)
>>      }
>>  
>>      error_propagate(errp, err);
>> +    opts_visitor_cleanup(ov);
>>      return ret;
>>  }
>>  
>>


