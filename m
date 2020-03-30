Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jIwxv-0004Z2-Q2
	for mharc-qemu-trivial@gnu.org; Mon, 30 Mar 2020 12:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jIwxs-0004Ty-HO
 for qemu-trivial@nongnu.org; Mon, 30 Mar 2020 12:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jIwxq-000334-Mq
 for qemu-trivial@nongnu.org; Mon, 30 Mar 2020 12:08:40 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:59898)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jIwxq-00031F-ID
 for qemu-trivial@nongnu.org; Mon, 30 Mar 2020 12:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585584517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qhkhTcy4qzrCoHLcXT9dI7qqKtnV+QGOJ2gWOZbClPc=;
 b=fs3TiBk98wtESEQK0Di2lPcpsuN7LYjwcL5jyIrrJo/n144fdwfrdLSbBxhrzZnw9gvKhz
 iFtmEaHm5sO1sfURy/Mx7iSkAVGH1SAyZ5ydWYBdf30vnNqxxOjM3nOElAjJeXys/o/GFi
 +CAz292VoqjDss38iVY9/dIU20ta650=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-UMcPobGKMnCesPXXHGVbpA-1; Mon, 30 Mar 2020 12:08:35 -0400
X-MC-Unique: UMcPobGKMnCesPXXHGVbpA-1
Received: by mail-wr1-f72.google.com with SMTP id q14so1950718wro.7
 for <qemu-trivial@nongnu.org>; Mon, 30 Mar 2020 09:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X+7TDFCHmUZvDZWPMbYpAkyP3dimyIWbo9ovfDsvyq4=;
 b=I11oC1+6i5OQiKewxZGyuiudCmilbXHqy/jDHgJdrU014ceIr6q/ZWLLCPfiMGHsgo
 Ji7DBMkt6MpupMGbTJirCHkLGoml6gwChBdqmRR13zERjOTKXfkv7e2ozsfhTwMRRx+f
 B6Tl2DtHkp5ovIp007lz7Rb9qqYVHIp2XQcvqFJAc9TzhgkyVbP9RIdTlXuwHheyBbcR
 zEOPtV0Ox2N8RWl8zJWuXGuRbcHqr1+C3LNn3OlebozcgyLo9O08IbMb1B0jOh4T/7Bg
 QhepLHzXwFePKVY9l6PgWkT1T0Rxr8MMo37/4pcq5F4fZO3gyyFlPert1ykqilN+c7NM
 bwPA==
X-Gm-Message-State: ANhLgQ3XnF1hxz77vIG1IcDBLc/u0AUShhBqcTzBHVGGPcAj4eKBjsk+
 H9sZx275dnAth8TBatXYWoOCP+w6UBCdGL8+0XI75R0YCXA9LqcelUqZ4LcwmgYHXHxLIw5dlvo
 hgaCp0VLhsnV5zRza8Q==
X-Received: by 2002:a1c:5fc4:: with SMTP id t187mr14344wmb.81.1585584514072;
 Mon, 30 Mar 2020 09:08:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vssUTjWXiwssCiVu/QIn1gpEQS1B418myWSrfxJzvPVret0dxs4K7Rs6M5Tx/5q3KI6sOw6eQ==
X-Received: by 2002:a1c:5fc4:: with SMTP id t187mr14313wmb.81.1585584513813;
 Mon, 30 Mar 2020 09:08:33 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id v7sm20406318wrs.96.2020.03.30.09.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2020 09:08:33 -0700 (PDT)
Subject: Re: [PATCH-for-5.0] qga-posix: Avoid crashing process when failing to
 allocate memory
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Dietmar Maurer <dietmar@proxmox.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Sameeh Jubran <sjubran@redhat.com>,
 qemu-stable@nongnu.org, Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>,
 Basil Salman <basil@daynix.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20200324194836.21539-1-philmd@redhat.com>
 <1242083041.1.1585117162620@webmail.proxmox.com>
 <6be54d1f-e5fc-5b34-ba4d-fa050029f26b@redhat.com>
 <87mu7yue35.fsf@dusky.pond.sub.org>
 <81317f7f-7de9-f616-27dc-c389f06792c3@redhat.com>
