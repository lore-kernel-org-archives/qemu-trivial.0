Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qJvB6-0004ny-Ku
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2023 08:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1qJvB4-0004nj-TN
 for qemu-trivial@nongnu.org; Thu, 13 Jul 2023 08:12:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1qJvB2-0003PG-IU
 for qemu-trivial@nongnu.org; Thu, 13 Jul 2023 08:12:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 70F3A137EA;
 Thu, 13 Jul 2023 15:12:18 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 64CF11491B;
 Thu, 13 Jul 2023 15:12:04 +0300 (MSK)
Message-ID: <7aa2cdec-29a0-e2e0-750d-388b9a094a9e@tls.msk.ru>
Date: Thu, 13 Jul 2023 15:12:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Ping to patch request "add option for a multislot usb ccid
 device" (Klaus Ripke, 20.03.2023)
Content-Language: en-US
To: Wilhelm Golz <wilhelm.golz@secunet.com>, qemu-trivial@nongnu.org
References: <12100964-f7c6-58fd-5f30-3394f1621df4@secunet.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <12100964-f7c6-58fd-5f30-3394f1621df4@secunet.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.096,
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
X-List-Received-Date: Thu, 13 Jul 2023 12:12:11 -0000

10.07.2023 17:18, Wilhelm Golz wrote:
> Hello,
> 
> I would like to remind the request of my former colleague
> Klaus Ripke, who posted a smaller patch-request to this list
> 
> "add option for a multislot usb ccid device"  by the 20th of March 2023.

It's been quite some time ago. I had to search that one in google.

> Are there any reasons to not take this patch upstream or
> do we have to improve things? Klaus is no longer working
> in our team, so I have taken over this topic.

I guess it was unclear what this change gives.  But I don't really
know.  Somehow the change received no interest in the qemu community.

For one (or two), I can mention this:

1) the patch is word-wrap-damaged, - the email client used "helpfully"
wrapped long lines in the patch to make it invalid.

2) this is definitely not for qemu-trivial@.

Neither of that is the reason why it hasn't received any interest,
though.  Maybe giving some real-life usage example can generate more
interest, but once again, I can't say.

Thanks,

/mjt

