Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qk4Bs-0006KP-KN
	for mharc-qemu-trivial@gnu.org; Sat, 23 Sep 2023 11:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qk4Bq-0006Jk-Id; Sat, 23 Sep 2023 11:05:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qk4Bn-0002vs-Ol; Sat, 23 Sep 2023 11:05:01 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 74F8F247E2;
 Sat, 23 Sep 2023 18:05:19 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id B988E2A32A;
 Sat, 23 Sep 2023 18:04:53 +0300 (MSK)
Message-ID: <b033af2f-9290-d2d9-3aad-9e594fc38321@tls.msk.ru>
Date: Sat, 23 Sep 2023 18:04:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] Update AMD memory encryption document links.
Content-Language: en-US
To: Jianlin Li <ljianlin99@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thomas.lendacky@amd.com, dovmurik@linux.ibm.com
References: <20230922073834.519945-1-ljianlin99@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230922073834.519945-1-ljianlin99@gmail.com>
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
X-List-Received-Date: Sat, 23 Sep 2023 15:05:03 -0000

22.09.2023 10:38, Jianlin Li wrote:
> The previous links for the white paper and programmer's manual
> are no longer available. Replace them with the new ones.

Applied to my trivial-patches tree, thank you!

/mjt

