Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQwav-0003Tk-8K
	for mharc-qemu-trivial@gnu.org; Wed, 15 May 2019 12:17:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQwat-0003T3-1p
	for qemu-trivial@nongnu.org; Wed, 15 May 2019 12:17:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQwas-0001yB-2i
	for qemu-trivial@nongnu.org; Wed, 15 May 2019 12:17:27 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hQwar-0001v7-SM
	for qemu-trivial@nongnu.org; Wed, 15 May 2019 12:17:26 -0400
Received: by mail-wr1-f66.google.com with SMTP id l2so140057wrb.9
	for <qemu-trivial@nongnu.org>; Wed, 15 May 2019 09:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aeg8SVa8lIu3q85B2yqngTt8oZntQqVn91puRt3wQOI=;
	b=E1uJTM9Js1UtGVPHMXkG5UQ++AOeN2My8T1TAw1Tv0nwENYePxYQ/yn9Tk9pWt4Fmd
	Wp4KGo+wqsWMdX4vpATZ4ROqoYjXNY9DmPcK3SgWJVqGH2LJLmxBhl5zJ95rKe4j3tlc
	jworwkAVer+3ZIf3wi9tz90UsFJabCeOt6VEqoIIramkjsTuGPbw2OF0U7kyto29LMeF
	S6pgFikqLkXWsXbhoT7gkiE0TeAtqB1nyQWbfAgAovYcG8jMX9wgpdhtBJjEblWYwydy
	eT6RjRpRAmDHtMsO7h/ZylDBIFy4KBojx+A5sMtcKfeESkcuY3dclfNO8P7Iyme/vK87
	9frA==
X-Gm-Message-State: APjAAAWAxjbay0fnUSs2Qgsbg3pKhISVgal3UMLDUwRSSup+KLJ8CjMF
	Ykh6U21/1nXkfJ3gwxB9u9CvZA==
X-Google-Smtp-Source: APXvYqxgptbLBnmKKZCvLjjrb9uxi4Z0N/z5YGqvmi9ZgS32pydqygzXXVM8wp9zsDf1bxgZIVTa1w==
X-Received: by 2002:adf:f743:: with SMTP id z3mr11911141wrp.129.1557937044045; 
	Wed, 15 May 2019 09:17:24 -0700 (PDT)
Received: from [192.168.1.43] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228])
	by smtp.gmail.com with ESMTPSA id 88sm4911031wrc.33.2019.05.15.09.17.23
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 May 2019 09:17:23 -0700 (PDT)
To: Stefano Garzarella <sgarzare@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20190515090805.44785-1-sgarzare@redhat.com>
	<875zqb7v9c.fsf@dusky.pond.sub.org>
	<20190515130100.rth7dnluusk75v23@steredhat>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <611f79b2-a01a-c17e-08ed-5a5bdd17b5d6@redhat.com>
Date: Wed, 15 May 2019 18:17:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515130100.rth7dnluusk75v23@steredhat>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] net/slirp: fix the IPv6
 prefix length error message
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
X-List-Received-Date: Wed, 15 May 2019 16:17:28 -0000

On 5/15/19 3:01 PM, Stefano Garzarella wrote:
> On Wed, May 15, 2019 at 02:33:03PM +0200, Markus Armbruster wrote:
>> Stefano Garzarella <sgarzare@redhat.com> writes:
>>
>>> Reword and add a missing parentheses at the end of the
>>> error message.
>>>
>>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>> v2:
>>>   - Reworded the error message (Markus)
>>>   - Added Marc-André's R-b
>>>     I made a little change to the error message, let me now
>>>     if I should remove yuor R-b.
>>> ---
>>>  net/slirp.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/net/slirp.c b/net/slirp.c
>>> index 95934fb36d..b34cb29276 100644
>>> --- a/net/slirp.c
>>> +++ b/net/slirp.c
>>> @@ -498,7 +498,8 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>>>      }
>>>      if (vprefix6_len < 0 || vprefix6_len > 126) {
>>>          error_setg(errp,
>>> -                   "Invalid prefix provided (prefix len must be in range 0-126");
>>> +                   "Invalid IPv6 prefix provided "
>>> +                   "(IPv6 prefix length must be between 0 and 126)");
>>>          return -1;
>>>      }
>>
>> "Parameter 'ipv6-prefixlen' expects a value between 0 and 126" would be
>> closer to how we report similar errors elsewhere.
> 
> This error is shown when 'ipv6-net' or 'ipv6-prefixlen' parameters are
> used, so I preferred to leave a more generic error to fit both cases.
> 
>>
>> Regardless:
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


