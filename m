Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qg7E3-0002QX-J0
	for mharc-qemu-trivial@gnu.org; Tue, 12 Sep 2023 13:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qg7E0-0002Pv-Rv; Tue, 12 Sep 2023 13:30:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qg7Dy-0007Ei-Di; Tue, 12 Sep 2023 13:30:56 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id EC7D821350;
 Tue, 12 Sep 2023 20:30:52 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 814C72795A;
 Tue, 12 Sep 2023 20:30:48 +0300 (MSK)
Message-ID: <493a1b6b-ba3a-1f9c-d71c-a51ca521f734@tls.msk.ru>
Date: Tue, 12 Sep 2023 20:30:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] hw/i386/pc: fix code comment on cumulative flash size
Content-Language: en-US
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org
References: <20230912155553.82514-1-lersek@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230912155553.82514-1-lersek@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -83
X-Spam_score: -8.4
X-Spam_bar: --------
X-Spam_report: (-8.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.473,
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
X-List-Received-Date: Tue, 12 Sep 2023 17:30:58 -0000

12.09.2023 18:55, Laszlo Ersek:
> - The comment is incorrectly indented / formatted.
> 
> - The comment states a 8MB limit, even though the code enforces a 16MB
>    limit.
> 
> Both of these warts come from commit 0657c657eb37 ("hw/i386/pc: add max
> combined fw size as machine configuration option", 2020-12-09); clean them
> up.
> 
> Arguably, it's also better to be consistent with the binary units (such as
> "MiB") that QEMU uses nowadays.

Applied to my trivial-patches tree. Thanks!

/mjt

