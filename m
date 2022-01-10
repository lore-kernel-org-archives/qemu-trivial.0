Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6z7c-0007EC-81
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jan 2022 13:10:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n6z7V-0007B2-0J
 for qemu-trivial@nongnu.org; Mon, 10 Jan 2022 13:10:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n6z7R-0000oZ-DX
 for qemu-trivial@nongnu.org; Mon, 10 Jan 2022 13:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641838207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w/QK7eXVlTY6YqofVDReUKCT0BobRz4TTDioq1E7w2g=;
 b=FMwLfuIBlmC7oczqW4cT2a6WYrhYmpYpicTNrmKryoDygJPOkYFh9SGrL0Uz8cB/BhwG/Z
 UDh/uDwVrUypns2Hts0IurYplF1MMcXXVQae3AE8ngNhpVF0B1vNO6NPtEJi2IYIAaP1NU
 PcUHeBlgqvAhM+UoUTSy3E11Ndou6iQ=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-Y3aaFkS7McSv0aIBtFHowA-1; Mon, 10 Jan 2022 13:10:06 -0500
X-MC-Unique: Y3aaFkS7McSv0aIBtFHowA-1
Received: by mail-ua1-f69.google.com with SMTP id
 v13-20020ab05b4d000000b003041993723cso8124482uae.10
 for <qemu-trivial@nongnu.org>; Mon, 10 Jan 2022 10:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/QK7eXVlTY6YqofVDReUKCT0BobRz4TTDioq1E7w2g=;
 b=fg10SiJZuCgdUH49/fJVUFjsxGWduy4vxFiy1H2Ffhvu0T7UxoLZPi175D2HPaKoZV
 unGXBP+PWzmhMK0jynXt0hDdN6oHsLktnKr5PRD3wu+C4kMILHPw1joYoU7Yykpl77Eu
 bWVlrx5KdgM1eQeYvnjUrwSvYc5aRezO4r6aWVE0DWjv7jc6Ra7d8LZkYW41RHwQhVHM
 gDn7liNM5uqkP3LomTi4ZGrSBoimmcBUifRRFduOq+in6gydFZ2hDMdfJuuR4SKsWyTW
 2GfQU853CFIdvFpQAg7zr8bn2LmHhb8l37mm9RKLQNG5PHoGh1rtpJltyvQUoWNBhNd2
 V7VA==
X-Gm-Message-State: AOAM531o1CiK0jJOAlKQ3QOg2DdByNdRZXiN+/MDFzrf/QxP43OkqPsz
 gMnIXLXNk4KJZqA8vyTMn7nTK0HncU/AFktp+eg3LKGY+5bksNls6m0OzZy2w79056/7uY5uk0i
 24ibVJORz1LUWFY+9Ga9fJZw76oG0VHpdZQ==
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr191674vst.61.1641838205868; 
 Mon, 10 Jan 2022 10:10:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxM4FxRNlaY4Ow69pjmvB1uxwI/dxN0FD4zpztT/p608+3aGMSxisvLbhApUxXaLSdMM89pgyWnVMb50f6C50o=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr191668vst.61.1641838205699; 
 Mon, 10 Jan 2022 10:10:05 -0800 (PST)
MIME-Version: 1.0
References: <20220107153019.504124-1-sw@weilnetz.de>
 <CAFn=p-ZYr+D54GzYKt5cxuJQQTARGQTvkkgVfhLGEeLczFt-Tw@mail.gmail.com>
 <42ac8990-8733-fa68-c4b4-c54a82ce43f9@weilnetz.de>
In-Reply-To: <42ac8990-8733-fa68-c4b4-c54a82ce43f9@weilnetz.de>
From: John Snow <jsnow@redhat.com>
Date: Mon, 10 Jan 2022 13:09:55 -0500
Message-ID: <CAFn=p-bgXrmUj9NXM3uKfi9V_YSDQA1_b8e-yGXrN5=G8eyYyw@mail.gmail.com>
Subject: Re: [PATCH] simplebench: Fix Python syntax error (reported by LGTM)
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000079b0505d53e3f6f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jan 2022 18:10:14 -0000

--000000000000079b0505d53e3f6f
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 12:57 PM Stefan Weil <sw@weilnetz.de> wrote:

