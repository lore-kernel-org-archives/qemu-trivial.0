Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lK1rE-0008F6-J7
	for mharc-qemu-trivial@gnu.org; Wed, 10 Mar 2021 11:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK1r6-0008CT-HS
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 11:38:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK1r4-0007cC-IB
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 11:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615394316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cdbd7fmtsrvl+/weln9tpg25hNGXRfutJv6jxkEiV+Y=;
 b=f3FOC9266zlr2HZNw+xTvX5kRlso+jpC1pkRyor4u3qyYrgzBpZcFlmxWP6yX3CtJmrBTu
 KuiEI1vZyPN0l9hIwkzjymXIuMh1JsJUWpearrnEO6lyz9OtcTV7CzdQhD8iatD7fY6kJO
 kd5eZrl8m1AuHJIksg/85V29qi1hSn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-yeQ_yR0ZOQi2R9xjVbCXOQ-1; Wed, 10 Mar 2021 11:38:35 -0500
X-MC-Unique: yeQ_yR0ZOQi2R9xjVbCXOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 237C8801596;
 Wed, 10 Mar 2021 16:38:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BAB3690F9;
 Wed, 10 Mar 2021 16:38:29 +0000 (UTC)
Subject: Re: [PATCH] tests: Fix broken "make check-speed"
To: Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210310094936.1318317-1-thuth@redhat.com>
 <CAKJDGDZdUGW=eT8ZnsVohUzmvrWGUgLdKUs=-0VNejqZyOag0w@mail.gmail.com>
 <7c6e59fd-913f-31ff-ae33-49186f9ddde1@redhat.com>
 <CAKJDGDbd6sZ0swGju-rCv9Lf-ADU3Tg1zeDxO-nfgpVxoONb-Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b1acb060-916c-01e7-d526-58d41d5097f9@redhat.com>
Date: Wed, 10 Mar 2021 17:38:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDbd6sZ0swGju-rCv9Lf-ADU3Tg1zeDxO-nfgpVxoONb-Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 10 Mar 2021 16:38:42 -0000

On 10/03/2021 17.08, Willian Rampazzo wrote:
> On Wed, Mar 10, 2021 at 1:04 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 10/03/21 16:49, Willian Rampazzo wrote:
>>> On Wed, Mar 10, 2021 at 6:51 AM Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> When running "make check-speed", currently nothing happens. This is
>>>> because the redirection to "bench-speed" is not working as expected
>>>> (since the bench-speed rule in the generated Makefile.mtest filters
>>>> for "bench-speed" and "bench" in the MAKECMDGOALS variable).
>>>> Fix it by calling "make bench-speed" instead of using a dependency.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    tests/Makefile.include | 5 +++--
>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>
>>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>>> Tested-by: Willian Rampazzo <willianr@redhat.com>
>>>
>>
>> I don't object to the patch, but if no one has noticed in 6 months
>> perhaps the target can go (replaced by "make bench"/"make bench-speed").
>>
> 
> I was also thinking about it. If the target was not working and no one
> complained, maybe remove it is just fine, so, +1 here for
> removing/renaming.

Fine for me, too, but we then also have to update the output of "make 
check-help" accordingly. Care to send a patch?

  Thomas


