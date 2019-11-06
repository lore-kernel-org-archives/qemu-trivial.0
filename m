Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iSMPc-0005hP-78
	for mharc-qemu-trivial@gnu.org; Wed, 06 Nov 2019 09:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iSMPZ-0005ds-11
 for qemu-trivial@nongnu.org; Wed, 06 Nov 2019 09:35:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iSMPX-0006Uf-Py
 for qemu-trivial@nongnu.org; Wed, 06 Nov 2019 09:35:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57438)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iSMPX-0006U3-IA
 for qemu-trivial@nongnu.org; Wed, 06 Nov 2019 09:35:51 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 57CA4368E4
 for <qemu-trivial@nongnu.org>; Wed,  6 Nov 2019 14:35:50 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id o202so1019238wme.5
 for <qemu-trivial@nongnu.org>; Wed, 06 Nov 2019 06:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h9lWEEYjv6YG7HNBSk6dMj/MeCvWO6sLSN/9Uj3Boog=;
 b=fi5snEhPQ9Id7lTk3h5BLRpjrsgaOBkBHuEd8ubY8oNO1LeULPEIgYYN6KOSK79Enu
 kakQg1jpWcCU4cE8xUgs0dgrvyz9SUeRmt29w4ECR9ejf79iKVDt8uKiadLRG2VF8DTs
 ToHLhq3N0uncbiVyMUM7MVuO60O08jjnTSsfKuN/HGt+DqvUID90/v3k+TUDbG9bJTKk
 nprBwVuaPLX6lNJAaZjK+2TmIAEILgLBbS5PRKr9UzXR//dn7HHE52+OPadeHfzPIP2N
 HVr24wkjmEmF+I5m9FP9b9aMqO1K3yv1p2dAiIGx9oZA1AdQBRzT0bGDXwEFMFIBND/M
 VkBQ==
X-Gm-Message-State: APjAAAVuCVHVQYVkO4n6P7RmTsGbJyZqDjK8mRplAImkrBVTWIYAR16V
 u6UvXGYcVYNXJKjAEpgOvyB1qmXES0VtsuA6PqF4kJsOjZjyQjYUrB4n8eIBzkvqL3x6b3Tgjwg
 KBFIu+NZGaQmPi/FLTg==
X-Received: by 2002:a05:6000:350:: with SMTP id
 e16mr3224685wre.276.1573050949031; 
 Wed, 06 Nov 2019 06:35:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqz3SZDhe1Odz7hIJ+Z7e0SabkQgDobjRAMTwqWAdwInJQW2D3OQI5EHHsm/ZLcHdRBMrgBJ3Q==
X-Received: by 2002:a05:6000:350:: with SMTP id
 e16mr3224666wre.276.1573050948803; 
 Wed, 06 Nov 2019 06:35:48 -0800 (PST)
Received: from [192.168.1.24] (lfbn-1-7864-228.w92-167.abo.wanadoo.fr.
 [92.167.33.228])
 by smtp.gmail.com with ESMTPSA id z8sm19209083wrp.49.2019.11.06.06.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 06:35:48 -0800 (PST)
Subject: Re: [PATCH] numa: Add missing \n to error message
To: Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <157304440026.351774.14607704217028190097.stgit@bahia.lan>
 <bb828956-28b3-9fe7-1d57-ceb723a32997@vivier.eu>
 <20191106151246.2bf44314@bahia.lan>
 <da6cc0c8-eb29-7b2f-e43a-631ab04f5ba9@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c3ea75b6-34c5-eca4-cc57-0a5d1b1d07c9@redhat.com>
Date: Wed, 6 Nov 2019 15:35:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <da6cc0c8-eb29-7b2f-e43a-631ab04f5ba9@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Wed, 06 Nov 2019 14:35:54 -0000

On 11/6/19 3:20 PM, Laurent Vivier wrote:
> Le 06/11/2019 =C3=A0 15:12, Greg Kurz a =C3=A9crit=C2=A0:
>> On Wed, 6 Nov 2019 14:01:01 +0100
>> Laurent Vivier <laurent@vivier.eu> wrote:
>>
>>> Le 06/11/2019 =C3=A0 13:46, Greg Kurz a =C3=A9crit=C2=A0:
>>>> If memory allocation fails when using -mem-path, QEMU is supposed to=
 print
>>>> out a message to indicate that fallback to anonymous RAM is deprecat=
ed. This
>>>> is done with error_printf() which does output buffering. As a conseq=
uence,
>>>> the message is only printed at the next flush, eg. when quiting QEMU=
, and
>>>> it also lacks a trailing newline:
>>>>
>>>> qemu-system-ppc64: unable to map backing store for guest RAM: Cannot=
 allocate memory
>>>> qemu-system-ppc64: warning: falling back to regular RAM allocation
>>>> QEMU 4.1.50 monitor - type 'help' for more information
>>>> (qemu) q
>>>> This is deprecated. Make sure that -mem-path  specified path has suf=
ficient resources to allocate -m specified RAM amountgreg@boss02:~/Work/q=
emu/qemu-spapr$
>>>>
>>>> Add the missing \n to fix both issues.
>>>>
>>>> Fixes: cb79224b7e4b "deprecate -mem-path fallback to anonymous RAM"
>>>> Signed-off-by: Greg Kurz <groug@kaod.org>
>>>> ---
>>>>   hw/core/numa.c |    2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/core/numa.c b/hw/core/numa.c
>>>> index 038c96d4abc6..e3332a984f7c 100644
>>>> --- a/hw/core/numa.c
>>>> +++ b/hw/core/numa.c
>>>> @@ -503,7 +503,7 @@ static void allocate_system_memory_nonnuma(Memor=
yRegion *mr, Object *owner,
>>>>               warn_report("falling back to regular RAM allocation");
>>>>               error_printf("This is deprecated. Make sure that -mem-=
path "
>>>>                            " specified path has sufficient resources=
 to allocate"
>>>> -                         " -m specified RAM amount");
>>>> +                         " -m specified RAM amount\n");
>>>>               /* Legacy behavior: if allocation failed, fall back to
>>>>                * regular RAM allocation.
>>>>                */
>>>>
>>>>
>>>
>>> Why is this an error_printf() and not an error_report()?
>>>
>>
>> Because CODING_STYLE suggests to do so I guess:
>>
>> Reporting errors to the human user
>> ----------------------------------
>>
>> Do not use printf(), fprintf() or monitor_printf().  Instead, use
>> error_report() or error_vreport() from error-report.h.  This ensures t=
he
>> error is reported in the right place (current monitor or stderr), and =
in
>> a uniform format.
>>
>> Use error_printf() & friends to print additional information. <=3D=3D=3D
>>
>> error_report() prints the current location.  In certain common cases
>> like command line parsing, the current location is tracked
>> automatically.  To manipulate it manually, use the loc_``*``() from
>> error-report.h.
>=20
> So I guess it's to not report the current location and the binary name =
.
>=20
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


