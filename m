Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixI0a-0002As-2G
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jan 2020 17:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ixI0U-0002AV-Fm
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2020 17:09:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ixI0S-0000A2-1d
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2020 17:09:49 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28440
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ixI0R-00008S-Ue
 for qemu-trivial@nongnu.org; Thu, 30 Jan 2020 17:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580422187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwUphAWQo0KbBGx2U/vmzSW5DvUDW+bFxz40je9soag=;
 b=E7IWQtZ6Aoog8f1Mq5veo1SZuAmHuQIb5YZEGfsv8FKT9dEu4zjj/W3RKrw8bSl/oWJN8Z
 kJVd2Rmr5EiS6seoZBcNtPOCsWm+aY7ojxuXNSb0IP8u5JyO3GASTkmeyEAVRR2OWyBF7Y
 pRy1Q57pA1CjVofgI3yNFXRoqtVQrJ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-3wESOQ9SMmaMr7qp5t9oDQ-1; Thu, 30 Jan 2020 17:09:41 -0500
Received: by mail-wm1-f72.google.com with SMTP id b133so1338981wmb.2
 for <qemu-trivial@nongnu.org>; Thu, 30 Jan 2020 14:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EgxH0Q2+gvE/aYlLvOBWFidPOfhKxe5WL+p2INPUkpg=;
 b=KNF2bWAyE4VIjrso/LFt9U/kdnXlIabRHCh++diAU4mXjdZPgzK55Wwnsws2RrRvOx
 zLToUnZMb56Q510yr4l0ERgFupT0T4/XYrJRyXqeODpxaXdywKVV+dSz7a0XMfP2670c
 rkg3tVdvfnm146hfZu93y6kgxtF3CV7CKWOtYUhVRNMOHXC7gSh5vgje+C/a3UpFR7ye
 w5L/gkbCLMWo4Tmct3MkHxNnSKlSxD5dcKjn3WwbZWfjE17tOXrab1IDjwMk+h1uq9u3
 AST5uoAvFRmtau9Ew9UjmIyAMx6nXz/JCvBZkhhSyznwJje7Arb09qn2UrmJ34CvWeCp
 JGjQ==
X-Gm-Message-State: APjAAAWsidW/WG/abkiQcw7MbG2imdDsZmmNMjMIyHA9dicvFiQyFL5+
 PT5gL8MQkOsKLhxQgN2YVAqaybVIH3jAcLZeIa5JZnzAn2VAlE0Js3G93STJLcGhzJ3D5IDYELt
 5F8jGyP2E28udASPA0g==
X-Received: by 2002:a1c:b607:: with SMTP id g7mr7838854wmf.110.1580422180603; 
 Thu, 30 Jan 2020 14:09:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxVO0/W1ZgfVrCeEefdFq/7rll9noPkp9YZtPho3rVyNcCi5+UVdKd6I82U64QRtSpzZBhfEg==
X-Received: by 2002:a1c:b607:: with SMTP id g7mr7838834wmf.110.1580422180355; 
 Thu, 30 Jan 2020 14:09:40 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id q1sm3575186wrw.5.2020.01.30.14.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 14:09:39 -0800 (PST)
Subject: Re: [PATCH] qemu-deprecated: Remove text about Python 2
To: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20200109095116.18201-1-thuth@redhat.com>
 <5883bc34-926e-70e3-6402-32dfb5d92ab2@redhat.com>
 <e1ae4e63-626c-cc6d-5117-4b4fbd1ad436@redhat.com>
 <20200114102031.GE4071034@redhat.com> <874kww7lk3.fsf@dusky.pond.sub.org>
 <efe0d310-1c48-4f1b-2ffe-46eea85af871@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8beaabcd-4026-c3fa-4168-698b1c4dfcd2@redhat.com>
Date: Thu, 30 Jan 2020 23:09:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <efe0d310-1c48-4f1b-2ffe-46eea85af871@redhat.com>
Content-Language: en-US
X-MC-Unique: 3wESOQ9SMmaMr7qp5t9oDQ-1
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
X-List-Received-Date: Thu, 30 Jan 2020 22:09:55 -0000

On 1/15/20 6:16 PM, John Snow wrote:
> On 1/15/20 11:04 AM, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>
>>> On Tue, Jan 14, 2020 at 11:08:16AM +0100, Thomas Huth wrote:
>>>> On 13/01/2020 23.36, John Snow wrote:
>>>>> Right now, we don't
>>>>> really have these docs hosted in a searchable way online in a
>>>>> per-version format. Once the notice is gone, it's gone from the mirro=
r.
>>>>>
>>>>> I removed some bitmap functionality not too long ago and I created a
>>>>> "Recently Removed" section as a bit of a troubleshooting guide should=
 it
>>>>> be needed.
>>>>>
>>>>> - Do we want this section?
>>>>> - Should I remove it?
>>>>> - Can we add historical docs to the website to see previous deprecate=
d
>>>>> docs in a searchable manner?
>>>>
>>>> I also once started a page in the Wiki here:
>>>>
>>>>   https://wiki.qemu.org/Features/RemovedFeatures
>>>>
>>>> ... but apparently, it did not get enough attention yet, otherwise you
>>>> would have noticed it before introducing the new chapter into the
>>>> qemu-doc ...
>>>>
>>>> We definitely need one spot where we can document removed features. I
>>>> don't mind which way we do it, either the qemu-doc or the wiki, but we
>>>> should unify on one of the two. I guess the qemu-doc is the better pla=
ce
>>>> since we are tracking the deprecated features there already and one mo=
re
>>>> or less just has to move the text to the other chapter when things get
>>>> finally removed?
>>>
>>> Yeah, I've said in the past that we should not be deleting deprecations
>>> from the docs entirely.
>>>
>>> If you look at GTK docs for example, you'll see they keep a record of
>>> all incompatible or noteworth changes between release:
>>>
>>>    https://developer.gnome.org/gtk3/stable/gtk-migrating-3-x-to-y.html
>>>
>>> IMHO, we should follow this and have an appendix of removed features,
>>> with sub-sections per QEMU release listing each removed feature. Thus
>>> deprecation docs just get moved to this appendix at the right time.
>>
>> This is exactly the "Recently Removed" appendix John added in commit
>> 3264ffced3d.
>>
>> Now we need a sucker^Wvolunteer to restore all the stuff we dropped from
>> appendix "Deprecated features" to this appendix.  John, you were
>> incautious enough to signal you care; what about you?
>>
>=20
> Can add to the pile, but admittedly I am a little backlogged trying to
> recover from the holidays. I can't promise any time to it right this minu=
te.
>=20
> I can try next week, if I don't forget.

In case you forgot :P


