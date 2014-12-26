Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y4XOZ-0002vO-DD
	for mharc-qemu-trivial@gnu.org; Fri, 26 Dec 2014 11:05:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <den-lists@parallels.com>) id 1Y4RwV-0007bH-A7
	for qemu-trivial@nongnu.org; Fri, 26 Dec 2014 05:16:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <den-lists@parallels.com>) id 1Y4RwU-0002MP-FD
	for qemu-trivial@nongnu.org; Fri, 26 Dec 2014 05:16:23 -0500
Received: from relay.parallels.com ([195.214.232.42]:44017)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <den-lists@parallels.com>)
	id 1Y4RwQ-0002KS-5T; Fri, 26 Dec 2014 05:16:18 -0500
Received: from [10.30.3.11] (helo=mail.sw.ru)
	by relay.parallels.com with esmtps (TLSv1:AES128-SHA:128) (Exim 4.84)
	(envelope-from <den-lists@parallels.com>)
	id 1Y4RwI-0003jY-Qp; Fri, 26 Dec 2014 13:16:10 +0300
Received: from irbis.local (10.30.2.139) by mail.sw.ru (10.30.3.11) with
	Microsoft SMTP Server (TLS) id 14.3.210.2;
	Fri, 26 Dec 2014 13:16:10 +0300
Message-ID: <549D356A.4050506@parallels.com>
Date: Fri, 26 Dec 2014 13:16:10 +0300
From: "Denis V. Lunev" <den-lists@parallels.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Tiejun Chen
	<tiejun.chen@intel.com>
References: <1419581126-12927-1-git-send-email-tiejun.chen@intel.com>
	<CAFEAcA9yR2FPUF-T_ehMS4Yd0SL91mVADYwhDAuxCbkhQnNZiA@mail.gmail.com>
In-Reply-To: <CAFEAcA9yR2FPUF-T_ehMS4Yd0SL91mVADYwhDAuxCbkhQnNZiA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.30.2.139]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.214.232.42
X-Mailman-Approved-At: Fri, 26 Dec 2014 11:05:41 -0500
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, kvm-devel <kvm@vger.kernel.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] kvm_irqchip_assign_irqfd:
 just set irqfd in case of kvm_irqfds_enabled()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Dec 2014 10:16:24 -0000

On 26/12/14 13:00, Peter Maydell wrote:
> On 26 December 2014 at 08:05, Tiejun Chen <tiejun.chen@intel.com> wrote:
>> We should avoid to set irqfd{} unconditionally.
>>
>> Signed-off-by: Tiejun Chen <tiejun.chen@intel.com>
>
> Is there a hot path that we use this on such that the difference
> in code order matters at all?
>
> thanks
> -- PMM
>

IMHO the patch does not change anything even on hot-hot path.
the declaration 'struct kvm_irqfd irqfd = {};' will
result in memset inside.

Thus in order to achieve declared goal author should
declare
    struct kvm_irqfd irqfd;
and perform
    memset(&irqfd, 0, sizeof(irqfd));
later after the check.

Regards,
	Den

