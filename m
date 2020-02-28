Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7ca2-0002fB-5e
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 05:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7cZy-0002cq-I2
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 05:09:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7cZx-0003Pw-CV
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 05:09:10 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27298
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7cZx-0003Pb-8c
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 05:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582884548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lxDNqU9f6szodAoL+eKVqU16LD68L11FLyfkgqa0zY=;
 b=TijOHvl1erdxjGjgtPaeQtYtNB2KiIYBjR30aTB4yFgB/vUmi9kbp2c6qAr7ViYMA8prFv
 HNSXeHPw0AWDIF/9M8Lsu7iHaQAAWGJplPNqg0QV6o1Igq2zuVU+Wg1AfLaMUY+UA/sSLp
 WwX/kT3ZsTEf9W79OqkyE1Vaj9nBrog=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-Jbj8iuJEMIq4j7oK-ey5tg-1; Fri, 28 Feb 2020 05:09:05 -0500
X-MC-Unique: Jbj8iuJEMIq4j7oK-ey5tg-1
Received: by mail-wr1-f69.google.com with SMTP id j32so1098365wre.13
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 02:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EHcn7Uig0EtUCcWo1FHf3SEWp5/ZmpM7wVWxnrh0SL0=;
 b=oxd8oJ0I1vQQ36TQkHIS8nm/VSI4kZZYxTNU/YJlgygLzFV4oMomjijfIxXVSD5QeU
 deBFTxPfbdSP6XmJHy0kGp7Bl4WKmieeiZ+vzXReUHRiMBdV641Wd+g5PjjKU9a8G0kV
 ZC9FpEQ6utumOKnITr67Q0hDl/oIyGHwTJ5F73Fl00Q8ckEysxw8rf51brxQCt6BPpWp
 qZH4bqXCnMJT7pXeXk7j6BH3esuRUI7mPSanq2IQ4dSCG3Nldx2Jhuqh/Yu8EKmGtzro
 f6wQiKHu/+ooaJJ2zB41cMtw7RTKkjFyAlTxeKoF2kXsdolF7A2dYB9X6cKH2fbtzB3M
 /1Uw==
X-Gm-Message-State: APjAAAVsvL90PwezKYchwI44jaLymj99YWP/hkZqp8NfluJAHZdQ2+WN
 qcOmuUhQSzEtfvWyvfI0Yjj6XViLOjfJk22pJtd88lJ2g9HOzOiSR3jQEyg/qr2VBkEQugXjv4o
 5EY+k3jEyE/7c6HGXYw==
X-Received: by 2002:a7b:c958:: with SMTP id i24mr4148714wml.180.1582884544533; 
 Fri, 28 Feb 2020 02:09:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqy+pCCIHZwu6JHxntWdbDcTvUVhAoEUlr5QaD/4tDZ0JAZkFkXZQslpiZEofZ0jQMLVORU4kA==
X-Received: by 2002:a7b:c958:: with SMTP id i24mr4148684wml.180.1582884544312; 
 Fri, 28 Feb 2020 02:09:04 -0800 (PST)
Received: from [10.0.0.124] ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id y185sm1558864wmg.2.2020.02.28.02.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 02:09:03 -0800 (PST)
Subject: Re: [PATCH] qom/object: Comment to use g_slist_free on
 object_class_get_list result
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 qemu trival <qemu-trivial@nongnu.org>, Pan Nengyuan
 <pannengyuan@huawei.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200227190942.8834-1-philmd@redhat.com>
 <20200228094652.GB1657361@redhat.com>
 <CAJ+F1CL-fbX=dXpopMMT1o-WH1JhrqrzpM55J9cGoGDNpDq=AQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cc93fc81-3e4d-b8d0-afa7-2c35ac502785@redhat.com>
Date: Fri, 28 Feb 2020 11:08:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CL-fbX=dXpopMMT1o-WH1JhrqrzpM55J9cGoGDNpDq=AQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Fri, 28 Feb 2020 10:09:12 -0000

On 2/28/20 11:06 AM, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>=20
> On Fri, Feb 28, 2020 at 10:47 AM Daniel P. Berrang=C3=A9 <berrange@redhat=
.com> wrote:
>>
>> On Thu, Feb 27, 2020 at 08:09:42PM +0100, Philippe Mathieu-Daud=C3=A9 wr=
ote:
>>> Document the list returned by object_class_get_list() must be
>>> released with g_slist_free() to avoid memory leaks.
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>>   include/qom/object.h | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/include/qom/object.h b/include/qom/object.h
>>> index 29546496c1..5517b56508 100644
>>> --- a/include/qom/object.h
>>> +++ b/include/qom/object.h
>>> @@ -984,6 +984,9 @@ void object_class_foreach(void (*fn)(ObjectClass *k=
lass, void *opaque),
>>>    * @include_abstract: Whether to include abstract classes.
>>>    *
>>>    * Returns: A singly-linked list of the classes in reverse hashtable =
order.
>>> + *
>>> + * The returned list must be released with g_slist_free()
>>> + * when no longer required.
>>
>> I'd suggest
>>
>>    "The returned list, but not its elements, must be released with
>>     g_slist_free() or g_autoptr when no longer required"
>=20
> As gobject-introspection annotations: "Returns: (transfer container)
> (element-type ObjectClass): A list of #ObjectClass"

Are you suggesting to replace "Returns: A singly-linked list of the=20
classes in reverse hashtable order." by the line you quoted?

>=20
>>
>>>    */
>>>   GSList *object_class_get_list(const char *implements_type,
>>>                                 bool include_abstract);
>>> @@ -995,6 +998,9 @@ GSList *object_class_get_list(const char *implement=
s_type,
>>>    *
>>>    * Returns: A singly-linked list of the classes in alphabetical
>>>    * case-insensitive order.
>>> + *
>>> + * The returned list must be released with g_slist_free()
>>> + * when no longer required.
>>>    */
>>>   GSList *object_class_get_list_sorted(const char *implements_type,
>>>                                 bool include_abstract);
>>> --
>>> 2.21.1
>>>
>>>
>>
>> Regards,
>> Daniel
>> --
>> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberra=
nge :|
>> |: https://libvirt.org         -o-            https://fstop138.berrange.=
com :|
>> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberra=
nge :|
>>
>>
>=20
>=20


