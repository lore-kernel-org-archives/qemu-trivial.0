Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mk6PA-0006ue-Jj
	for mharc-qemu-trivial@gnu.org; Mon, 08 Nov 2021 10:17:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk6P8-0006nU-So
 for qemu-trivial@nongnu.org; Mon, 08 Nov 2021 10:17:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk6P1-0003T7-QZ
 for qemu-trivial@nongnu.org; Mon, 08 Nov 2021 10:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636384662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKcyTKLMPRJMRL1WkoqUFnlj4Ggg7wFsfX1AAjTEU2E=;
 b=XF31Y6KLKi0v3FSJ695xhorLTjrLm00ZCWJMWSYSfCeUTt1q6e/xhrxDoTIu+zaE+q4KH0
 OI38lyyTOHHrPPVVYX28W9eBvdHQdlkZ8KmZW8I/v21WSobigz/ds29/B1R0qHl9Bw2L4a
 A4bBC7XXnKA62G5aQrHWu6uFhnzVkwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-U5NUlwKIMKy8A2ieEgcrDQ-1; Mon, 08 Nov 2021 10:17:39 -0500
X-MC-Unique: U5NUlwKIMKy8A2ieEgcrDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5365F1054F93;
 Mon,  8 Nov 2021 15:17:36 +0000 (UTC)
Received: from [10.39.192.185] (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9C5161077;
 Mon,  8 Nov 2021 15:16:57 +0000 (UTC)
Message-ID: <124c2224-8983-3737-c8a5-1347bd83e941@redhat.com>
Date: Mon, 8 Nov 2021 16:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/6] rSTify contribution-related wiki pages
To: Kashyap Chamarthy <kchamart@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <Laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20211019090344.3054300-1-kchamart@redhat.com>
 <CAFEAcA8CHVfAXFaQwfZrQUfJcD9qQNOYAEt9vvpQVtgwtTf80w@mail.gmail.com>
 <YYFebObSyo6itE/R@paraplu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YYFebObSyo6itE/R@paraplu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 08 Nov 2021 15:17:51 -0000

On 02/11/2021 16.51, Kashyap Chamarthy wrote:
> On Mon, Nov 01, 2021 at 02:56:43PM +0000, Peter Maydell wrote:
>> On Tue, 19 Oct 2021 at 10:04, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>>>
>>> My main motivation was to convert SubmitAPatch[1] based on a chat with
>>> Peter Maydell and Dan Berrangé on #qemu channel (on OFTC).  But the page
>>> also links to a couple of other contribution-related pages, so I
>>> converted them too:
>>>
>>>    - SubmitAPullRequest: https://wiki.qemu.org/Contribute/SubmitAPullRequest
>>>    - KeySigningParty: https://wiki.qemu.org/KeySigningParty
>>>    - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck
>>>    - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches
>>
>> I'm not sure that SpellCheck in particular is sufficiently baked
>> to be in the actual docs. I'd rather just drop the reference to it
>> from SubmitAPatch.
> 
> Sure, will drop.
> 
>> KeySigningParty I'm on the fence about.
> 
> This is linked only from the SubmitAPullRequest page.  If we're
> ambivalent about it, I'll just keep it in for reference.

FWIW, I'd rather prefer to keep the KeySigningParty stuff in the wiki - it 
does not feel like the right content for the docs that we ship in the 
release tarballs.

  Thomas