> Am 10.01.22 um 18:08 schrieb John Snow:
>
> On Fri, Jan 7, 2022 at 10:32 AM Stefan Weil <sw@weilnetz.de> wrote:
>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  scripts/simplebench/bench-example.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/simplebench/bench-example.py
>> b/scripts/simplebench/bench-example.py
>> index 4864435f39..fc370691e0 100644
>> --- a/scripts/simplebench/bench-example.py
>> +++ b/scripts/simplebench/bench-example.py
>> @@ -25,7 +25,7 @@
>>
>>  def bench_func(env, case):
>>      """ Handle one "cell" of benchmarking table. """
>> -    return bench_block_copy(env['qemu_binary'], env['cmd'], {}
>> +    return bench_block_copy(env['qemu_binary'], env['cmd'], {},
>>                              case['source'], case['target'])
>>
>>
>> --
>> 2.30.2
>>
>
> Good spot. If it's not too late and not a hassle, can you add a fixes:
> commit-id in the commit message? No big deal if not.
>
> Reviewed-by: John Snow <jsnow@redhat.com>
>
>
> Maybe that can be added locally to avoid a V2 patch. Here it is:
>
> Fixes: b2fcb0c5754c2554b8406376e99a75e9e0a6b7bd
>
> Thanks,
>
> Stefan
>
>
> Got it. I just got back from holiday today, so there's still lots of mail
to catch up on. If nobody else has staged this, I will do so as part of my
python fixes this week. Thanks!

--js

--000000000000079b0505d53e3f6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 10, 2022 at 12:57 PM Stef=
an Weil &lt;<a href=3D"mailto:sw@weilnetz.de">sw@weilnetz.de</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>Am 10.01.22 um 18:08 schrieb John Snow:<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">On Fri, Jan 7, 2022 at 10:32 AM Stefan Weil &lt;<a h=
ref=3D"mailto:sw@weilnetz.de" target=3D"_blank">sw@weilnetz.de</a>&gt; wrot=
e:<br>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote">Signed-off-by: Stefan Weil
            &lt;<a href=3D"mailto:sw@weilnetz.de" target=3D"_blank">sw@weil=
netz.de</a>&gt;<br>
            ---<br>
            =C2=A0scripts/simplebench/bench-example.py | 2 +-<br>
            =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
            diff --git a/scripts/simplebench/bench-example.py
            b/scripts/simplebench/bench-example.py<br>
            index 4864435f39..fc370691e0 100644<br>
            --- a/scripts/simplebench/bench-example.py<br>
            +++ b/scripts/simplebench/bench-example.py<br>
            @@ -25,7 +25,7 @@<br>
            <br>
            =C2=A0def bench_func(env, case):<br>
            =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot; Handle one &quot;cell&qu=
ot; of benchmarking table. &quot;&quot;&quot;<br>
            -=C2=A0 =C2=A0 return bench_block_copy(env[&#39;qemu_binary&#39=
;], env[&#39;cmd&#39;],
            {}<br>
            +=C2=A0 =C2=A0 return bench_block_copy(env[&#39;qemu_binary&#39=
;], env[&#39;cmd&#39;],
            {},<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case[&#39;source&#39;], case[&#39;=
target&#39;])<br>
            <br>
            <br>
            -- <br>
            2.30.2<br>
          </blockquote>
          <div><br>
          </div>
          <div>Good spot. If it&#39;s not too late and not a hassle, can yo=
u
            add a fixes: commit-id in the commit message? No big deal if
            not.</div>
          <div><br>
          </div>
          <div>Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.co=
m" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Maybe that can be added locally to avoid a V2 patch. Here it is:<br>
    </p>
    <p>Fixes: b2fcb0c5754c2554b8406376e99a75e9e0a6b7bd</p>
    <p>Thanks,</p>
    <p>Stefan</p>
    <p><br></p></div></blockquote><div>Got it. I just got back from holiday=
 today, so there&#39;s still lots of mail to catch up on. If nobody else ha=
s staged this, I will do so as part of my python fixes this week. Thanks!</=
div><div><br></div><div>--js<br></div></div></div>

--000000000000079b0505d53e3f6f--


