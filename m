Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etSVC-0000pD-95
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2018 01:24:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1etSVA-0000oY-N1
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 01:24:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1etSV9-0006mw-VT
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 01:24:36 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37182 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1etSV5-0006kg-Io; Wed, 07 Mar 2018 01:24:31 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D34384068032;
	Wed,  7 Mar 2018 06:24:22 +0000 (UTC)
Received: from [10.36.116.104] (ovpn-116-104.ams2.redhat.com [10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9F8A2024CAD;
	Wed,  7 Mar 2018 06:24:17 +0000 (UTC)
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20180201093545.33741-1-aik@ozlabs.ru>
	<38e2df74-c7d7-a062-8385-494adae0ef89@ozlabs.ru>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <727e34b6-0f7f-bd0c-9a34-51d5bc844c73@redhat.com>
Date: Wed, 7 Mar 2018 07:24:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <38e2df74-c7d7-a062-8385-494adae0ef89@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 07 Mar 2018 06:24:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 07 Mar 2018 06:24:22 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH qemu] slirp/debug: Print IP
 addresses in human readable form
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
X-List-Received-Date: Wed, 07 Mar 2018 06:24:37 -0000

On 07.03.2018 04:38, Alexey Kardashevskiy wrote:
> On 01/02/18 20:35, Alexey Kardashevskiy wrote:
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> Ping?
> 
> 
>> ---
>>  slirp/arp_table.c | 4 ++--
>>  slirp/socket.c    | 8 ++++----
>>  slirp/udp.c       | 4 ++--
>>  3 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/slirp/arp_table.c b/slirp/arp_table.c
>> index 3547043..bac608f 100644
>> --- a/slirp/arp_table.c
>> +++ b/slirp/arp_table.c
>> @@ -33,7 +33,7 @@ void arp_table_add(Slirp *slirp, uint32_t ip_addr, uint8_t ethaddr[ETH_ALEN])
>>      int i;
>>  
>>      DEBUG_CALL("arp_table_add");
>> -    DEBUG_ARG("ip = 0x%x", ip_addr);
>> +    DEBUG_ARG("ip = %s", inet_ntoa(*(struct in_addr *)&ip_addr));

Is this endianness safe? The man-page of inet_ntoa says that the
function is expecting network byte order, so I wonder whether this works
right on both, big and little endian hosts?

 Thomas

