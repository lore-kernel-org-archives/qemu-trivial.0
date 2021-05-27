Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmEw7-0004JB-7D
	for mharc-qemu-trivial@gnu.org; Thu, 27 May 2021 08:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1lmEw5-0004GM-SQ; Thu, 27 May 2021 08:16:25 -0400
Received: from mta-07-4.privateemail.com ([68.65.122.27]:7667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1lmEw2-0007Gz-DI; Thu, 27 May 2021 08:16:25 -0400
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 8AD4360052;
 Thu, 27 May 2021 08:16:18 -0400 (EDT)
Received: from [192.168.0.46] (unknown [10.20.151.229])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id A49AC6004E;
 Thu, 27 May 2021 08:16:17 -0400 (EDT)
Date: Thu, 27 May 2021 08:16:11 -0400
From: Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH] linux-user: make process_pending_signals thread-safe
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Trivial
 <qemu-trivial@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Message-Id: <Z2MRTQ.QBPUAAPP6M0X1@effective-light.com>
In-Reply-To: <CAFEAcA8koCJTd5JY4NWX26EPpHq_QMwi11-FYf4OJhZyhecT-w@mail.gmail.com>
References: <20210524024655.11115-1-someguy@effective-light.com>
 <CAFEAcA_Z-fe1pT8=-TCFxVkpBpXpKXD+vKi1i=CBFLg4ANYE1A@mail.gmail.com>
 <CIHRTQ.JLYE6DOVVWC1@effective-light.com>
 <CAFEAcA8koCJTd5JY4NWX26EPpHq_QMwi11-FYf4OJhZyhecT-w@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass client-ip=68.65.122.27;
 envelope-from=someguy@effective-light.com; helo=MTA-07-4.privateemail.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 27 May 2021 12:16:26 -0000



On Thu, May 27 2021 at 11:45:26 AM +0100, Peter Maydell 
<peter.maydell@linaro.org> wrote:
> What issue are we trying to fix by making this change ?
I suppose that it wouldn't fix any issues in the current state of 
affairs,
maybe it is something to reconsider if glibc ever changes such that,
sigprocmask is no longer MT-safe (which is within reason since the MT
behavior of sigprocmask is undefined by POSIX).



