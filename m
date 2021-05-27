Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmDOo-0008QB-B2
	for mharc-qemu-trivial@gnu.org; Thu, 27 May 2021 06:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1lmDOf-0008MD-Uh; Thu, 27 May 2021 06:37:50 -0400
Received: from mta-05-4.privateemail.com ([68.65.122.25]:20275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1lmDOd-0003Fo-Ks; Thu, 27 May 2021 06:37:49 -0400
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id C4BC16004A;
 Thu, 27 May 2021 06:37:32 -0400 (EDT)
Received: from [192.168.0.46] (unknown [10.20.151.221])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id C7F6660051;
 Thu, 27 May 2021 06:37:31 -0400 (EDT)
Date: Thu, 27 May 2021 06:37:24 -0400
From: Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH] linux-user: make process_pending_signals thread-safe
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Trivial
 <qemu-trivial@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Message-Id: <CIHRTQ.JLYE6DOVVWC1@effective-light.com>
In-Reply-To: <CAFEAcA_Z-fe1pT8=-TCFxVkpBpXpKXD+vKi1i=CBFLg4ANYE1A@mail.gmail.com>
References: <20210524024655.11115-1-someguy@effective-light.com>
 <CAFEAcA_Z-fe1pT8=-TCFxVkpBpXpKXD+vKi1i=CBFLg4ANYE1A@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass client-ip=68.65.122.25;
 envelope-from=someguy@effective-light.com; helo=MTA-05-4.privateemail.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 27 May 2021 10:37:56 -0000



On Thu, May 27 2021 at 11:16:56 AM +0100, Peter Maydell 
<peter.maydell@linaro.org> wrote:
> If we do want to change from sigprocmask() to pthread_sigmask(), we
> should be consistent about doing that, not just change this call 
> only.)
On that note, do you think it would worthwhile to have a Coccinelle 
script replace all instances of sigprocmask with pthread_sigmask (in 
linux-user, of course)?



