Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jJH12-0001c9-CD
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2020 09:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jJH0y-0001UH-Vm
 for qemu-trivial@nongnu.org; Tue, 31 Mar 2020 09:33:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jJH0x-0002i1-BF
 for qemu-trivial@nongnu.org; Tue, 31 Mar 2020 09:33:12 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47327
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jJH0x-0002hk-70
 for qemu-trivial@nongnu.org; Tue, 31 Mar 2020 09:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585661590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZW8BELpErbfIZ5vqbKU/q+KDqhcpowe4mJlkPn/sBQ=;
 b=dVifq9IVX0DomPMQjF/Zv9CuRaUqfeNU1oBN71CsLDjQSeNN9uyLrJeMHCwIYLtlG+/GUK
 99GXyEVRXVfk35azQ11Gysj6gmBQZjT8to+UqWqGZlwYYn46m9NKKn9LHQGVyuHPAOCAZM
 9cEtN6rHRzGmxrdhAenO7Zb37Hj8olA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-2qj7Zc0EM6SMb8E6T9GcIw-1; Tue, 31 Mar 2020 09:33:04 -0400
X-MC-Unique: 2qj7Zc0EM6SMb8E6T9GcIw-1
Received: by mail-ed1-f72.google.com with SMTP id w6so18728025edq.3
 for <qemu-trivial@nongnu.org>; Tue, 31 Mar 2020 06:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UPjHZGzsjhZ8Es1AfL+yP2KJXoUcvMQJc6VPweBlQcs=;
 b=Y0RI1z2McpVRBkZ/DP0yJMG3nEE8jxFH+2vLRQ/1+8IFauHHrEa0EcNtN+1hs4qT/b
 GkFdDr+f4eLSAuTX87zkgfcMqKFCI/oCsf/VmXCRRvH3QLstsykQs8yJfX7r+KMc6XH9
 REtiL00VqO0aZZRVuV902lrkRAU3FdUa6TdoRRbTwHonR2oSZZnlf1wsGZYOOWg3jPvx
 qRGbDGUaKTyMf9aL7Vod2uj1j4emJ6azAfgIRUv3DN0AsM5N/n5C2XzrNIAZHwb1OrrA
 jJrht2/ryoxDwtdCFF9D/2ZdQXb6HXzNTeemB9scDEPWZU1UCrAePFiudnjTdU87lArr
 c1LA==
X-Gm-Message-State: ANhLgQ1HmZ8GP+b5BHP9ME+DVkkxsU+JIBBUYX5U/jW6J1pxdNPj54Eq
 runz/u5ZqWSJJWualvu6fYud/alEdHOeIvT8M1KheGCoUet4/ZtVN8NTxo5HwScLqBlRw02USUJ
 MSh0qvx2RUH3irqVRng==
X-Received: by 2002:a17:906:398:: with SMTP id
 b24mr13911972eja.243.1585661582595; 
 Tue, 31 Mar 2020 06:33:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtCz9rIO2bMnbNuHQHqwNvdBft3wKq1hvSVfTWA/GV+njJkpsm6en+oKoA06EF7CRiyTO3FNw==
X-Received: by 2002:a17:906:398:: with SMTP id
 b24mr13911920eja.243.1585661582174; 
 Tue, 31 Mar 2020 06:33:02 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id x26sm1895061edr.44.2020.03.31.06.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 06:33:01 -0700 (PDT)
Subject: Re: [PATCH-for-5.0] qga-posix: Avoid crashing process when failing to
 allocate memory
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Dietmar Maurer <dietmar@proxmox.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Sameeh Jubran <sjubran@redhat.com>,
 qemu-stable@nongnu.org, Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>,
 Basil Salman <basil@daynix.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20200324194836.21539-1-philmd@redhat.com>
 <1242083041.1.1585117162620@webmail.proxmox.com>
 <6be54d1f-e5fc-5b34-ba4d-fa050029f26b@redhat.com>
 <87mu7yue35.fsf@dusky.pond.sub.org>
 <81317f7f-7de9-f616-27dc-c389f06792c3@redhat.com>
 <20200330170613.GT236854@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3b584afe-9570-f453-5f28-13656030eccb@redhat.com>
Date: Tue, 31 Mar 2020 15:32:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200330170613.GT236854@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Tue, 31 Mar 2020 13:33:14 -0000

