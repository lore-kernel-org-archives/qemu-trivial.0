Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoQ0w-0003Hw-WC
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 06:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51705)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hoQ0u-0003F1-Iy
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 06:21:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hoQ0t-0000Oj-IB
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 06:21:20 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38209)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hoQ0t-0000O7-Ce
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 06:21:19 -0400
Received: by mail-wm1-f66.google.com with SMTP id s15so7141046wmj.3
 for <qemu-trivial@nongnu.org>; Fri, 19 Jul 2019 03:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RILE1iZpMYXfF8OwS6dKminfjIGlAG6jhJeAundloEM=;
 b=kHzijReCrSxVbCHtAQ2W7ASH7hSPUm0dfXCD49QACKytNiV4KqnWpo999Czg3NgXZC
 qfZLdcUUQ6EXV99t0YtPSWAOUhk06VSWixMsyaoy2JdTZsp68mY9wjTel3aJxh2JvmCT
 02Jwl2UbB2gBppgNpEmagTjfhA9YugXazO9bJmZfKS1M+wEK/46l0J5CoX8HUY7ytTVp
 1KRdgN4yR5vWvsT1BMzT6215HEWDmzHlp13S78jFhtlVU24p1kP+/vUc4axxEKZHAxJh
 Q95hvVk9CXKc+ch+IpJz4bGfdBfrNzn2cTTNlDGnxEzXgkvUcHPmZXpq6ERIEBGrp1d9
 IfpA==
X-Gm-Message-State: APjAAAV6V+j9dfRU11ew0+lG6HZqXcAlw690mDTy38QQHte5/stWXEGT
 815rO3eW8Or8Y8Cbd+FCdqA8eQ==
X-Google-Smtp-Source: APXvYqw+LEsLriVeCMSW4dh3XgT/gokUV0pAoIyjS923gO8qn4nZpvIyoByaVNq8pfgLG/+yhirfog==
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr48978539wma.41.1563531677915; 
 Fri, 19 Jul 2019 03:21:17 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id c1sm59315666wrh.1.2019.07.19.03.21.16
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 03:21:17 -0700 (PDT)
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <20190718193441.12490-1-sw@weilnetz.de>
 <6241fd95-789f-f560-2170-0544cded1720@redhat.com>
 <CAL1e-=h01=ouAuTiPK7mGqCJVX4C-WQUEVZngFBG5nthDQ936g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <da7e8484-246b-45e6-3790-7d3e8407bf37@redhat.com>
Date: Fri, 19 Jul 2019 12:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=h01=ouAuTiPK7mGqCJVX4C-WQUEVZngFBG5nthDQ936g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] audio: Add missing fall
 through comments
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
X-List-Received-Date: Fri, 19 Jul 2019 10:21:21 -0000

On 7/19/19 9:43 AM, Aleksandar Markovic wrote:
> 
> On Jul 19, 2019 9:30 AM, "Philippe Mathieu-Daudé" <philmd@redhat.com
> <mailto:philmd@redhat.com>> wrote:
>>
>> On 7/18/19 9:34 PM, Stefan Weil wrote:
>> > Signed-off-by: Stefan Weil <sw@weilnetz.de <mailto:sw@weilnetz.de>>
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com
> <mailto:philmd@redhat.com>>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com
> <mailto:philmd@redhat.com>>
>>
> 
> Philippe, how do you test these comments?

The testing is quite easy since it doesn't build with
'-Wimplicit-fallthrough=2':

  CC      audio/audio.o
/home/phil/source/qemu/audio/audio.c: In function ‘audio_pcm_init_info’:
/home/phil/source/qemu/audio/audio.c:308:14: error: this statement may
fall through [-Werror=implicit-fallthrough=]
  308 |         sign = 1;
      |         ~~~~~^~~
/home/phil/source/qemu/audio/audio.c:309:5: note: here
  309 |     case AUDIO_FORMAT_U16:
      |     ^~~~
/home/phil/source/qemu/audio/audio.c:315:14: error: this statement may
fall through [-Werror=implicit-fallthrough=]
  315 |         sign = 1;
      |         ~~~~~^~~
/home/phil/source/qemu/audio/audio.c:316:5: note: here
  316 |     case AUDIO_FORMAT_U32:
      |     ^~~~
cc1: all warnings being treated as errors

With Stefan patch applied:

  CC      audio/audio.o
  CC      audio/audio_legacy.o
  CC      audio/noaudio.o
  CC      audio/wavaudio.o
  CC      audio/mixeng.o
  CC      audio/spiceaudio.o
  CC      audio/wavcapture.o
[...]

> 
> Yours, Aleksandar
> 
>> > ---
>> >  audio/audio.c | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/audio/audio.c b/audio/audio.c
>> > index 5fd9a58a80..a7a13e900a 100644
>> > --- a/audio/audio.c
>> > +++ b/audio/audio.c
>> > @@ -304,6 +304,7 @@ void audio_pcm_init_info (struct audio_pcm_info
> *info, struct audsettings *as)
>> > 
>> >      case AUDIO_FORMAT_S16:
>> >          sign = 1;
>> > +        /* fall through */
>> >      case AUDIO_FORMAT_U16:
>> >          bits = 16;
>> >          shift = 1;
>> > @@ -311,6 +312,7 @@ void audio_pcm_init_info (struct audio_pcm_info
> *info, struct audsettings *as)
>> > 
>> >      case AUDIO_FORMAT_S32:
>> >          sign = 1;
>> > +        /* fall through */
>> >      case AUDIO_FORMAT_U32:
>> >          bits = 32;
>> >          shift = 2;
>> >
>>
> 

