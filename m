Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnHgQ-00028X-Sj
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2023 08:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnHgO-00027u-N6; Mon, 02 Oct 2023 08:05:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnHgN-0004eH-9v; Mon, 02 Oct 2023 08:05:52 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AFB4426BE6;
 Mon,  2 Oct 2023 15:06:31 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D151E2C289;
 Mon,  2 Oct 2023 15:05:48 +0300 (MSK)
Message-ID: <756eb847-a510-8b64-d8b4-e5a2f0952fb3@tls.msk.ru>
Date: Mon, 2 Oct 2023 15:05:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: add standard-headers to Hosts/LINUX
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230929143012.77128-1-cohuck@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230929143012.77128-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -91
X-Spam_score: -9.2
X-Spam_bar: ---------
X-Spam_report: (-9.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.321,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 02 Oct 2023 12:05:53 -0000

29.09.2023 17:30, Cornelia Huck:
> The files in there are updated via update-linux-headers.sh.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Applied to my trivial-patches tree, thanks!

/mjt


