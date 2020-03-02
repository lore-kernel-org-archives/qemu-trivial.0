Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8dxI-00019Q-3e
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2020 00:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j8dxE-00017l-Ln
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 00:49:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j8dxD-0004XF-EN
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 00:49:24 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46028
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j8dxD-0004Wm-B8
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 00:49:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583128162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWqCLGuOApLl8i4xhFrMQ0jM6htxzoLVqTtWO19ZfII=;
 b=BA4+a2jZ91FX+VUpbSjNhDoB11IIF6mg8NsMkTOiK5jV1lDUELgvOZPxNuhWeWoOSQj0I8
 X16IzzEiRwCmFtA3ShEF7EuoCbV8CG7TbZjoHHO/lhJ/HoueziwIgs1CHtk/VZZFfjx4V0
 428JyRPgNUrTv0vGvr8mq8uahsT9Pig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-bc65Zh8bNOi2ZHTm_kvM0w-1; Mon, 02 Mar 2020 00:49:13 -0500
X-MC-Unique: bc65Zh8bNOi2ZHTm_kvM0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AADA107ACC4;
 Mon,  2 Mar 2020 05:49:11 +0000 (UTC)
Received: from [10.72.13.131] (ovpn-13-131.pek2.redhat.com [10.72.13.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBB945C1C3;
 Mon,  2 Mar 2020 05:49:00 +0000 (UTC)
Subject: Re: [PATCH] l2tpv3: fix RFC number typo in qemu-options.hx
To: Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
Cc: Henrik Johansson <henrikjohansson@rocketmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200229111727.350893-1-stefanha@redhat.com>
 <ae5cd213-ada2-1b20-064c-a0bc63d3622d@weilnetz.de>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <189c4909-a269-6c4f-bb62-87b29a01ff83@redhat.com>
Date: Mon, 2 Mar 2020 13:48:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ae5cd213-ada2-1b20-064c-a0bc63d3622d@weilnetz.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Mar 2020 05:49:26 -0000


On 2020/2/29 =E4=B8=8B=E5=8D=887:57, Stefan Weil wrote:
> Am 29.02.20 um 12:17 schrieb Stefan Hajnoczi:
>
>> The L2TPv3 RFC number is 3931:
>> https://tools.ietf.org/html/rfc3931
>>
>> Reported-by: Henrik Johansson <henrikjohansson@rocketmail.com>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   qemu-options.hx | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index ac315c1ac4..55a539e04f 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -2330,7 +2330,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>       "                Linux kernel 3.3+ as well as most routers can tal=
k\n"
>>       "                L2TPv3. This transport allows connecting a VM to =
a VM,\n"
>>       "                VM to a router and even VM to Host. It is a nearl=
y-universal\n"
>> -    "                standard (RFC3391). Note - this implementation use=
s static\n"
>> +    "                standard (RFC3931). Note - this implementation use=
s static\n"
>>       "                pre-configured tunnels (same as the Linux kernel)=
.\n"
>>       "                use 'src=3D' to specify source address\n"
>>       "                use 'dst=3D' to specify destination address\n"
>> @@ -2737,7 +2737,7 @@ Example (send packets from host's 1.2.3.4):
>>   @end example
>>  =20
>>   @item -netdev l2tpv3,id=3D@var{id},src=3D@var{srcaddr},dst=3D@var{dsta=
ddr}[,srcport=3D@var{srcport}][,dstport=3D@var{dstport}],txsession=3D@var{t=
xsession}[,rxsession=3D@var{rxsession}][,ipv6][,udp][,cookie64][,counter][,=
pincounter][,txcookie=3D@var{txcookie}][,rxcookie=3D@var{rxcookie}][,offset=
=3D@var{offset}]
>> -Configure a L2TPv3 pseudowire host network backend. L2TPv3 (RFC3391) is=
 a
>> +Configure a L2TPv3 pseudowire host network backend. L2TPv3 (RFC3931) is=
 a
>>   popular protocol to transport Ethernet (and other Layer 2) data frames=
 between
>>   two systems. It is present in routers, firewalls and the Linux kernel
>>   (from version 3.3 onwards).
>
> Thank you, Stefan and Henrik.
>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>

Applied.

Thanks