Message-ID: <7f67ab75-5f7c-e0b8-2dd3-4e573a8d3f68@redhat.com>
Date: Mon, 30 Mar 2020 18:08:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <81317f7f-7de9-f616-27dc-c389f06792c3@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
X-List-Received-Date: Mon, 30 Mar 2020 16:08:42 -0000

On 3/30/20 6:04 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Cc'ing the ppl who responded the thread you quoted.
>=20
> On 3/30/20 4:11 PM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>  > ---
>  >=C2=A0=C2=A0 qga/commands-posix.c | 8 +++++++-
>  >=C2=A0=C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>  >
>  > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>  > index 93474ff770..8f127788e6 100644
>  > --- a/qga/commands-posix.c
>  > +++ b/qga/commands-posix.c
>  > @@ -493,7 +493,13 @@ struct GuestFileRead=20
> *qmp_guest_file_read(int64_t handle, bool has_count,
>  >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfh->state=
 =3D RW_STATE_NEW;
>  >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>  >
>  > -=C2=A0=C2=A0=C2=A0 buf =3D g_malloc0(count+1);
>  > +=C2=A0=C2=A0=C2=A0 buf =3D g_try_malloc0(count + 1);
>  > +=C2=A0=C2=A0=C2=A0 if (!buf) {
>  > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp,
>  > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed to allocate sufficient memo=
ry "
>  > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "to complete the requested service"=
);
>  > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>  > +=C2=A0=C2=A0=C2=A0 }
>  >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 read_count =3D fread(buf, 1, count=
, fh);
>  >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ferror(fh)) {
>  >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg=
_errno(errp, errno, "failed to read file");
>  >
>=20
>>> On 3/25/20 7:19 AM, Dietmar Maurer wrote:
>>>> but error_setg() also calls malloc, so this does not help at all?
>>>
>>> IIUC the problem, you can send a QMP command to ask to read let's say
>>> 3GB of a file, and QEMU crashes. But this doesn't mean there the .heap
>>> is empty, there is probably few bytes still available, enough to
>>> respond with an error message.
>>
>> We've discussed how to handle out-of-memory conditions many times.
>> Here's one instance:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 Subject: When it's okay to treat OOM as fatal?
>> =C2=A0=C2=A0=C2=A0=C2=A0 Message-ID: <87efcqniza.fsf@dusky.pond.sub.org>
>>     =20
>> https://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg03212.html
>>
>> No improvement since then; there's no guidance on when to check for OOM.
>> Actual code tends to check only "large" allocations (for subjective
>> values of "large").
>>
>> I reiterate my opinion that whatever OOM handling we have is too
>> unreliable to be worth much, since it can only help when (1) allocations
>> actually fail (they generally don't[*]), and (2) the allocation that
>> fails is actually handled (they generally aren't), and (3) the handling
>> actually works (we don't test OOM, so it generally doesn't).
>>
>>
>> [*] Linux overcommits memory, which means malloc() pretty much always
>> succeeds, but when you try to use "too much" of the memory you
>> supposedly allocated, a lethal signal is coming your way.=C2=A0 Reasd th=
e
>> thread I quoted for examples.
>=20
> So this patch takes Stefan reasoning:
> https://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg03525.html
>=20
>  =C2=A0 My thinking has been to use g_new() for small QEMU-internal struc=
tures
>  =C2=A0 and g_try_new() for large amounts of memory allocated in response=
 to
>  =C2=A0 untrusted inputs.=C2=A0 (Untrusted inputs must never be used for =
unbounded
>  =C2=A0 allocation sizes but those bounded sizes can still be large.)
>=20
> In any cases (malloc/malloc_try) we have a denial of service=20
> (https://www.openwall.com/lists/oss-security/2018/10/17/4) and the=20
> service is restarted.
>=20
> Daniel suggests such behavior should be catched by external firewall=20
> guard (either on the process or on the network). This seems out of scope=
=20
> of QEMU and hard to fix.
>=20
> So, can we improve something? Or should we let this code as it?

But if we don't want to modify this code, we should document somewhere=20
that maintstream QEMU doesn't care about DoS and it is the=20
responsibility to protect it with something else...


