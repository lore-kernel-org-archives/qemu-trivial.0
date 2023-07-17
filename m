Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qLKrH-0003BH-KS
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jul 2023 05:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qLKrF-0003Av-Ui; Mon, 17 Jul 2023 05:49:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qLKrE-0007OX-03; Mon, 17 Jul 2023 05:49:33 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id D24D91446C;
 Mon, 17 Jul 2023 12:49:29 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D4C6D1522F;
 Mon, 17 Jul 2023 12:49:26 +0300 (MSK)
Message-ID: <c4f93386-688e-3e81-4da5-641b053aad35@tls.msk.ru>
Date: Mon, 17 Jul 2023 12:49:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/6] trivial-patches for 2023-07-16
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20230716115801.1505288-1-mjt@tls.msk.ru>
 <69ff1b09-a795-fcbe-ad0d-52f76f25eba7@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <69ff1b09-a795-fcbe-ad0d-52f76f25eba7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 17 Jul 2023 09:49:34 -0000

16.07.2023 18:58, Philippe Mathieu-Daudé wrote:
...
>> Michael Tokarev (5):
>>    tree-wide spelling fixes in comments and some messages: migration/
>>    tree-wide spelling fixes in comments and some messages: s390x
>>    tree-wide spelling fixes in comments and some messages: arm
>>    tree-wide spelling fixes in comments and some messages: other
>>      architectures
>>    tree-wide spelling fixes in comments and some messages: hw/9pfs
> 
> FYI patch subject is usually "subsystem: Topic", see
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html#write-a-meaningful-commit-message:
> 
>    QEMU follows the usual standard for git commit messages: the first
>    line (which becomes the email subject line) is “subsystem: single
>    line summary of change”.

Yes Philippe, I know. In this case though, it really is "tree-wide". I tried
to group them by subsystem but it doesn't work that well.  Especially having
in mind how many changes there are (about 400 in total).

This particular series is a pull request, not a review request (I just
forgot to add --subject-prefix=PULL when generating this one).  This is
the changes which has been reviewed by at least one person, out of the
other pile. The others are here, for example:

   https://lists.nongnu.org/archive/html/qemu-devel/2023-07/msg03006.html

and see comments by Peter there:

  https://lists.nongnu.org/archive/html/qemu-devel/2023-07/msg03050.html

My plan is to get the reviewed parts applied, and re-send the rest
once again. This is a huge work already to create the changes to
begin with, and to review them as well.

The initial RFC:

  https://lists.nongnu.org/archive/html/qemu-devel/2023-07/msg02841.html

> (not really a cosmetics comment, but various developers have mail
>   filters written using this pattern).

It's hardly possible to reliable filter by subsystem, because there's
no formal subsystems defined and the "subsystem:" prefix in emails is
really arbitrary.

/mjt

