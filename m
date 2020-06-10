Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jj1RT-00010X-3Q
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jun 2020 10:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jj1RS-00010M-7h
 for qemu-trivial@nongnu.org; Wed, 10 Jun 2020 10:10:58 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45125
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jj1RR-0002H9-8e
 for qemu-trivial@nongnu.org; Wed, 10 Jun 2020 10:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591798255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=phthIbgSkiymNcUN8w0aZ9SlQ7+pFpY+Od4p28l49tg=;
 b=dCbHVr7+Hhys/d99V+Vq0qkKYFj+O9plPby8bZeQT37xnAdZ1ID/2e9JnmqhFCqWPdpl9J
 ddiQk3GItzl7E+bxPnsC8mhFzKKwncT8CbfjhvI82wH3JY8ZxY4gDqoad+kcu/BGICFtkl
 Gy8/aTwIYqxKttCcjUtiRoqMknzBvvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-9hWD8v4NPwio5uQAprQVfA-1; Wed, 10 Jun 2020 10:10:49 -0400
X-MC-Unique: 9hWD8v4NPwio5uQAprQVfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AC2C80B73A;
 Wed, 10 Jun 2020 14:10:48 +0000 (UTC)
Received: from thuth.remote.csb (unknown [10.40.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 296067DFF5;
 Wed, 10 Jun 2020 14:10:36 +0000 (UTC)
Subject: Re: [PATCH] hw/vfio/pci-quirks: Fix broken legacy IGD passthrough
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20200610035102.20192-1-thuth@redhat.com>
 <706060db-46c4-2dee-d746-eba24e6b137d@redhat.com>
 <a8195883-fb78-0cc1-5e15-e100dcb807de@redhat.com>
 <c5be50d5-5158-ddcc-8de0-bc6c3cfce12a@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c2809e06-5353-ca2d-e195-55c5a3e0dbac@redhat.com>
Date: Wed, 10 Jun 2020 16:10:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c5be50d5-5158-ddcc-8de0-bc6c3cfce12a@vivier.eu>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 10 Jun 2020 14:10:58 -0000

On 10/06/2020 15.16, Laurent Vivier wrote:
> Le 10/06/2020 à 09:50, Thomas Huth a écrit :
>> On 10/06/2020 09.31, Philippe Mathieu-Daudé wrote:
>>> On 6/10/20 5:51 AM, Thomas Huth wrote:
>>>> The #ifdef CONFIG_VFIO_IGD in pci-quirks.c is not working since the
>>>> required header config-devices.h is not included, so that the legacy
>>>> IGD passthrough is currently broken. Let's include the right header
>>>> to fix this issue.
>>>>
>>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1882784
>>>> Fixes: 29d62771c81d8fd244a67c14a1d968c268d3fb19
>>>>        ("hw/vfio: Move the IGD quirk code to a separate file")
>>>
>>> What about shorter tag?
>>>
>>> Fixes: 29d62771c81 ("vfio: Move the IGD quirk code to a separate file")
>>
>> I always forget whether to use the short or the long version for
>> "Fixes:" ... this can hopefully be fixed (if necessary) when the patch
>> gets picked up.
> 
> you can add in your ~/.gitconfig
> 
> [alias]
>         showfix = log -1 --format=fixes
> [pretty]
>         fixes = Fixes: %h (\"%s\")%nCc: %ae
> 
> and then:
> 
> $ git showfix 29d62771c81d8fd244a67c14a1d968c268d3fb19
> Fixes: 29d62771c81d ("hw/vfio: Move the IGD quirk code to a separate file")

That's nice, thanks! I've put it now in my gitconfig :-)

 Thomas


