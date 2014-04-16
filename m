Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WaU6a-0006ks-33
	for mharc-qemu-trivial@gnu.org; Wed, 16 Apr 2014 13:58:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WaU6T-0006ja-Lx
	for qemu-trivial@nongnu.org; Wed, 16 Apr 2014 13:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WaU6P-0008DJ-DG
	for qemu-trivial@nongnu.org; Wed, 16 Apr 2014 13:58:33 -0400
Received: from mail-la0-f52.google.com ([209.85.215.52]:47181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WaU6P-0008D4-64
	for qemu-trivial@nongnu.org; Wed, 16 Apr 2014 13:58:29 -0400
Received: by mail-la0-f52.google.com with SMTP id ec20so8201230lab.25
	for <qemu-trivial@nongnu.org>; Wed, 16 Apr 2014 10:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sa0BBju9pnwJt3EY9ThiKGDiQjLvIY99a/9LO8vW79I=;
	b=PkrXUpy6x3m6reRURgCTIPJxutZVP3XE2gFYXAzeV5LvMzYUkV4Lg5/ywFcFxc/wPT
	qiGfZdwqAfC1UTJ+ro1SY2UnpjN+xuo1V31ER8+oq5TX8VF8MEQrYkcqnNDVFUwM5Tg8
	GZCNKWeuxRe4bXHckyLdlEGfcEeleq59FbjJWjpknnTkT5PvlQRuqvBmeovMgPDwMF4P
	GVxAbuIoNRbk2ntShw/grjrTjXatmqtIAHMbyTPwQMX3USI9PHoKkntNmOG3AWutOCA0
	s5gffN4vCRzNVJzh+vZw4VIC77yQxI6HrjErRcT983X0UY0mx82HalFupQsH101v/Jht
	1Qpw==
X-Gm-Message-State: ALoCoQl9p90DQUztThSkg/NpQnLjEXkxHz80MuURm40gqE3VdYsozT5caL/gkaaWoLqN85h8KyDM
X-Received: by 10.152.18.170 with SMTP id x10mr2108530lad.55.1397671107904;
	Wed, 16 Apr 2014 10:58:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Wed, 16 Apr 2014 10:58:07 -0700 (PDT)
In-Reply-To: <534EBEC1.9070801@weilnetz.de>
References: <1397655787-27780-1-git-send-email-iryzhov@arccn.ru>
	<534EBEC1.9070801@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Apr 2014 18:58:07 +0100
Message-ID: <CAFEAcA8xSPkrAhG8c_FjoXh2qcYL0C32pPH9dHTjg-wAcprgfw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.52
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Igor Ryzhov <iryzhov@arccn.ru>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
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
X-List-Received-Date: Wed, 16 Apr 2014 17:58:38 -0000

On 16 April 2014 18:32, Stefan Weil <sw@weilnetz.de> wrote:
> Am 16.04.2014 15:43, schrieb Igor Ryzhov:
>> Signed-off-by: Igor Ryzhov <iryzhov@arccn.ru>
>> ---
>>  net/net.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/net/net.c b/net/net.c
>> index e3ef1e4..60a07f1 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -473,7 +473,7 @@ ssize_t qemu_deliver_packet(NetClientState *sender,
>>
>>      if (ret == 0) {
>>          nc->receive_disabled = 1;
>> -    };
>> +    }
>>
>>      return ret;
>>  }
>>
>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>
> CC'ing qemu-trivial
>
> PS. The "." at the end of your subject line is unnecessary, too. :-)

"net/net.c: Remove unnecessary semicolon" would probably
be better (since it lets people know which area the patch is affecting
and also gets the name of the punctuation mark right ;-)).

thanks
-- PMM

