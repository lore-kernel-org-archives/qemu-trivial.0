Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qKIZe-0000wa-8M
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2023 09:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qKIZc-0000w1-JL; Fri, 14 Jul 2023 09:11:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qKIZb-0000vY-0y; Fri, 14 Jul 2023 09:11:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 5E93413E7B;
 Fri, 14 Jul 2023 16:11:15 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3DEB714C23;
 Fri, 14 Jul 2023 16:10:59 +0300 (MSK)
Message-ID: <7f96dcf8-a603-8bc6-8817-5a91c9a31874@tls.msk.ru>
Date: Fri, 14 Jul 2023 16:10:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH, trivial 24/29] tree-wide spelling fixes in comments and
 some messages: migration/
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20230714113834.1186117-1-mjt@tls.msk.ru>
 <20230714113834.1186117-26-mjt@tls.msk.ru> <87sf9qiqyf.fsf@suse.de>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <87sf9qiqyf.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 14 Jul 2023 13:11:05 -0000

14.07.2023 16:05, Fabiano Rosas wrote:

>> --- a/migration/migration-stats.c
>> +++ b/migration/migration-stats.c
>> @@ -50,3 +50,3 @@ void migration_rate_set(uint64_t limit)
>>       /*
>> -     * 'limit' is per second.  But we check it each BUFER_DELAY miliseconds.
>> +     * 'limit' is per second.  But we check it each BUFER_DELAY milliseconds.
> 
> BUFER is a typo here as well.

Fixed this one too, thank you!

/mjt

