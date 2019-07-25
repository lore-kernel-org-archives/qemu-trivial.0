Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hqbTS-00064a-9J
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jul 2019 06:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41965)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqbTQ-00063d-Az
 for qemu-trivial@nongnu.org; Thu, 25 Jul 2019 06:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqbTP-0007m2-6H
 for qemu-trivial@nongnu.org; Thu, 25 Jul 2019 06:59:48 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33955)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqbTO-0007k1-V9
 for qemu-trivial@nongnu.org; Thu, 25 Jul 2019 06:59:47 -0400
Received: by mail-wm1-f68.google.com with SMTP id w9so35493098wmd.1
 for <qemu-trivial@nongnu.org>; Thu, 25 Jul 2019 03:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=soIWWHrLvhZt3MjKgXrRXvRwi32B3m+Tq+Pj6WkIRsQ=;
 b=oUTVdLg92YrvSa4mElVJh/GFgv9cv+eIoKFUBkv04pitIIuHC7zRVzPueVoB356tOl
 FbKAJH9lis1SVa/nBWtBZo6Yoy45yPNPR+IUFn3/RX29He0Klgv0J668p0H+3tn9iYb4
 WaOPhwMOeYqFrom9a1bBQuHRQmDRkIVI+47ggerZmBeX3j3kzDKOEb1MczOta8ER420w
 M0j2lYKPzol8LJFL402xKVWTb3i/Q9nxGvBQ54XAAxOqQ5ByP+0BHKmm7HY2VbeTvDXY
 s11XqILMsVQWoTtxvGIEK6i6YXBCi0hxvbZYd+7XDbu+G4wRi7dcFBFGFvmoU/dirsZw
 VnNQ==
X-Gm-Message-State: APjAAAWselPfRSVnkKoWu6vSLCE4D0b/Y8PAtbgn330ZtkrJLS5uJTWd
 Ea+IoEJORKuVcS3mZ+fGdJYcLw==
X-Google-Smtp-Source: APXvYqz2Zc7xgRdAXv8q0ApOTaM99s7PbHV5qfyyGNApEPl2wfconyDw+SLIDXQOS5flnkIQqKLWxw==
X-Received: by 2002:a1c:f90f:: with SMTP id x15mr2510391wmh.69.1564052385886; 
 Thu, 25 Jul 2019 03:59:45 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id g131sm34155252wmf.37.2019.07.25.03.59.44
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 03:59:45 -0700 (PDT)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20190719131425.10835-1-philmd@redhat.com>
 <20190719131425.10835-4-philmd@redhat.com>
 <6ff431d9-36bd-27a1-077b-b2cb1331750d@redhat.com>
 <bc3dc756-23a8-48a3-02ca-abaae6d0db96@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <bc3713cf-0e5c-52ed-c00c-fe4e24be608d@redhat.com>
Date: Thu, 25 Jul 2019 12:59:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <bc3dc756-23a8-48a3-02ca-abaae6d0db96@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH-for-4.1 3/7]
 hw/block/pflash_cfi02: Rewrite a fall through comment
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
X-List-Received-Date: Thu, 25 Jul 2019 10:59:49 -0000

On 7/25/19 2:27 AM, John Snow wrote:
> On 7/22/19 7:43 AM, Philippe Mathieu-Daudé wrote:
>> On 7/19/19 3:14 PM, Philippe Mathieu-Daudé wrote:
>>> GCC9 is confused by this comment when building with CFLAG
>>> -Wimplicit-fallthrough=2:
>>>
>>>   hw/block/pflash_cfi02.c: In function ‘pflash_write’:
>>>   hw/block/pflash_cfi02.c:574:16: error: this statement may fall through [-Werror=implicit-fallthrough=]
>>>     574 |             if (boff == 0x55 && cmd == 0x98) {
>>>         |                ^
>>>   hw/block/pflash_cfi02.c:581:9: note: here
>>>     581 |         default:
>>>         |         ^~~~~~~
>>>   cc1: all warnings being treated as errors
>>>
>>> Rewrite the comment using 'fall through' which is recognized by
>>> GCC and static analyzers.
>>>
>>> Reported-by: Stefan Weil <sw@weilnetz.de>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  hw/block/pflash_cfi02.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
>>> index f68837a449..42886f6af5 100644
>>> --- a/hw/block/pflash_cfi02.c
>>> +++ b/hw/block/pflash_cfi02.c
>>> @@ -577,7 +577,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
>>>                  pfl->cmd = 0x98;
>>>                  return;
>>>              }
>>> -            /* No break here */
>>> +            /* fall through */
>>>          default:
>>>              DPRINTF("%s: invalid write for command %02x\n",
>>>                      __func__, pfl->cmd);
>>>
>>
>> Queued to pflash/next, thanks.
>>
> 
> Are you queueing everything or just this one patch? It would be a little
> inconvenient to split a series up like that.

Oops I simply queued this particular one.

> (Most other maintainers will, I believe, expect that with an "ACK" or
> similar that someone else will stage the series.)

I thought these are not critical bugfixes for 4.1, but since I had to do
a pull request for pflash, I could include it. (I already noticed
maintainers queueing particular patches from cleanup series).

Next time I'll ping/wait.

Regards,

Phil.

