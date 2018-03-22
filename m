Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ez3fc-0002Tz-RJ
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 13:06:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3fb-0002Sx-F4
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 13:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3fa-0002OR-HK
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 13:06:31 -0400
Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244]:45814)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1ez3fW-0002Ji-AM; Thu, 22 Mar 2018 13:06:26 -0400
Received: by mail-yw0-x244.google.com with SMTP id r29so3061901ywa.12;
	Thu, 22 Mar 2018 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tq/qMvUVnS2abCFuqzDyaN2w84NsL21FWM2sFX8tWUw=;
	b=T2HWpyfA2kzePy1CtWxAP0fKGujlROL3CypPAMMnhPdSB/U+RpHK58IJzR3h/VcTOi
	hdfX0OeKJH7U8+kZCJxAf3S2Eo4OENSVZLfM7pT0+4QLxfgg9aD8iXi6h+e8BmNQg2zC
	PcozEDtspBgoLmKXhlUVOar+IPQi5zWxNjMrogmuqDZSBhJd5HxhZytFJWdtNSNZJkMM
	V1dSugbWMAJ4It5Y7Cj8scDdK/C97B3CNlMWsWDZPYBr+BYQUbQL4spEgPLUN+77f1eR
	WE3gjA6+FqwAQhihfYHRRkRZbUlKqWx7h6ZgaLU00y7Hs9YFw1RWWro9TsAYxTT2lpIh
	4lYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tq/qMvUVnS2abCFuqzDyaN2w84NsL21FWM2sFX8tWUw=;
	b=RX+bKV6BZqaij10RGVCiwEAeIXacHinDillqrW+wawjiK3QhD7L+q0Uk4CQxFxNOJJ
	YG8xN+M19SiavpI7xluhm+oqqXzQECPKqcsJmNaUsmUuesAYYkY575whrUqpi17ZBUW6
	oct1+faBif+CCy3rkHWGUePPd3bpwj7S7ufycovWf5DZIld76mptBQAqgo0AUJOYYivU
	A/rNASx3TsrFJpHpBfj1eDmSvi2eaAn4Jw/UgPpXiAyJAF9GOS0x8KOmtWXfJ3KgyHDf
	UYcZJuDcfU2Z/Grjqq0CQA29ernmUi1vGV3qgpGmfcInjTtmVbN9kjyquT/PyLlzHg3i
	Xw/A==
X-Gm-Message-State: AElRT7EZl1vCVq7WccG5Vm8ONcwkxqKZVop2KZo5VqCheNutKJh8qpdC
	A+b3KaITrZXXZM7Dv+oTBGDxNAlKcPrU1sM1pk8=
X-Google-Smtp-Source: AG47ELs8Jf7YSF3dPhRdOLIYe6UnXwAplq3825CW9XgUXG6HBEd5xDTr1lGC4cXWwZxeledEbkUtUEazMuKynCGfMks=
X-Received: by 10.129.83.215 with SMTP id h206mr15551335ywb.388.1521738385637; 
	Thu, 22 Mar 2018 10:06:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:b047:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 10:06:25
	-0700 (PDT)
In-Reply-To: <72681a04-d10d-3e88-0671-118a03466eca@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
	<CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
	<72681a04-d10d-3e88-0671-118a03466eca@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 22 Mar 2018 10:06:25 -0700
Message-ID: <CAMo8BfJuGFPt+tv5g33yyZJxhOXWmQ=d3yDZaB9NHV_n_hdWtQ@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>, 
	Max Reitz <mreitz@redhat.com>, Fam Zheng <famz@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Alexander Graf <agraf@suse.de>,
	qemu-ppc <qemu-ppc@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::244
Subject: Re: [Qemu-trivial] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
X-List-Received-Date: Thu, 22 Mar 2018 17:06:32 -0000

On Thu, Mar 22, 2018 at 9:59 AM, Eric Blake <eblake@redhat.com> wrote:
> On 03/22/2018 11:51 AM, Max Filippov wrote:
>>
>> On Thu, Mar 22, 2018 at 9:12 AM, Laurent Vivier <lvivier@redhat.com>
>> wrote:
>>>
>>> Re-run Coccinelle script scripts/coccinelle/return_directly.cocci
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> ---
>>>   target/xtensa/core-dc232b/xtensa-modules.c         | 56
>>> ++++++----------------
>>>   target/xtensa/core-dc233c/xtensa-modules.c         | 56
>>> ++++++----------------
>>>   target/xtensa/core-de212/xtensa-modules.c          | 48
>>> +++++--------------
>>>   target/xtensa/core-fsf/xtensa-modules.c            | 32 ++++---------
>>>   .../xtensa/core-sample_controller/xtensa-modules.c | 24 +++-------
>>
>>
>> These files were autogenerated, fixing them doesn't make much sense.
>
>
> How frequently is the generator rerun?  Is it something where we are likely
> to revert the change because it needs to be rerun soon?  If so, then is it
> worth fixing the generator to output more concise code?

They were generated once and are not supposed to be regenerated.

> Conversely, if they were generated up front, but likely to remain unchanged
> into the future, then fixing them (even though the fix differs from the
> generator) will mean they no longer show up as false positives in future
> runs of the Coccinelle script.

Ok.

> I'm also fine removing the changes to these files as part of preparing the
> PULL request, if that's what you would prefer.

The changes are fine, if they make maintenance easier they should stay.

-- 
Thanks.
-- Max