On 3/30/20 7:06 PM, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Mar 30, 2020 at 06:04:49PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Cc'ing the ppl who responded the thread you quoted.
>>
>> On 3/30/20 4:11 PM, Markus Armbruster wrote:
>>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>> ---
>>>    qga/commands-posix.c | 8 +++++++-
>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>>> index 93474ff770..8f127788e6 100644
>>> --- a/qga/commands-posix.c
>>> +++ b/qga/commands-posix.c
>>> @@ -493,7 +493,13 @@ struct GuestFileRead *qmp_guest_file_read(int64_t
>> handle, bool has_count,
>>>            gfh->state =3D RW_STATE_NEW;
>>>        }
>>>
>>> -    buf =3D g_malloc0(count+1);
>>> +    buf =3D g_try_malloc0(count + 1);
>>> +    if (!buf) {
>>> +        error_setg(errp,
>>> +                   "failed to allocate sufficient memory "
>>> +                   "to complete the requested service");
>>> +        return NULL;
>>> +    }
>>>        read_count =3D fread(buf, 1, count, fh);
>>>        if (ferror(fh)) {
>>>            error_setg_errno(errp, errno, "failed to read file");
>>>
>>
>>>> On 3/25/20 7:19 AM, Dietmar Maurer wrote:
>>>>> but error_setg() also calls malloc, so this does not help at all?
>>>>
>>>> IIUC the problem, you can send a QMP command to ask to read let's say
>>>> 3GB of a file, and QEMU crashes. But this doesn't mean there the .heap
>>>> is empty, there is probably few bytes still available, enough to
>>>> respond with an error message.
>>>
>>> We've discussed how to handle out-of-memory conditions many times.
>>> Here's one instance:
>>>
>>>       Subject: When it's okay to treat OOM as fatal?
>>>       Message-ID: <87efcqniza.fsf@dusky.pond.sub.org>
>>>       https://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg03212=
.html
>>>
>>> No improvement since then; there's no guidance on when to check for OOM=
.
>>> Actual code tends to check only "large" allocations (for subjective
>>> values of "large").
>>>
>>> I reiterate my opinion that whatever OOM handling we have is too
>>> unreliable to be worth much, since it can only help when (1) allocation=
s
>>> actually fail (they generally don't[*]), and (2) the allocation that
>>> fails is actually handled (they generally aren't), and (3) the handling
>>> actually works (we don't test OOM, so it generally doesn't).
>>>
>>>
>>> [*] Linux overcommits memory, which means malloc() pretty much always
>>> succeeds, but when you try to use "too much" of the memory you
>>> supposedly allocated, a lethal signal is coming your way.  Reasd the
>>> thread I quoted for examples.
>>
>> So this patch takes Stefan reasoning:
>> https://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg03525.html
>>
>>    My thinking has been to use g_new() for small QEMU-internal structure=
s
>>    and g_try_new() for large amounts of memory allocated in response to
>>    untrusted inputs.  (Untrusted inputs must never be used for unbounded
>>    allocation sizes but those bounded sizes can still be large.)
>>
>> In any cases (malloc/malloc_try) we have a denial of service
>> (https://www.openwall.com/lists/oss-security/2018/10/17/4) and the servi=
ce
>> is restarted.
>>
>> Daniel suggests such behavior should be catched by external firewall gua=
rd
>> (either on the process or on the network). This seems out of scope of QE=
MU
>> and hard to fix.
>=20
> Did I ?
>=20
> IMHO if the guest agent is connected to a chardev that allows access to
> a user that isn't the one running QEMU, that is serious mis-configuration=
.
> IOW, it is user error, not a QEMU guest agent bug.  Firewalls are not
> required  - QEMU should be reconfigured to not make it accessible over TC=
P.
> This is the same situation documented in 4f24430821c568936aeda417bbb00e98=
9a9e1984
> when it was claimed that QEMU had a security flaw because the QMP monitor
> could be exposed over TCP.
>=20
> The guest agent is a privileged interface to interact with a guest OS, an=
d
> as such it should only be made available to users who are trustworthy on
> the host.
>=20
>> So, can we improve something? Or should we let this code as it?
>=20
> Personally I would have just put a low, hard limit on "count" in the
> guest agent spec & impl. eg don't allow count to be larger than 10 MB
> and document that this command is just for limited, ad-hoc debugging,
> such as log file access. In extremis we could make the hard limit be
> a configuration parameter for the guest agent.

This is clearly a smarter/cleaner fix, thanks!

> The QEMU guest agent protocol is not sensible way to access huge files
> inside the guest. It requires the inefficient process of reading the
> entire data into memory than duplicating it again in base64 format, and
> then copying it again in the JSON serializer / monitor code.
>=20
> For arbitrary general purpose file access, especially for large files,
> use a real file transfer program or use a network block device, not the
> QEMU guest agent.
>=20
>=20
> Regards,
> Daniel
>=20


