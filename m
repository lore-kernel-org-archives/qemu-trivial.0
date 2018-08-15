Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fpm90-000536-Jp
	for mharc-qemu-trivial@gnu.org; Tue, 14 Aug 2018 23:06:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1fpm8x-00052P-BW
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2018 23:06:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1fpm8w-0005Vf-D3
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2018 23:06:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36050 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1fpm8r-0005Fv-MM; Tue, 14 Aug 2018 23:06:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E54D8197010;
	Wed, 15 Aug 2018 03:06:36 +0000 (UTC)
Received: from [10.72.12.27] (ovpn-12-27.pek2.redhat.com [10.72.12.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 434B52026D7E;
	Wed, 15 Aug 2018 03:06:33 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Harald Hoyer <harald@redhat.com>
References: <1534161104-8253-1-git-send-email-thuth@redhat.com>
	<87y3da5txn.fsf@dusky.pond.sub.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a06a8e46-2710-82ba-90cc-5d48fc182e5c@redhat.com>
Date: Wed, 15 Aug 2018 11:06:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87y3da5txn.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 15 Aug 2018 03:06:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 15 Aug 2018 03:06:36 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'jasowang@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options: Fix bad
 "macaddr" property in the documentation
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
X-List-Received-Date: Wed, 15 Aug 2018 03:06:45 -0000



On 2018=E5=B9=B408=E6=9C=8813=E6=97=A5 20:31, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
>
>> When using the "-device" option, the property is called "mac".
>> "macaddr" is only used for the legacy "-net nic" option.
> Indeed:
>
>      #define DEFINE_NIC_PROPERTIES(_state, _conf)                      =
      \
> --->    DEFINE_PROP_MACADDR("mac",   _state, _conf.macaddr),           =
     \
>          DEFINE_PROP_NETDEV("netdev", _state, _conf.peers)
>
>> Reported-by: Harald Hoyer <harald@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   qemu-options.hx | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index b1bf0f4..3495531 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -2345,7 +2345,7 @@ qemu-system-i386 linux.img \
>>                    -netdev socket,id=3Dn2,mcast=3D230.0.0.1:1234
>>   # launch yet another QEMU instance on same "bus"
>>   qemu-system-i386 linux.img \
>> -                 -device e1000,netdev=3Dn3,macaddr=3D52:54:00:12:34:5=
8 \
>> +                 -device e1000,netdev=3Dn3,mac=3D52:54:00:12:34:58 \
>>                    -netdev socket,id=3Dn3,mcast=3D230.0.0.1:1234
>>   @end example
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

Applied.

Thanks


