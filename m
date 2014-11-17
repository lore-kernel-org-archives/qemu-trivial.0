Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqMXD-000579-KT
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 08:40:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1XqMX5-00056m-PM
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 08:40:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1XqMWw-00069H-OF
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 08:39:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1XqMWw-00068v-F1; Mon, 17 Nov 2014 08:39:46 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAHDddvk023775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 17 Nov 2014 08:39:39 -0500
Received: from [10.36.112.46] (ovpn-112-46.ams2.redhat.com [10.36.112.46])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAHDdWNA005505
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Mon, 17 Nov 2014 08:39:36 -0500
Message-ID: <5469FA93.4020508@redhat.com>
Date: Mon, 17 Nov 2014 14:39:31 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>, Gonglei <arei.gonglei@huawei.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>	
	<1416046008-7880-10-git-send-email-arei.gonglei@huawei.com>	
	<5469D4C4.5090407@redhat.com> <5469D98A.8020408@huawei.com>	
	<5469F033.5090104@huawei.com>
	<1416231418.608.15.camel@nilsson.home.kraxel.org>
In-Reply-To: <1416231418.608.15.camel@nilsson.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "Huangweidong \(C\)" <weidong.huang@huawei.com>,
	Zhanghailiang <zhang.zhanghailiang@huawei.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"mjt@tls.msk.ru" <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH 9/9] hcd-musb: fix dereference null
	return value
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
X-List-Received-Date: Mon, 17 Nov 2014 13:40:02 -0000

 17/11/2014 14:36, Gerd Hoffmann wrote:
>>>> @@ -625,8 +626,11 @@ static void musb_packet(MUSBState *s, MUSBEndPoint *ep,
>>>>      /* A wild guess on the FADDR semantics... */
>>>>      dev = usb_find_device(&s->port, ep->faddr[idx]);
>>>>      uep = usb_ep_get(dev, pid, ep->type[idx] & 0xf);
>>>> -    usb_packet_setup(&ep->packey[dir].p, pid, uep, 0,
>>>> -                     (dev->addr << 16) | (uep->nr << 8) | pid, false, true);
>>>> +    id = pid;
>>>> +    if (uep) {
>>>> +        id |= (dev->addr << 16) | (uep->nr << 8);
>>>> +    }
>>>> +    usb_packet_setup(&ep->packey[dir].p, pid, uep, 0, id, false, true);
>>>>      usb_packet_addbuf(&ep->packey[dir].p, ep->buf[idx], len);
>>>>      ep->packey[dir].ep = ep;
>>>>      ep->packey[dir].dir = dir;
>>>
>>> This is a good approach, id is just a identifying. Thanks,
>>>
>>
>> Let me split the patch from this series as a separate patch
>> and add Paolo's signed-off-by.
>>
>> Asking for Gerd's reviewing, Thanks.
> 
> Looks good to me.

Thanks, then I'll pick it up.

Paolo

