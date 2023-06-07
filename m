Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q6zRI-0006MC-5u
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jun 2023 16:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1q6zRG-0006Lw-Lf
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 16:07:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1q6zRE-0000ZJ-Ne
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 16:07:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 956D2B64C;
 Wed,  7 Jun 2023 23:07:22 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1A8ECA595;
 Wed,  7 Jun 2023 23:07:21 +0300 (MSK)
Message-ID: <a8939cd3-bbcf-60b0-23e6-f2e4ee430fb3@tls.msk.ru>
Date: Wed, 7 Jun 2023 23:07:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: QEMU AVR Patch - Correct handling of AVR interrupts
Content-Language: en-US
To: Adecy <ld.adecy@gmail.com>, qemu-trivial@nongnu.org
References: <CAB295yB5cFSZpGE74EW5hDMSNGnZfw06UC5ydepUL0sdT96WGg@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CAB295yB5cFSZpGE74EW5hDMSNGnZfw06UC5ydepUL0sdT96WGg@mail.gmail.com>
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
X-List-Received-Date: Wed, 07 Jun 2023 20:07:26 -0000

01.06.2023 22:34, Adecy wrote:
> Hello,
> 
> I would like to submit the attached patch.

Please send it to qemu-devel@, maybe Cc: to qemu-trivial@.
Also, for this file, there's a maintainer:

  $ ./scripts/get_maintainer.pl -f target/avr/helper.c
  Michael Rolnik <mrolnik@gmail.com> (maintainer:AVR TCG CPUs)
  qemu-devel@nongnu.org (open list:All patches CC here)

So please Cc: there too.

Thank you!

/mjt

