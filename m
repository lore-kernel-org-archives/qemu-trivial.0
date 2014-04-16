Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Walsb-0000Ex-1V
	for mharc-qemu-trivial@gnu.org; Thu, 17 Apr 2014 08:57:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <iryzhov@arccn.ru>) id 1WaXFW-0002ca-A3
	for qemu-trivial@nongnu.org; Wed, 16 Apr 2014 17:20:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <iryzhov@arccn.ru>) id 1WaXFO-0007a6-4l
	for qemu-trivial@nongnu.org; Wed, 16 Apr 2014 17:20:06 -0400
Received: from vpn.arccn.ru ([95.182.74.2]:41564 helo=mail.arccn.ru)
	by eggs.gnu.org with smtp (Exim 4.71)
	(envelope-from <iryzhov@arccn.ru>) id 1WaXFN-0007ZM-UU
	for qemu-trivial@nongnu.org; Wed, 16 Apr 2014 17:19:58 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.arccn.ru (Postfix) with ESMTP id 893FBA0094
	for <qemu-trivial@nongnu.org>; Thu, 17 Apr 2014 01:19:56 +0400 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=arccn.ru; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:references:subject:subject:to:mime-version:user-agent:from:from
	:date:date:message-id; s=dkim; t=1397683196; x=1398547196; bh=nj
	fZB7lor0vS+1JTSqfPhK5XCQ644cZEiZ+B9KAtnKg=; b=fCKUbaMF0d5B9Q7yfr
	5ME6NNbj/T6z5MrYA+AjxtqwLBsbKzXP0Qk6pALzLiQee+T/kXimYz2wdxaLLZZ9
	+XfoITUIi58ueMIMRBi8ZKFQHQNmmgb1jQ+ye8ohHBMqhymzJfmBqxcnRGGtpsYS
	G+03+0RbCz7c3qU1KhEYSUs58=
X-Virus-Scanned: Debian amavisd-new at mail.arccn.ru
Received: from mail.arccn.ru ([127.0.0.1])
	by localhost (mail.arccn.ru [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ePWO-b5jztuq for <qemu-trivial@nongnu.org>;
	Thu, 17 Apr 2014 01:19:56 +0400 (MSK)
Received: from [192.168.1.124] (ppp91-79-241-175.pppoe.mtu-net.ru
	[91.79.241.175])
	by mail.arccn.ru (Postfix) with ESMTPSA id 4BA82A0091;
	Thu, 17 Apr 2014 01:19:52 +0400 (MSK)
Message-ID: <534EF3F4.7080803@arccn.ru>
Date: Thu, 17 Apr 2014 01:19:48 +0400
From: Igor Ryzhov <iryzhov@arccn.ru>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Weil <sw@weilnetz.de>
References: <1397655787-27780-1-git-send-email-iryzhov@arccn.ru>
	<534EBEC1.9070801@weilnetz.de>
	<CAFEAcA8xSPkrAhG8c_FjoXh2qcYL0C32pPH9dHTjg-wAcprgfw@mail.gmail.com>
In-Reply-To: <CAFEAcA8xSPkrAhG8c_FjoXh2qcYL0C32pPH9dHTjg-wAcprgfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 95.182.74.2
X-Mailman-Approved-At: Thu, 17 Apr 2014 08:57:23 -0400
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Unnecessary comma.
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
X-List-Received-Date: Wed, 16 Apr 2014 21:20:11 -0000

Oh, my mistake.
It's really semicolon, not comma :)

Should I resend the patch with correct name?

16.04.2014 21:58, Peter Maydell =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 16 April 2014 18:32, Stefan Weil <sw@weilnetz.de> wrote:
>> Am 16.04.2014 15:43, schrieb Igor Ryzhov:
>>> Signed-off-by: Igor Ryzhov <iryzhov@arccn.ru>
>>> ---
>>>   net/net.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/net/net.c b/net/net.c
>>> index e3ef1e4..60a07f1 100644
>>> --- a/net/net.c
>>> +++ b/net/net.c
>>> @@ -473,7 +473,7 @@ ssize_t qemu_deliver_packet(NetClientState *sende=
r,
>>>
>>>       if (ret =3D=3D 0) {
>>>           nc->receive_disabled =3D 1;
>>> -    };
>>> +    }
>>>
>>>       return ret;
>>>   }
>>>
>> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>>
>> CC'ing qemu-trivial
>>
>> PS. The "." at the end of your subject line is unnecessary, too. :-)
> "net/net.c: Remove unnecessary semicolon" would probably
> be better (since it lets people know which area the patch is affecting
> and also gets the name of the punctuation mark right ;-)).
>
> thanks
> -- PMM


