Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qoiLM-0007Ed-Hn
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2023 06:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qoiLI-0007Du-GL; Fri, 06 Oct 2023 06:46:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qoiLF-0000rQ-12; Fri, 06 Oct 2023 06:46:00 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id CB6B3282E2;
 Fri,  6 Oct 2023 13:45:55 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 19AAF2D5DE;
 Fri,  6 Oct 2023 13:45:51 +0300 (MSK)
Message-ID: <29a2a188-ec5b-452f-be63-92e8f0ec7110@tls.msk.ru>
Date: Fri, 6 Oct 2023 13:45:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/virtio/vhost: Silence compiler warnings in vhost code
 when using -Wshadow
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org
References: <20231004114809.105672-1-thuth@redhat.com>
 <18f1faab-71f4-4dbd-a319-fcd65721f58b@tls.msk.ru>
 <87h6n4p1ts.fsf@pond.sub.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <87h6n4p1ts.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 06 Oct 2023 10:46:02 -0000

06.10.2023 11:55, Markus Armbruster пишет:
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> Applied to my trivial-patches tree, thanks!
>>
>> Marcus, you picked up previous patches of this theme, --
>> you can continue this tradition if you like :)
> 
> I intend to post a pull request for the -Wshadow patches that have
> R-bys.  I'm also tracking the unreviewed ones, and hope they get
> reviewed.

Ahh, ok.

I've added my own R-bys for the ones I picked up, and for this one
by Thomas too:

Reviewed-By: Michael Tokarev <mjt@tls.msk.ru>

/mjt


